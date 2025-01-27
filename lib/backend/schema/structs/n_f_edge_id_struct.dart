// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFEdgeIdStruct extends BaseStruct {
  NFEdgeIdStruct({
    NFEntityTypeShort? entityTypeShort,
    String? separator,
    String? id,
  })  : _entityTypeShort = entityTypeShort,
        _separator = separator,
        _id = id;

  // "entity_type_short" field.
  NFEntityTypeShort? _entityTypeShort;
  NFEntityTypeShort get entityTypeShort =>
      _entityTypeShort ?? NFEntityTypeShort.ed;
  set entityTypeShort(NFEntityTypeShort? val) => _entityTypeShort = val;

  bool hasEntityTypeShort() => _entityTypeShort != null;

  // "separator" field.
  String? _separator;
  String get separator => _separator ?? '_';
  set separator(String? val) => _separator = val;

  bool hasSeparator() => _separator != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '300001';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static NFEdgeIdStruct fromMap(Map<String, dynamic> data) => NFEdgeIdStruct(
        entityTypeShort: data['entity_type_short'] is NFEntityTypeShort
            ? data['entity_type_short']
            : deserializeEnum<NFEntityTypeShort>(data['entity_type_short']),
        separator: data['separator'] as String?,
        id: data['id'] as String?,
      );

  static NFEdgeIdStruct? maybeFromMap(dynamic data) =>
      data is Map ? NFEdgeIdStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'entity_type_short': _entityTypeShort?.serialize(),
        'separator': _separator,
        'id': _id,
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
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static NFEdgeIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      NFEdgeIdStruct(
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
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NFEdgeIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFEdgeIdStruct &&
        entityTypeShort == other.entityTypeShort &&
        separator == other.separator &&
        id == other.id;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([entityTypeShort, separator, id]);
}

NFEdgeIdStruct createNFEdgeIdStruct({
  NFEntityTypeShort? entityTypeShort,
  String? separator,
  String? id,
}) =>
    NFEdgeIdStruct(
      entityTypeShort: entityTypeShort,
      separator: separator,
      id: id,
    );
