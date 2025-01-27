// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PointStruct extends BaseStruct {
  PointStruct({
    double? xCoordinate,
    double? yCoordinate,
  })  : _xCoordinate = xCoordinate,
        _yCoordinate = yCoordinate;

  // "x_coordinate" field.
  double? _xCoordinate;
  double get xCoordinate => _xCoordinate ?? 0.0;
  set xCoordinate(double? val) => _xCoordinate = val;

  void incrementXCoordinate(double amount) =>
      xCoordinate = xCoordinate + amount;

  bool hasXCoordinate() => _xCoordinate != null;

  // "y_coordinate" field.
  double? _yCoordinate;
  double get yCoordinate => _yCoordinate ?? 0.0;
  set yCoordinate(double? val) => _yCoordinate = val;

  void incrementYCoordinate(double amount) =>
      yCoordinate = yCoordinate + amount;

  bool hasYCoordinate() => _yCoordinate != null;

  static PointStruct fromMap(Map<String, dynamic> data) => PointStruct(
        xCoordinate: castToType<double>(data['x_coordinate']),
        yCoordinate: castToType<double>(data['y_coordinate']),
      );

  static PointStruct? maybeFromMap(dynamic data) =>
      data is Map ? PointStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'x_coordinate': _xCoordinate,
        'y_coordinate': _yCoordinate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'x_coordinate': serializeParam(
          _xCoordinate,
          ParamType.double,
        ),
        'y_coordinate': serializeParam(
          _yCoordinate,
          ParamType.double,
        ),
      }.withoutNulls;

  static PointStruct fromSerializableMap(Map<String, dynamic> data) =>
      PointStruct(
        xCoordinate: deserializeParam(
          data['x_coordinate'],
          ParamType.double,
          false,
        ),
        yCoordinate: deserializeParam(
          data['y_coordinate'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'PointStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PointStruct &&
        xCoordinate == other.xCoordinate &&
        yCoordinate == other.yCoordinate;
  }

  @override
  int get hashCode => const ListEquality().hash([xCoordinate, yCoordinate]);
}

PointStruct createPointStruct({
  double? xCoordinate,
  double? yCoordinate,
}) =>
    PointStruct(
      xCoordinate: xCoordinate,
      yCoordinate: yCoordinate,
    );
