// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFOffsetStruct extends BaseStruct {
  NFOffsetStruct({
    double? offsetX,
    double? offsetY,
  })  : _offsetX = offsetX,
        _offsetY = offsetY;

  // "offset_x" field.
  double? _offsetX;
  double get offsetX => _offsetX ?? 0.0;
  set offsetX(double? val) => _offsetX = val;

  void incrementOffsetX(double amount) => offsetX = offsetX + amount;

  bool hasOffsetX() => _offsetX != null;

  // "offset_y" field.
  double? _offsetY;
  double get offsetY => _offsetY ?? 0.0;
  set offsetY(double? val) => _offsetY = val;

  void incrementOffsetY(double amount) => offsetY = offsetY + amount;

  bool hasOffsetY() => _offsetY != null;

  static NFOffsetStruct fromMap(Map<String, dynamic> data) => NFOffsetStruct(
        offsetX: castToType<double>(data['offset_x']),
        offsetY: castToType<double>(data['offset_y']),
      );

  static NFOffsetStruct? maybeFromMap(dynamic data) =>
      data is Map ? NFOffsetStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'offset_x': _offsetX,
        'offset_y': _offsetY,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'offset_x': serializeParam(
          _offsetX,
          ParamType.double,
        ),
        'offset_y': serializeParam(
          _offsetY,
          ParamType.double,
        ),
      }.withoutNulls;

  static NFOffsetStruct fromSerializableMap(Map<String, dynamic> data) =>
      NFOffsetStruct(
        offsetX: deserializeParam(
          data['offset_x'],
          ParamType.double,
          false,
        ),
        offsetY: deserializeParam(
          data['offset_y'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'NFOffsetStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFOffsetStruct &&
        offsetX == other.offsetX &&
        offsetY == other.offsetY;
  }

  @override
  int get hashCode => const ListEquality().hash([offsetX, offsetY]);
}

NFOffsetStruct createNFOffsetStruct({
  double? offsetX,
  double? offsetY,
}) =>
    NFOffsetStruct(
      offsetX: offsetX,
      offsetY: offsetY,
    );
