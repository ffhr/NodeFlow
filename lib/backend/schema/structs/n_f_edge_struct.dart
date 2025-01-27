// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFEdgeStruct extends BaseStruct {
  NFEdgeStruct({
    NFEdgeIdStruct? edgeId,
  }) : _edgeId = edgeId;

  // "edge_id" field.
  NFEdgeIdStruct? _edgeId;
  NFEdgeIdStruct get edgeId => _edgeId ?? NFEdgeIdStruct();
  set edgeId(NFEdgeIdStruct? val) => _edgeId = val;

  void updateEdgeId(Function(NFEdgeIdStruct) updateFn) {
    updateFn(_edgeId ??= NFEdgeIdStruct());
  }

  bool hasEdgeId() => _edgeId != null;

  static NFEdgeStruct fromMap(Map<String, dynamic> data) => NFEdgeStruct(
        edgeId: data['edge_id'] is NFEdgeIdStruct
            ? data['edge_id']
            : NFEdgeIdStruct.maybeFromMap(data['edge_id']),
      );

  static NFEdgeStruct? maybeFromMap(dynamic data) =>
      data is Map ? NFEdgeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'edge_id': _edgeId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'edge_id': serializeParam(
          _edgeId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static NFEdgeStruct fromSerializableMap(Map<String, dynamic> data) =>
      NFEdgeStruct(
        edgeId: deserializeStructParam(
          data['edge_id'],
          ParamType.DataStruct,
          false,
          structBuilder: NFEdgeIdStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'NFEdgeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFEdgeStruct && edgeId == other.edgeId;
  }

  @override
  int get hashCode => const ListEquality().hash([edgeId]);
}

NFEdgeStruct createNFEdgeStruct({
  NFEdgeIdStruct? edgeId,
}) =>
    NFEdgeStruct(
      edgeId: edgeId ?? NFEdgeIdStruct(),
    );
