// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFEdgeStruct extends BaseStruct {
  NFEdgeStruct({
    String? id,
  }) : _id = id;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static NFEdgeStruct fromMap(Map<String, dynamic> data) => NFEdgeStruct(
        id: data['id'] as String?,
      );

  static NFEdgeStruct? maybeFromMap(dynamic data) =>
      data is Map ? NFEdgeStruct.fromMap(data.cast<String, dynamic>()) : null;

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

  static NFEdgeStruct fromSerializableMap(Map<String, dynamic> data) =>
      NFEdgeStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NFEdgeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFEdgeStruct && id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([id]);
}

NFEdgeStruct createNFEdgeStruct({
  String? id,
}) =>
    NFEdgeStruct(
      id: id,
    );
