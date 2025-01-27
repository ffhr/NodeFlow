// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFNodeStruct extends BaseStruct {
  NFNodeStruct({
    NFNodeIdStruct? nodeId,
    String? label,
    NFFrameStruct? virtualFrame,
    List<NFInputSocketStruct>? inputSockets,
    List<NFOutputSocketStruct>? outputSockets,
    NFDiagramIdStruct? childDiagramId,
    NFFrameStruct? viewportFrame,
    NFNodeCapabilitiesStruct? nodeCapabilities,
    NFNodeInteractionStateStruct? nodeInteractionState,
    NFVisibilityStruct? nodeVisibility,
  })  : _nodeId = nodeId,
        _label = label,
        _virtualFrame = virtualFrame,
        _inputSockets = inputSockets,
        _outputSockets = outputSockets,
        _childDiagramId = childDiagramId,
        _viewportFrame = viewportFrame,
        _nodeCapabilities = nodeCapabilities,
        _nodeInteractionState = nodeInteractionState,
        _nodeVisibility = nodeVisibility;

  // "node_id" field.
  NFNodeIdStruct? _nodeId;
  NFNodeIdStruct get nodeId => _nodeId ?? NFNodeIdStruct();
  set nodeId(NFNodeIdStruct? val) => _nodeId = val;

  void updateNodeId(Function(NFNodeIdStruct) updateFn) {
    updateFn(_nodeId ??= NFNodeIdStruct());
  }

  bool hasNodeId() => _nodeId != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '<NODE>';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  // "virtual_frame" field.
  NFFrameStruct? _virtualFrame;
  NFFrameStruct get virtualFrame => _virtualFrame ?? NFFrameStruct();
  set virtualFrame(NFFrameStruct? val) => _virtualFrame = val;

  void updateVirtualFrame(Function(NFFrameStruct) updateFn) {
    updateFn(_virtualFrame ??= NFFrameStruct());
  }

  bool hasVirtualFrame() => _virtualFrame != null;

  // "input_sockets" field.
  List<NFInputSocketStruct>? _inputSockets;
  List<NFInputSocketStruct> get inputSockets => _inputSockets ?? const [];
  set inputSockets(List<NFInputSocketStruct>? val) => _inputSockets = val;

  void updateInputSockets(Function(List<NFInputSocketStruct>) updateFn) {
    updateFn(_inputSockets ??= []);
  }

  bool hasInputSockets() => _inputSockets != null;

  // "output_sockets" field.
  List<NFOutputSocketStruct>? _outputSockets;
  List<NFOutputSocketStruct> get outputSockets => _outputSockets ?? const [];
  set outputSockets(List<NFOutputSocketStruct>? val) => _outputSockets = val;

  void updateOutputSockets(Function(List<NFOutputSocketStruct>) updateFn) {
    updateFn(_outputSockets ??= []);
  }

  bool hasOutputSockets() => _outputSockets != null;

  // "child_diagram_id" field.
  NFDiagramIdStruct? _childDiagramId;
  NFDiagramIdStruct get childDiagramId =>
      _childDiagramId ?? NFDiagramIdStruct();
  set childDiagramId(NFDiagramIdStruct? val) => _childDiagramId = val;

  void updateChildDiagramId(Function(NFDiagramIdStruct) updateFn) {
    updateFn(_childDiagramId ??= NFDiagramIdStruct());
  }

  bool hasChildDiagramId() => _childDiagramId != null;

  // "viewport_frame" field.
  NFFrameStruct? _viewportFrame;
  NFFrameStruct get viewportFrame => _viewportFrame ?? NFFrameStruct();
  set viewportFrame(NFFrameStruct? val) => _viewportFrame = val;

  void updateViewportFrame(Function(NFFrameStruct) updateFn) {
    updateFn(_viewportFrame ??= NFFrameStruct());
  }

  bool hasViewportFrame() => _viewportFrame != null;

  // "node_capabilities" field.
  NFNodeCapabilitiesStruct? _nodeCapabilities;
  NFNodeCapabilitiesStruct get nodeCapabilities =>
      _nodeCapabilities ?? NFNodeCapabilitiesStruct();
  set nodeCapabilities(NFNodeCapabilitiesStruct? val) =>
      _nodeCapabilities = val;

  void updateNodeCapabilities(Function(NFNodeCapabilitiesStruct) updateFn) {
    updateFn(_nodeCapabilities ??= NFNodeCapabilitiesStruct());
  }

  bool hasNodeCapabilities() => _nodeCapabilities != null;

  // "node_interaction_state" field.
  NFNodeInteractionStateStruct? _nodeInteractionState;
  NFNodeInteractionStateStruct get nodeInteractionState =>
      _nodeInteractionState ?? NFNodeInteractionStateStruct();
  set nodeInteractionState(NFNodeInteractionStateStruct? val) =>
      _nodeInteractionState = val;

  void updateNodeInteractionState(
      Function(NFNodeInteractionStateStruct) updateFn) {
    updateFn(_nodeInteractionState ??= NFNodeInteractionStateStruct());
  }

  bool hasNodeInteractionState() => _nodeInteractionState != null;

  // "node_visibility" field.
  NFVisibilityStruct? _nodeVisibility;
  NFVisibilityStruct get nodeVisibility =>
      _nodeVisibility ?? NFVisibilityStruct();
  set nodeVisibility(NFVisibilityStruct? val) => _nodeVisibility = val;

  void updateNodeVisibility(Function(NFVisibilityStruct) updateFn) {
    updateFn(_nodeVisibility ??= NFVisibilityStruct());
  }

  bool hasNodeVisibility() => _nodeVisibility != null;

  static NFNodeStruct fromMap(Map<String, dynamic> data) => NFNodeStruct(
        nodeId: data['node_id'] is NFNodeIdStruct
            ? data['node_id']
            : NFNodeIdStruct.maybeFromMap(data['node_id']),
        label: data['label'] as String?,
        virtualFrame: data['virtual_frame'] is NFFrameStruct
            ? data['virtual_frame']
            : NFFrameStruct.maybeFromMap(data['virtual_frame']),
        inputSockets: getStructList(
          data['input_sockets'],
          NFInputSocketStruct.fromMap,
        ),
        outputSockets: getStructList(
          data['output_sockets'],
          NFOutputSocketStruct.fromMap,
        ),
        childDiagramId: data['child_diagram_id'] is NFDiagramIdStruct
            ? data['child_diagram_id']
            : NFDiagramIdStruct.maybeFromMap(data['child_diagram_id']),
        viewportFrame: data['viewport_frame'] is NFFrameStruct
            ? data['viewport_frame']
            : NFFrameStruct.maybeFromMap(data['viewport_frame']),
        nodeCapabilities: data['node_capabilities'] is NFNodeCapabilitiesStruct
            ? data['node_capabilities']
            : NFNodeCapabilitiesStruct.maybeFromMap(data['node_capabilities']),
        nodeInteractionState:
            data['node_interaction_state'] is NFNodeInteractionStateStruct
                ? data['node_interaction_state']
                : NFNodeInteractionStateStruct.maybeFromMap(
                    data['node_interaction_state']),
        nodeVisibility: data['node_visibility'] is NFVisibilityStruct
            ? data['node_visibility']
            : NFVisibilityStruct.maybeFromMap(data['node_visibility']),
      );

  static NFNodeStruct? maybeFromMap(dynamic data) =>
      data is Map ? NFNodeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'node_id': _nodeId?.toMap(),
        'label': _label,
        'virtual_frame': _virtualFrame?.toMap(),
        'input_sockets': _inputSockets?.map((e) => e.toMap()).toList(),
        'output_sockets': _outputSockets?.map((e) => e.toMap()).toList(),
        'child_diagram_id': _childDiagramId?.toMap(),
        'viewport_frame': _viewportFrame?.toMap(),
        'node_capabilities': _nodeCapabilities?.toMap(),
        'node_interaction_state': _nodeInteractionState?.toMap(),
        'node_visibility': _nodeVisibility?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'node_id': serializeParam(
          _nodeId,
          ParamType.DataStruct,
        ),
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'virtual_frame': serializeParam(
          _virtualFrame,
          ParamType.DataStruct,
        ),
        'input_sockets': serializeParam(
          _inputSockets,
          ParamType.DataStruct,
          isList: true,
        ),
        'output_sockets': serializeParam(
          _outputSockets,
          ParamType.DataStruct,
          isList: true,
        ),
        'child_diagram_id': serializeParam(
          _childDiagramId,
          ParamType.DataStruct,
        ),
        'viewport_frame': serializeParam(
          _viewportFrame,
          ParamType.DataStruct,
        ),
        'node_capabilities': serializeParam(
          _nodeCapabilities,
          ParamType.DataStruct,
        ),
        'node_interaction_state': serializeParam(
          _nodeInteractionState,
          ParamType.DataStruct,
        ),
        'node_visibility': serializeParam(
          _nodeVisibility,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static NFNodeStruct fromSerializableMap(Map<String, dynamic> data) =>
      NFNodeStruct(
        nodeId: deserializeStructParam(
          data['node_id'],
          ParamType.DataStruct,
          false,
          structBuilder: NFNodeIdStruct.fromSerializableMap,
        ),
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        virtualFrame: deserializeStructParam(
          data['virtual_frame'],
          ParamType.DataStruct,
          false,
          structBuilder: NFFrameStruct.fromSerializableMap,
        ),
        inputSockets: deserializeStructParam<NFInputSocketStruct>(
          data['input_sockets'],
          ParamType.DataStruct,
          true,
          structBuilder: NFInputSocketStruct.fromSerializableMap,
        ),
        outputSockets: deserializeStructParam<NFOutputSocketStruct>(
          data['output_sockets'],
          ParamType.DataStruct,
          true,
          structBuilder: NFOutputSocketStruct.fromSerializableMap,
        ),
        childDiagramId: deserializeStructParam(
          data['child_diagram_id'],
          ParamType.DataStruct,
          false,
          structBuilder: NFDiagramIdStruct.fromSerializableMap,
        ),
        viewportFrame: deserializeStructParam(
          data['viewport_frame'],
          ParamType.DataStruct,
          false,
          structBuilder: NFFrameStruct.fromSerializableMap,
        ),
        nodeCapabilities: deserializeStructParam(
          data['node_capabilities'],
          ParamType.DataStruct,
          false,
          structBuilder: NFNodeCapabilitiesStruct.fromSerializableMap,
        ),
        nodeInteractionState: deserializeStructParam(
          data['node_interaction_state'],
          ParamType.DataStruct,
          false,
          structBuilder: NFNodeInteractionStateStruct.fromSerializableMap,
        ),
        nodeVisibility: deserializeStructParam(
          data['node_visibility'],
          ParamType.DataStruct,
          false,
          structBuilder: NFVisibilityStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'NFNodeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is NFNodeStruct &&
        nodeId == other.nodeId &&
        label == other.label &&
        virtualFrame == other.virtualFrame &&
        listEquality.equals(inputSockets, other.inputSockets) &&
        listEquality.equals(outputSockets, other.outputSockets) &&
        childDiagramId == other.childDiagramId &&
        viewportFrame == other.viewportFrame &&
        nodeCapabilities == other.nodeCapabilities &&
        nodeInteractionState == other.nodeInteractionState &&
        nodeVisibility == other.nodeVisibility;
  }

  @override
  int get hashCode => const ListEquality().hash([
        nodeId,
        label,
        virtualFrame,
        inputSockets,
        outputSockets,
        childDiagramId,
        viewportFrame,
        nodeCapabilities,
        nodeInteractionState,
        nodeVisibility
      ]);
}

NFNodeStruct createNFNodeStruct({
  NFNodeIdStruct? nodeId,
  String? label,
  NFFrameStruct? virtualFrame,
  NFDiagramIdStruct? childDiagramId,
  NFFrameStruct? viewportFrame,
  NFNodeCapabilitiesStruct? nodeCapabilities,
  NFNodeInteractionStateStruct? nodeInteractionState,
  NFVisibilityStruct? nodeVisibility,
}) =>
    NFNodeStruct(
      nodeId: nodeId ?? NFNodeIdStruct(),
      label: label,
      virtualFrame: virtualFrame ?? NFFrameStruct(),
      childDiagramId: childDiagramId ?? NFDiagramIdStruct(),
      viewportFrame: viewportFrame ?? NFFrameStruct(),
      nodeCapabilities: nodeCapabilities ?? NFNodeCapabilitiesStruct(),
      nodeInteractionState:
          nodeInteractionState ?? NFNodeInteractionStateStruct(),
      nodeVisibility: nodeVisibility ?? NFVisibilityStruct(),
    );
