// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NodeInputSocketStruct extends BaseStruct {
  NodeInputSocketStruct({
    NodeSocketStruct? socket,
  }) : _socket = socket;

  // "socket" field.
  NodeSocketStruct? _socket;
  NodeSocketStruct get socket => _socket ?? NodeSocketStruct();
  set socket(NodeSocketStruct? val) => _socket = val;

  void updateSocket(Function(NodeSocketStruct) updateFn) {
    updateFn(_socket ??= NodeSocketStruct());
  }

  bool hasSocket() => _socket != null;

  static NodeInputSocketStruct fromMap(Map<String, dynamic> data) =>
      NodeInputSocketStruct(
        socket: data['socket'] is NodeSocketStruct
            ? data['socket']
            : NodeSocketStruct.maybeFromMap(data['socket']),
      );

  static NodeInputSocketStruct? maybeFromMap(dynamic data) => data is Map
      ? NodeInputSocketStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'socket': _socket?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'socket': serializeParam(
          _socket,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static NodeInputSocketStruct fromSerializableMap(Map<String, dynamic> data) =>
      NodeInputSocketStruct(
        socket: deserializeStructParam(
          data['socket'],
          ParamType.DataStruct,
          false,
          structBuilder: NodeSocketStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'NodeInputSocketStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NodeInputSocketStruct && socket == other.socket;
  }

  @override
  int get hashCode => const ListEquality().hash([socket]);
}

NodeInputSocketStruct createNodeInputSocketStruct({
  NodeSocketStruct? socket,
}) =>
    NodeInputSocketStruct(
      socket: socket ?? NodeSocketStruct(),
    );
