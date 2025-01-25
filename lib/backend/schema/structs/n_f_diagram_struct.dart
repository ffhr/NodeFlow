// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFDiagramStruct extends BaseStruct {
  NFDiagramStruct({
    String? id,
  }) : _id = id;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static NFDiagramStruct fromMap(Map<String, dynamic> data) => NFDiagramStruct(
        id: data['id'] as String?,
      );

  static NFDiagramStruct? maybeFromMap(dynamic data) => data is Map
      ? NFDiagramStruct.fromMap(data.cast<String, dynamic>())
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

  static NFDiagramStruct fromSerializableMap(Map<String, dynamic> data) =>
      NFDiagramStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NFDiagramStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFDiagramStruct && id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([id]);
}

NFDiagramStruct createNFDiagramStruct({
  String? id,
}) =>
    NFDiagramStruct(
      id: id,
    );
