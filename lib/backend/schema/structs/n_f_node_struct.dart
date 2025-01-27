// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFNodeStruct extends BaseStruct {
  NFNodeStruct({
    String? id,
    double? virtualPositionX,
    double? relativePositionX,
    double? virtualPositionY,
    double? relativePositionY,
    double? virtualWidth,
    double? relativeWidth,
    double? virtualHeight,
    double? relativeHeight,
    List<NFInputSocketStruct>? inputSockets,
    List<NFOutputSocketStruct>? outputSockets,
  })  : _id = id,
        _virtualPositionX = virtualPositionX,
        _relativePositionX = relativePositionX,
        _virtualPositionY = virtualPositionY,
        _relativePositionY = relativePositionY,
        _virtualWidth = virtualWidth,
        _relativeWidth = relativeWidth,
        _virtualHeight = virtualHeight,
        _relativeHeight = relativeHeight,
        _inputSockets = inputSockets,
        _outputSockets = outputSockets;

  // "id" field.
  String? _id;
  String get id => _id ?? '-1';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "virtual_position_x" field.
  double? _virtualPositionX;
  double get virtualPositionX => _virtualPositionX ?? 0.0;
  set virtualPositionX(double? val) => _virtualPositionX = val;

  void incrementVirtualPositionX(double amount) =>
      virtualPositionX = virtualPositionX + amount;

  bool hasVirtualPositionX() => _virtualPositionX != null;

  // "relative_position_x" field.
  double? _relativePositionX;
  double get relativePositionX => _relativePositionX ?? 0.0;
  set relativePositionX(double? val) => _relativePositionX = val;

  void incrementRelativePositionX(double amount) =>
      relativePositionX = relativePositionX + amount;

  bool hasRelativePositionX() => _relativePositionX != null;

  // "virtual_position_y" field.
  double? _virtualPositionY;
  double get virtualPositionY => _virtualPositionY ?? 0.0;
  set virtualPositionY(double? val) => _virtualPositionY = val;

  void incrementVirtualPositionY(double amount) =>
      virtualPositionY = virtualPositionY + amount;

  bool hasVirtualPositionY() => _virtualPositionY != null;

  // "relative_position_y" field.
  double? _relativePositionY;
  double get relativePositionY => _relativePositionY ?? 0.0;
  set relativePositionY(double? val) => _relativePositionY = val;

  void incrementRelativePositionY(double amount) =>
      relativePositionY = relativePositionY + amount;

  bool hasRelativePositionY() => _relativePositionY != null;

  // "virtual_width" field.
  double? _virtualWidth;
  double get virtualWidth => _virtualWidth ?? 256.0;
  set virtualWidth(double? val) => _virtualWidth = val;

  void incrementVirtualWidth(double amount) =>
      virtualWidth = virtualWidth + amount;

  bool hasVirtualWidth() => _virtualWidth != null;

  // "relative_width" field.
  double? _relativeWidth;
  double get relativeWidth => _relativeWidth ?? 256.0;
  set relativeWidth(double? val) => _relativeWidth = val;

  void incrementRelativeWidth(double amount) =>
      relativeWidth = relativeWidth + amount;

  bool hasRelativeWidth() => _relativeWidth != null;

  // "virtual_height" field.
  double? _virtualHeight;
  double get virtualHeight => _virtualHeight ?? 128.0;
  set virtualHeight(double? val) => _virtualHeight = val;

  void incrementVirtualHeight(double amount) =>
      virtualHeight = virtualHeight + amount;

  bool hasVirtualHeight() => _virtualHeight != null;

  // "relative_height" field.
  double? _relativeHeight;
  double get relativeHeight => _relativeHeight ?? 128.0;
  set relativeHeight(double? val) => _relativeHeight = val;

  void incrementRelativeHeight(double amount) =>
      relativeHeight = relativeHeight + amount;

  bool hasRelativeHeight() => _relativeHeight != null;

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
        virtualPositionX: castToType<double>(data['virtual_position_x']),
        relativePositionX: castToType<double>(data['relative_position_x']),
        virtualPositionY: castToType<double>(data['virtual_position_y']),
        relativePositionY: castToType<double>(data['relative_position_y']),
        virtualWidth: castToType<double>(data['virtual_width']),
        relativeWidth: castToType<double>(data['relative_width']),
        virtualHeight: castToType<double>(data['virtual_height']),
        relativeHeight: castToType<double>(data['relative_height']),
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
        'virtual_position_x': _virtualPositionX,
        'relative_position_x': _relativePositionX,
        'virtual_position_y': _virtualPositionY,
        'relative_position_y': _relativePositionY,
        'virtual_width': _virtualWidth,
        'relative_width': _relativeWidth,
        'virtual_height': _virtualHeight,
        'relative_height': _relativeHeight,
        'input_sockets': _inputSockets?.map((e) => e.toMap()).toList(),
        'output_sockets': _outputSockets?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'virtual_position_x': serializeParam(
          _virtualPositionX,
          ParamType.double,
        ),
        'relative_position_x': serializeParam(
          _relativePositionX,
          ParamType.double,
        ),
        'virtual_position_y': serializeParam(
          _virtualPositionY,
          ParamType.double,
        ),
        'relative_position_y': serializeParam(
          _relativePositionY,
          ParamType.double,
        ),
        'virtual_width': serializeParam(
          _virtualWidth,
          ParamType.double,
        ),
        'relative_width': serializeParam(
          _relativeWidth,
          ParamType.double,
        ),
        'virtual_height': serializeParam(
          _virtualHeight,
          ParamType.double,
        ),
        'relative_height': serializeParam(
          _relativeHeight,
          ParamType.double,
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
        virtualPositionX: deserializeParam(
          data['virtual_position_x'],
          ParamType.double,
          false,
        ),
        relativePositionX: deserializeParam(
          data['relative_position_x'],
          ParamType.double,
          false,
        ),
        virtualPositionY: deserializeParam(
          data['virtual_position_y'],
          ParamType.double,
          false,
        ),
        relativePositionY: deserializeParam(
          data['relative_position_y'],
          ParamType.double,
          false,
        ),
        virtualWidth: deserializeParam(
          data['virtual_width'],
          ParamType.double,
          false,
        ),
        relativeWidth: deserializeParam(
          data['relative_width'],
          ParamType.double,
          false,
        ),
        virtualHeight: deserializeParam(
          data['virtual_height'],
          ParamType.double,
          false,
        ),
        relativeHeight: deserializeParam(
          data['relative_height'],
          ParamType.double,
          false,
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
        virtualPositionX == other.virtualPositionX &&
        relativePositionX == other.relativePositionX &&
        virtualPositionY == other.virtualPositionY &&
        relativePositionY == other.relativePositionY &&
        virtualWidth == other.virtualWidth &&
        relativeWidth == other.relativeWidth &&
        virtualHeight == other.virtualHeight &&
        relativeHeight == other.relativeHeight &&
        listEquality.equals(inputSockets, other.inputSockets) &&
        listEquality.equals(outputSockets, other.outputSockets);
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        virtualPositionX,
        relativePositionX,
        virtualPositionY,
        relativePositionY,
        virtualWidth,
        relativeWidth,
        virtualHeight,
        relativeHeight,
        inputSockets,
        outputSockets
      ]);
}

NFNodeStruct createNFNodeStruct({
  String? id,
  double? virtualPositionX,
  double? relativePositionX,
  double? virtualPositionY,
  double? relativePositionY,
  double? virtualWidth,
  double? relativeWidth,
  double? virtualHeight,
  double? relativeHeight,
}) =>
    NFNodeStruct(
      id: id,
      virtualPositionX: virtualPositionX,
      relativePositionX: relativePositionX,
      virtualPositionY: virtualPositionY,
      relativePositionY: relativePositionY,
      virtualWidth: virtualWidth,
      relativeWidth: relativeWidth,
      virtualHeight: virtualHeight,
      relativeHeight: relativeHeight,
    );
