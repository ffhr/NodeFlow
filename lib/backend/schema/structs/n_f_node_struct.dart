// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFNodeStruct extends BaseStruct {
  NFNodeStruct({
    String? id,
  }) : _id = id;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static NFNodeStruct fromMap(Map<String, dynamic> data) => NFNodeStruct(
        id: data['id'] as String?,
      );

  static NFNodeStruct? maybeFromMap(dynamic data) =>
      data is Map ? NFNodeStruct.fromMap(data.cast<String, dynamic>()) : null;

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

  static NFNodeStruct fromSerializableMap(Map<String, dynamic> data) =>
      NFNodeStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NFNodeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFNodeStruct && id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([id]);
}

NFNodeStruct createNFNodeStruct({
  String? id,
}) =>
    NFNodeStruct(
      id: id,
    );
