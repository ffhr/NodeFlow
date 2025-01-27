// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFNodeIdStruct extends BaseStruct {
  NFNodeIdStruct({
    NFEntityTypeShort? entityTypeShort,
    String? separator,
    int? sequential,
    String? custom,
  })  : _entityTypeShort = entityTypeShort,
        _separator = separator,
        _sequential = sequential,
        _custom = custom;

  // "entity_type_short" field.
  NFEntityTypeShort? _entityTypeShort;
  NFEntityTypeShort get entityTypeShort =>
      _entityTypeShort ?? NFEntityTypeShort.nd;
  set entityTypeShort(NFEntityTypeShort? val) => _entityTypeShort = val;

  bool hasEntityTypeShort() => _entityTypeShort != null;

  // "separator" field.
  String? _separator;
  String get separator => _separator ?? '_';
  set separator(String? val) => _separator = val;

  bool hasSeparator() => _separator != null;

  // "sequential" field.
  int? _sequential;
  int get sequential => _sequential ?? 0;
  set sequential(int? val) => _sequential = val;

  void incrementSequential(int amount) => sequential = sequential + amount;

  bool hasSequential() => _sequential != null;

  // "custom" field.
  String? _custom;
  String get custom => _custom ?? '200001';
  set custom(String? val) => _custom = val;

  bool hasCustom() => _custom != null;

  static NFNodeIdStruct fromMap(Map<String, dynamic> data) => NFNodeIdStruct(
        entityTypeShort: data['entity_type_short'] is NFEntityTypeShort
            ? data['entity_type_short']
            : deserializeEnum<NFEntityTypeShort>(data['entity_type_short']),
        separator: data['separator'] as String?,
        sequential: castToType<int>(data['sequential']),
        custom: data['custom'] as String?,
      );

  static NFNodeIdStruct? maybeFromMap(dynamic data) =>
      data is Map ? NFNodeIdStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'entity_type_short': _entityTypeShort?.serialize(),
        'separator': _separator,
        'sequential': _sequential,
        'custom': _custom,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'entity_type_short': serializeParam(
          _entityTypeShort,
          ParamType.Enum,
        ),
        'separator': serializeParam(
          _separator,
          ParamType.String,
        ),
        'sequential': serializeParam(
          _sequential,
          ParamType.int,
        ),
        'custom': serializeParam(
          _custom,
          ParamType.String,
        ),
      }.withoutNulls;

  static NFNodeIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      NFNodeIdStruct(
        entityTypeShort: deserializeParam<NFEntityTypeShort>(
          data['entity_type_short'],
          ParamType.Enum,
          false,
        ),
        separator: deserializeParam(
          data['separator'],
          ParamType.String,
          false,
        ),
        sequential: deserializeParam(
          data['sequential'],
          ParamType.int,
          false,
        ),
        custom: deserializeParam(
          data['custom'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NFNodeIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFNodeIdStruct &&
        entityTypeShort == other.entityTypeShort &&
        separator == other.separator &&
        sequential == other.sequential &&
        custom == other.custom;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([entityTypeShort, separator, sequential, custom]);
}

NFNodeIdStruct createNFNodeIdStruct({
  NFEntityTypeShort? entityTypeShort,
  String? separator,
  int? sequential,
  String? custom,
}) =>
    NFNodeIdStruct(
      entityTypeShort: entityTypeShort,
      separator: separator,
      sequential: sequential,
      custom: custom,
    );
