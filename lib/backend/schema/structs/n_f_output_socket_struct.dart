// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFOutputSocketStruct extends BaseStruct {
  NFOutputSocketStruct({
    NFOutputSocketIdStruct? outputSocketId,
    NFSocketStruct? socket,
  })  : _outputSocketId = outputSocketId,
        _socket = socket;

  // "output_socket_id" field.
  NFOutputSocketIdStruct? _outputSocketId;
  NFOutputSocketIdStruct get outputSocketId =>
      _outputSocketId ?? NFOutputSocketIdStruct();
  set outputSocketId(NFOutputSocketIdStruct? val) => _outputSocketId = val;

  void updateOutputSocketId(Function(NFOutputSocketIdStruct) updateFn) {
    updateFn(_outputSocketId ??= NFOutputSocketIdStruct());
  }

  bool hasOutputSocketId() => _outputSocketId != null;

  // "socket" field.
  NFSocketStruct? _socket;
  NFSocketStruct get socket => _socket ?? NFSocketStruct();
  set socket(NFSocketStruct? val) => _socket = val;

  void updateSocket(Function(NFSocketStruct) updateFn) {
    updateFn(_socket ??= NFSocketStruct());
  }

  bool hasSocket() => _socket != null;

  static NFOutputSocketStruct fromMap(Map<String, dynamic> data) =>
      NFOutputSocketStruct(
        outputSocketId: data['output_socket_id'] is NFOutputSocketIdStruct
            ? data['output_socket_id']
            : NFOutputSocketIdStruct.maybeFromMap(data['output_socket_id']),
        socket: data['socket'] is NFSocketStruct
            ? data['socket']
            : NFSocketStruct.maybeFromMap(data['socket']),
      );

  static NFOutputSocketStruct? maybeFromMap(dynamic data) => data is Map
      ? NFOutputSocketStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'output_socket_id': _outputSocketId?.toMap(),
        'socket': _socket?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'output_socket_id': serializeParam(
          _outputSocketId,
          ParamType.DataStruct,
        ),
        'socket': serializeParam(
          _socket,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static NFOutputSocketStruct fromSerializableMap(Map<String, dynamic> data) =>
      NFOutputSocketStruct(
        outputSocketId: deserializeStructParam(
          data['output_socket_id'],
          ParamType.DataStruct,
          false,
          structBuilder: NFOutputSocketIdStruct.fromSerializableMap,
        ),
        socket: deserializeStructParam(
          data['socket'],
          ParamType.DataStruct,
          false,
          structBuilder: NFSocketStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'NFOutputSocketStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFOutputSocketStruct &&
        outputSocketId == other.outputSocketId &&
        socket == other.socket;
  }

  @override
  int get hashCode => const ListEquality().hash([outputSocketId, socket]);
}

NFOutputSocketStruct createNFOutputSocketStruct({
  NFOutputSocketIdStruct? outputSocketId,
  NFSocketStruct? socket,
}) =>
    NFOutputSocketStruct(
      outputSocketId: outputSocketId ?? NFOutputSocketIdStruct(),
      socket: socket ?? NFSocketStruct(),
    );
