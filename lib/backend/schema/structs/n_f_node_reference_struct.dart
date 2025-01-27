// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFNodeReferenceStruct extends BaseStruct {
  NFNodeReferenceStruct({
    String? id,
  }) : _id = id;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static NFNodeReferenceStruct fromMap(Map<String, dynamic> data) =>
      NFNodeReferenceStruct(
        id: data['id'] as String?,
      );

  static NFNodeReferenceStruct? maybeFromMap(dynamic data) => data is Map
      ? NFNodeReferenceStruct.fromMap(data.cast<String, dynamic>())
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

  static NFNodeReferenceStruct fromSerializableMap(Map<String, dynamic> data) =>
      NFNodeReferenceStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NFNodeReferenceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFNodeReferenceStruct && id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([id]);
}

NFNodeReferenceStruct createNFNodeReferenceStruct({
  String? id,
}) =>
    NFNodeReferenceStruct(
      id: id,
    );
