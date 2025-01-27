// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFNodeStruct extends BaseStruct {
  NFNodeStruct({
    NFNodeIdStruct? nodeId,
    NFFrameStruct? virtualFrame,
    NFFrameStruct? viewportFrame,
    List<NFInputSocketStruct>? inputSockets,
    List<NFOutputSocketStruct>? outputSockets,
    String? childDiagramId,
  })  : _nodeId = nodeId,
        _virtualFrame = virtualFrame,
        _viewportFrame = viewportFrame,
        _inputSockets = inputSockets,
        _outputSockets = outputSockets,
        _childDiagramId = childDiagramId;

  // "node_id" field.
  NFNodeIdStruct? _nodeId;
  NFNodeIdStruct get nodeId => _nodeId ?? NFNodeIdStruct();
  set nodeId(NFNodeIdStruct? val) => _nodeId = val;

  void updateNodeId(Function(NFNodeIdStruct) updateFn) {
    updateFn(_nodeId ??= NFNodeIdStruct());
  }

  bool hasNodeId() => _nodeId != null;

  // "virtual_frame" field.
  NFFrameStruct? _virtualFrame;
  NFFrameStruct get virtualFrame => _virtualFrame ?? NFFrameStruct();
  set virtualFrame(NFFrameStruct? val) => _virtualFrame = val;

  void updateVirtualFrame(Function(NFFrameStruct) updateFn) {
    updateFn(_virtualFrame ??= NFFrameStruct());
  }

  bool hasVirtualFrame() => _virtualFrame != null;

  // "viewport_frame" field.
  NFFrameStruct? _viewportFrame;
  NFFrameStruct get viewportFrame => _viewportFrame ?? NFFrameStruct();
  set viewportFrame(NFFrameStruct? val) => _viewportFrame = val;

  void updateViewportFrame(Function(NFFrameStruct) updateFn) {
    updateFn(_viewportFrame ??= NFFrameStruct());
  }

  bool hasViewportFrame() => _viewportFrame != null;

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
  String? _childDiagramId;
  String get childDiagramId => _childDiagramId ?? '';
  set childDiagramId(String? val) => _childDiagramId = val;

  bool hasChildDiagramId() => _childDiagramId != null;

  static NFNodeStruct fromMap(Map<String, dynamic> data) => NFNodeStruct(
        nodeId: data['node_id'] is NFNodeIdStruct
            ? data['node_id']
            : NFNodeIdStruct.maybeFromMap(data['node_id']),
        virtualFrame: data['virtual_frame'] is NFFrameStruct
            ? data['virtual_frame']
            : NFFrameStruct.maybeFromMap(data['virtual_frame']),
        viewportFrame: data['viewport_frame'] is NFFrameStruct
            ? data['viewport_frame']
            : NFFrameStruct.maybeFromMap(data['viewport_frame']),
        inputSockets: getStructList(
          data['input_sockets'],
          NFInputSocketStruct.fromMap,
        ),
        outputSockets: getStructList(
          data['output_sockets'],
          NFOutputSocketStruct.fromMap,
        ),
        childDiagramId: data['child_diagram_id'] as String?,
      );

  static NFNodeStruct? maybeFromMap(dynamic data) =>
      data is Map ? NFNodeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'node_id': _nodeId?.toMap(),
        'virtual_frame': _virtualFrame?.toMap(),
        'viewport_frame': _viewportFrame?.toMap(),
        'input_sockets': _inputSockets?.map((e) => e.toMap()).toList(),
        'output_sockets': _outputSockets?.map((e) => e.toMap()).toList(),
        'child_diagram_id': _childDiagramId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'node_id': serializeParam(
          _nodeId,
          ParamType.DataStruct,
        ),
        'virtual_frame': serializeParam(
          _virtualFrame,
          ParamType.DataStruct,
        ),
        'viewport_frame': serializeParam(
          _viewportFrame,
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
          ParamType.String,
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
        virtualFrame: deserializeStructParam(
          data['virtual_frame'],
          ParamType.DataStruct,
          false,
          structBuilder: NFFrameStruct.fromSerializableMap,
        ),
        viewportFrame: deserializeStructParam(
          data['viewport_frame'],
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
        childDiagramId: deserializeParam(
          data['child_diagram_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NFNodeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is NFNodeStruct &&
        nodeId == other.nodeId &&
        virtualFrame == other.virtualFrame &&
        viewportFrame == other.viewportFrame &&
        listEquality.equals(inputSockets, other.inputSockets) &&
        listEquality.equals(outputSockets, other.outputSockets) &&
        childDiagramId == other.childDiagramId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        nodeId,
        virtualFrame,
        viewportFrame,
        inputSockets,
        outputSockets,
        childDiagramId
      ]);
}

NFNodeStruct createNFNodeStruct({
  NFNodeIdStruct? nodeId,
  NFFrameStruct? virtualFrame,
  NFFrameStruct? viewportFrame,
  String? childDiagramId,
}) =>
    NFNodeStruct(
      nodeId: nodeId ?? NFNodeIdStruct(),
      virtualFrame: virtualFrame ?? NFFrameStruct(),
      viewportFrame: viewportFrame ?? NFFrameStruct(),
      childDiagramId: childDiagramId,
    );
