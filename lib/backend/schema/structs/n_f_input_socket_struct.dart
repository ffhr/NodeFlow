// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFInputSocketStruct extends BaseStruct {
  NFInputSocketStruct({
    NFSocketStruct? socket,
  }) : _socket = socket;

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
        socket: data['socket'] is NFSocketStruct
            ? data['socket']
            : NFSocketStruct.maybeFromMap(data['socket']),
      );

  static NFInputSocketStruct? maybeFromMap(dynamic data) => data is Map
      ? NFInputSocketStruct.fromMap(data.cast<String, dynamic>())
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

  static NFInputSocketStruct fromSerializableMap(Map<String, dynamic> data) =>
      NFInputSocketStruct(
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
    return other is NFInputSocketStruct && socket == other.socket;
  }

  @override
  int get hashCode => const ListEquality().hash([socket]);
}

NFInputSocketStruct createNFInputSocketStruct({
  NFSocketStruct? socket,
}) =>
    NFInputSocketStruct(
      socket: socket ?? NFSocketStruct(),
    );
