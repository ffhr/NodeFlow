// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFViewportStruct extends BaseStruct {
  NFViewportStruct({
    double? zoomFactor,
    double? virtualPositionX,
    double? virtualPositionY,
  })  : _zoomFactor = zoomFactor,
        _virtualPositionX = virtualPositionX,
        _virtualPositionY = virtualPositionY;

  // "zoom_factor" field.
  double? _zoomFactor;
  double get zoomFactor => _zoomFactor ?? 1.0;
  set zoomFactor(double? val) => _zoomFactor = val;

  void incrementZoomFactor(double amount) => zoomFactor = zoomFactor + amount;

  bool hasZoomFactor() => _zoomFactor != null;

  // "virtual_position_x" field.
  double? _virtualPositionX;
  double get virtualPositionX => _virtualPositionX ?? 0.0;
  set virtualPositionX(double? val) => _virtualPositionX = val;

  void incrementVirtualPositionX(double amount) =>
      virtualPositionX = virtualPositionX + amount;

  bool hasVirtualPositionX() => _virtualPositionX != null;

  // "virtual_position_y" field.
  double? _virtualPositionY;
  double get virtualPositionY => _virtualPositionY ?? 0.0;
  set virtualPositionY(double? val) => _virtualPositionY = val;

  void incrementVirtualPositionY(double amount) =>
      virtualPositionY = virtualPositionY + amount;

  bool hasVirtualPositionY() => _virtualPositionY != null;

  static NFViewportStruct fromMap(Map<String, dynamic> data) =>
      NFViewportStruct(
        zoomFactor: castToType<double>(data['zoom_factor']),
        virtualPositionX: castToType<double>(data['virtual_position_x']),
        virtualPositionY: castToType<double>(data['virtual_position_y']),
      );

  static NFViewportStruct? maybeFromMap(dynamic data) => data is Map
      ? NFViewportStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'zoom_factor': _zoomFactor,
        'virtual_position_x': _virtualPositionX,
        'virtual_position_y': _virtualPositionY,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'zoom_factor': serializeParam(
          _zoomFactor,
          ParamType.double,
        ),
        'virtual_position_x': serializeParam(
          _virtualPositionX,
          ParamType.double,
        ),
        'virtual_position_y': serializeParam(
          _virtualPositionY,
          ParamType.double,
        ),
      }.withoutNulls;

  static NFViewportStruct fromSerializableMap(Map<String, dynamic> data) =>
      NFViewportStruct(
        zoomFactor: deserializeParam(
          data['zoom_factor'],
          ParamType.double,
          false,
        ),
        virtualPositionX: deserializeParam(
          data['virtual_position_x'],
          ParamType.double,
          false,
        ),
        virtualPositionY: deserializeParam(
          data['virtual_position_y'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'NFViewportStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFViewportStruct &&
        zoomFactor == other.zoomFactor &&
        virtualPositionX == other.virtualPositionX &&
        virtualPositionY == other.virtualPositionY;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([zoomFactor, virtualPositionX, virtualPositionY]);
}

NFViewportStruct createNFViewportStruct({
  double? zoomFactor,
  double? virtualPositionX,
  double? virtualPositionY,
}) =>
    NFViewportStruct(
      zoomFactor: zoomFactor,
      virtualPositionX: virtualPositionX,
      virtualPositionY: virtualPositionY,
    );
