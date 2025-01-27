// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFEdgeStruct extends BaseStruct {
  NFEdgeStruct({
    NFEdgeIdStruct? edgeId,
    NFNodeReferenceStruct? sourceNodeReference,
    NFNodeReferenceStruct? targetNodeReference,
    NFEdgeCapabilitiesStruct? edgeCapabilities,
  })  : _edgeId = edgeId,
        _sourceNodeReference = sourceNodeReference,
        _targetNodeReference = targetNodeReference,
        _edgeCapabilities = edgeCapabilities;

  // "edge_id" field.
  NFEdgeIdStruct? _edgeId;
  NFEdgeIdStruct get edgeId => _edgeId ?? NFEdgeIdStruct();
  set edgeId(NFEdgeIdStruct? val) => _edgeId = val;

  void updateEdgeId(Function(NFEdgeIdStruct) updateFn) {
    updateFn(_edgeId ??= NFEdgeIdStruct());
  }

  bool hasEdgeId() => _edgeId != null;

  // "source_node_reference" field.
  NFNodeReferenceStruct? _sourceNodeReference;
  NFNodeReferenceStruct get sourceNodeReference =>
      _sourceNodeReference ?? NFNodeReferenceStruct();
  set sourceNodeReference(NFNodeReferenceStruct? val) =>
      _sourceNodeReference = val;

  void updateSourceNodeReference(Function(NFNodeReferenceStruct) updateFn) {
    updateFn(_sourceNodeReference ??= NFNodeReferenceStruct());
  }

  bool hasSourceNodeReference() => _sourceNodeReference != null;

  // "target_node_reference" field.
  NFNodeReferenceStruct? _targetNodeReference;
  NFNodeReferenceStruct get targetNodeReference =>
      _targetNodeReference ?? NFNodeReferenceStruct();
  set targetNodeReference(NFNodeReferenceStruct? val) =>
      _targetNodeReference = val;

  void updateTargetNodeReference(Function(NFNodeReferenceStruct) updateFn) {
    updateFn(_targetNodeReference ??= NFNodeReferenceStruct());
  }

  bool hasTargetNodeReference() => _targetNodeReference != null;

  // "edge_capabilities" field.
  NFEdgeCapabilitiesStruct? _edgeCapabilities;
  NFEdgeCapabilitiesStruct get edgeCapabilities =>
      _edgeCapabilities ?? NFEdgeCapabilitiesStruct();
  set edgeCapabilities(NFEdgeCapabilitiesStruct? val) =>
      _edgeCapabilities = val;

  void updateEdgeCapabilities(Function(NFEdgeCapabilitiesStruct) updateFn) {
    updateFn(_edgeCapabilities ??= NFEdgeCapabilitiesStruct());
  }

  bool hasEdgeCapabilities() => _edgeCapabilities != null;

  static NFEdgeStruct fromMap(Map<String, dynamic> data) => NFEdgeStruct(
        edgeId: data['edge_id'] is NFEdgeIdStruct
            ? data['edge_id']
            : NFEdgeIdStruct.maybeFromMap(data['edge_id']),
        sourceNodeReference: data['source_node_reference']
                is NFNodeReferenceStruct
            ? data['source_node_reference']
            : NFNodeReferenceStruct.maybeFromMap(data['source_node_reference']),
        targetNodeReference: data['target_node_reference']
                is NFNodeReferenceStruct
            ? data['target_node_reference']
            : NFNodeReferenceStruct.maybeFromMap(data['target_node_reference']),
        edgeCapabilities: data['edge_capabilities'] is NFEdgeCapabilitiesStruct
            ? data['edge_capabilities']
            : NFEdgeCapabilitiesStruct.maybeFromMap(data['edge_capabilities']),
      );

  static NFEdgeStruct? maybeFromMap(dynamic data) =>
      data is Map ? NFEdgeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'edge_id': _edgeId?.toMap(),
        'source_node_reference': _sourceNodeReference?.toMap(),
        'target_node_reference': _targetNodeReference?.toMap(),
        'edge_capabilities': _edgeCapabilities?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'edge_id': serializeParam(
          _edgeId,
          ParamType.DataStruct,
        ),
        'source_node_reference': serializeParam(
          _sourceNodeReference,
          ParamType.DataStruct,
        ),
        'target_node_reference': serializeParam(
          _targetNodeReference,
          ParamType.DataStruct,
        ),
        'edge_capabilities': serializeParam(
          _edgeCapabilities,
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
        sourceNodeReference: deserializeStructParam(
          data['source_node_reference'],
          ParamType.DataStruct,
          false,
          structBuilder: NFNodeReferenceStruct.fromSerializableMap,
        ),
        targetNodeReference: deserializeStructParam(
          data['target_node_reference'],
          ParamType.DataStruct,
          false,
          structBuilder: NFNodeReferenceStruct.fromSerializableMap,
        ),
        edgeCapabilities: deserializeStructParam(
          data['edge_capabilities'],
          ParamType.DataStruct,
          false,
          structBuilder: NFEdgeCapabilitiesStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'NFEdgeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFEdgeStruct &&
        edgeId == other.edgeId &&
        sourceNodeReference == other.sourceNodeReference &&
        targetNodeReference == other.targetNodeReference &&
        edgeCapabilities == other.edgeCapabilities;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [edgeId, sourceNodeReference, targetNodeReference, edgeCapabilities]);
}

NFEdgeStruct createNFEdgeStruct({
  NFEdgeIdStruct? edgeId,
  NFNodeReferenceStruct? sourceNodeReference,
  NFNodeReferenceStruct? targetNodeReference,
  NFEdgeCapabilitiesStruct? edgeCapabilities,
}) =>
    NFEdgeStruct(
      edgeId: edgeId ?? NFEdgeIdStruct(),
      sourceNodeReference: sourceNodeReference ?? NFNodeReferenceStruct(),
      targetNodeReference: targetNodeReference ?? NFNodeReferenceStruct(),
      edgeCapabilities: edgeCapabilities ?? NFEdgeCapabilitiesStruct(),
    );
