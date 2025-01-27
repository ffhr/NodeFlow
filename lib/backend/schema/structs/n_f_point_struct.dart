// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFPointStruct extends BaseStruct {
  NFPointStruct({
    double? positionX,
    double? positionY,
  })  : _positionX = positionX,
        _positionY = positionY;

  // "position_x" field.
  double? _positionX;
  double get positionX => _positionX ?? 0.0;
  set positionX(double? val) => _positionX = val;

  void incrementPositionX(double amount) => positionX = positionX + amount;

  bool hasPositionX() => _positionX != null;

  // "position_y" field.
  double? _positionY;
  double get positionY => _positionY ?? 0.0;
  set positionY(double? val) => _positionY = val;

  void incrementPositionY(double amount) => positionY = positionY + amount;

  bool hasPositionY() => _positionY != null;

  static NFPointStruct fromMap(Map<String, dynamic> data) => NFPointStruct(
        positionX: castToType<double>(data['position_x']),
        positionY: castToType<double>(data['position_y']),
      );

  static NFPointStruct? maybeFromMap(dynamic data) =>
      data is Map ? NFPointStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'position_x': _positionX,
        'position_y': _positionY,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'position_x': serializeParam(
          _positionX,
          ParamType.double,
        ),
        'position_y': serializeParam(
          _positionY,
          ParamType.double,
        ),
      }.withoutNulls;

  static NFPointStruct fromSerializableMap(Map<String, dynamic> data) =>
      NFPointStruct(
        positionX: deserializeParam(
          data['position_x'],
          ParamType.double,
          false,
        ),
        positionY: deserializeParam(
          data['position_y'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'NFPointStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFPointStruct &&
        positionX == other.positionX &&
        positionY == other.positionY;
  }

  @override
  int get hashCode => const ListEquality().hash([positionX, positionY]);
}

NFPointStruct createNFPointStruct({
  double? positionX,
  double? positionY,
}) =>
    NFPointStruct(
      positionX: positionX,
      positionY: positionY,
    );
