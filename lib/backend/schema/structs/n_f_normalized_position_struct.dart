// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFNormalizedPositionStruct extends BaseStruct {
  NFNormalizedPositionStruct({
    String? id,
  }) : _id = id;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static NFNormalizedPositionStruct fromMap(Map<String, dynamic> data) =>
      NFNormalizedPositionStruct(
        id: data['id'] as String?,
      );

  static NFNormalizedPositionStruct? maybeFromMap(dynamic data) => data is Map
      ? NFNormalizedPositionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static NFNormalizedPositionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NFNormalizedPositionStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NFNormalizedPositionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFNormalizedPositionStruct && id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([id]);
}

NFNormalizedPositionStruct createNFNormalizedPositionStruct({
  String? id,
}) =>
    NFNormalizedPositionStruct(
      id: id,
    );
