// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFNodeReferenceStruct extends BaseStruct {
  NFNodeReferenceStruct({
    List<NFNodeIdStruct>? rootToParent,
    NFNodeIdStruct? nodeId,
  })  : _rootToParent = rootToParent,
        _nodeId = nodeId;

  // "root_to_parent" field.
  List<NFNodeIdStruct>? _rootToParent;
  List<NFNodeIdStruct> get rootToParent => _rootToParent ?? const [];
  set rootToParent(List<NFNodeIdStruct>? val) => _rootToParent = val;

  void updateRootToParent(Function(List<NFNodeIdStruct>) updateFn) {
    updateFn(_rootToParent ??= []);
  }

  bool hasRootToParent() => _rootToParent != null;

  // "node_id" field.
  NFNodeIdStruct? _nodeId;
  NFNodeIdStruct get nodeId => _nodeId ?? NFNodeIdStruct();
  set nodeId(NFNodeIdStruct? val) => _nodeId = val;

  void updateNodeId(Function(NFNodeIdStruct) updateFn) {
    updateFn(_nodeId ??= NFNodeIdStruct());
  }

  bool hasNodeId() => _nodeId != null;

  static NFNodeReferenceStruct fromMap(Map<String, dynamic> data) =>
      NFNodeReferenceStruct(
        rootToParent: getStructList(
          data['root_to_parent'],
          NFNodeIdStruct.fromMap,
        ),
        nodeId: data['node_id'] is NFNodeIdStruct
            ? data['node_id']
            : NFNodeIdStruct.maybeFromMap(data['node_id']),
      );

  static NFNodeReferenceStruct? maybeFromMap(dynamic data) => data is Map
      ? NFNodeReferenceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'root_to_parent': _rootToParent?.map((e) => e.toMap()).toList(),
        'node_id': _nodeId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'root_to_parent': serializeParam(
          _rootToParent,
          ParamType.DataStruct,
          isList: true,
        ),
        'node_id': serializeParam(
          _nodeId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static NFNodeReferenceStruct fromSerializableMap(Map<String, dynamic> data) =>
      NFNodeReferenceStruct(
        rootToParent: deserializeStructParam<NFNodeIdStruct>(
          data['root_to_parent'],
          ParamType.DataStruct,
          true,
          structBuilder: NFNodeIdStruct.fromSerializableMap,
        ),
        nodeId: deserializeStructParam(
          data['node_id'],
          ParamType.DataStruct,
          false,
          structBuilder: NFNodeIdStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'NFNodeReferenceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is NFNodeReferenceStruct &&
        listEquality.equals(rootToParent, other.rootToParent) &&
        nodeId == other.nodeId;
  }

  @override
  int get hashCode => const ListEquality().hash([rootToParent, nodeId]);
}

NFNodeReferenceStruct createNFNodeReferenceStruct({
  NFNodeIdStruct? nodeId,
}) =>
    NFNodeReferenceStruct(
      nodeId: nodeId ?? NFNodeIdStruct(),
    );
