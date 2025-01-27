// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NodeOutputSocketStruct extends BaseStruct {
  NodeOutputSocketStruct({
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

  static NodeOutputSocketStruct fromMap(Map<String, dynamic> data) =>
      NodeOutputSocketStruct(
        socket: data['socket'] is NodeSocketStruct
            ? data['socket']
            : NodeSocketStruct.maybeFromMap(data['socket']),
      );

  static NodeOutputSocketStruct? maybeFromMap(dynamic data) => data is Map
      ? NodeOutputSocketStruct.fromMap(data.cast<String, dynamic>())
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

  static NodeOutputSocketStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NodeOutputSocketStruct(
        socket: deserializeStructParam(
          data['socket'],
          ParamType.DataStruct,
          false,
          structBuilder: NodeSocketStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'NodeOutputSocketStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NodeOutputSocketStruct && socket == other.socket;
  }

  @override
  int get hashCode => const ListEquality().hash([socket]);
}

NodeOutputSocketStruct createNodeOutputSocketStruct({
  NodeSocketStruct? socket,
}) =>
    NodeOutputSocketStruct(
      socket: socket ?? NodeSocketStruct(),
    );
