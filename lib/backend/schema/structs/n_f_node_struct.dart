// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFNodeStruct extends BaseStruct {
  NFNodeStruct({
    String? id,
    NFFrameStruct? virtualFrame,
    NFFrameStruct? viewportFrame,
    List<NFInputSocketStruct>? inputSockets,
    List<NFOutputSocketStruct>? outputSockets,
  })  : _id = id,
        _virtualFrame = virtualFrame,
        _viewportFrame = viewportFrame,
        _inputSockets = inputSockets,
        _outputSockets = outputSockets;

  // "id" field.
  String? _id;
  String get id => _id ?? 'nd_000001';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

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

  static NFNodeStruct fromMap(Map<String, dynamic> data) => NFNodeStruct(
        id: data['id'] as String?,
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
      );

  static NFNodeStruct? maybeFromMap(dynamic data) =>
      data is Map ? NFNodeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'virtual_frame': _virtualFrame?.toMap(),
        'viewport_frame': _viewportFrame?.toMap(),
        'input_sockets': _inputSockets?.map((e) => e.toMap()).toList(),
        'output_sockets': _outputSockets?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
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
      }.withoutNulls;

  static NFNodeStruct fromSerializableMap(Map<String, dynamic> data) =>
      NFNodeStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
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
      );

  @override
  String toString() => 'NFNodeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is NFNodeStruct &&
        id == other.id &&
        virtualFrame == other.virtualFrame &&
        viewportFrame == other.viewportFrame &&
        listEquality.equals(inputSockets, other.inputSockets) &&
        listEquality.equals(outputSockets, other.outputSockets);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, virtualFrame, viewportFrame, inputSockets, outputSockets]);
}

NFNodeStruct createNFNodeStruct({
  String? id,
  NFFrameStruct? virtualFrame,
  NFFrameStruct? viewportFrame,
}) =>
    NFNodeStruct(
      id: id,
      virtualFrame: virtualFrame ?? NFFrameStruct(),
      viewportFrame: viewportFrame ?? NFFrameStruct(),
    );
