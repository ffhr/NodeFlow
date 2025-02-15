// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFInputSocketStruct extends BaseStruct {
  NFInputSocketStruct({
    NFInputSocketIdStruct? inputSocketId,
    NFSocketStruct? socket,
  })  : _inputSocketId = inputSocketId,
        _socket = socket;

  // "input_socket_id" field.
  NFInputSocketIdStruct? _inputSocketId;
  NFInputSocketIdStruct get inputSocketId =>
      _inputSocketId ?? NFInputSocketIdStruct();
  set inputSocketId(NFInputSocketIdStruct? val) => _inputSocketId = val;

  void updateInputSocketId(Function(NFInputSocketIdStruct) updateFn) {
    updateFn(_inputSocketId ??= NFInputSocketIdStruct());
  }

  bool hasInputSocketId() => _inputSocketId != null;

  // "socket" field.
  NFSocketStruct? _socket;
  NFSocketStruct get socket => _socket ?? NFSocketStruct();
  set socket(NFSocketStruct? val) => _socket = val;

  void updateSocket(Function(NFSocketStruct) updateFn) {
    updateFn(_socket ??= NFSocketStruct());
  }

  bool hasSocket() => _socket != null;

  static NFInputSocketStruct fromMap(Map<String, dynamic> data) =>
      NFInputSocketStruct(
        inputSocketId: data['input_socket_id'] is NFInputSocketIdStruct
            ? data['input_socket_id']
            : NFInputSocketIdStruct.maybeFromMap(data['input_socket_id']),
        socket: data['socket'] is NFSocketStruct
            ? data['socket']
            : NFSocketStruct.maybeFromMap(data['socket']),
      );

  static NFInputSocketStruct? maybeFromMap(dynamic data) => data is Map
      ? NFInputSocketStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'input_socket_id': _inputSocketId?.toMap(),
        'socket': _socket?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'input_socket_id': serializeParam(
          _inputSocketId,
          ParamType.DataStruct,
        ),
        'socket': serializeParam(
          _socket,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static NFInputSocketStruct fromSerializableMap(Map<String, dynamic> data) =>
      NFInputSocketStruct(
        inputSocketId: deserializeStructParam(
          data['input_socket_id'],
          ParamType.DataStruct,
          false,
          structBuilder: NFInputSocketIdStruct.fromSerializableMap,
        ),
        socket: deserializeStructParam(
          data['socket'],
          ParamType.DataStruct,
          false,
          structBuilder: NFSocketStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'NFInputSocketStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFInputSocketStruct &&
        inputSocketId == other.inputSocketId &&
        socket == other.socket;
  }

  @override
  int get hashCode => const ListEquality().hash([inputSocketId, socket]);
}

NFInputSocketStruct createNFInputSocketStruct({
  NFInputSocketIdStruct? inputSocketId,
  NFSocketStruct? socket,
}) =>
    NFInputSocketStruct(
      inputSocketId: inputSocketId ?? NFInputSocketIdStruct(),
      socket: socket ?? NFSocketStruct(),
    );
