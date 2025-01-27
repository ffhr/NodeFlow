// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFViewportStruct extends BaseStruct {
  NFViewportStruct({
    double? zoomFactor,
    NFPointStruct? virtualCenter,
  })  : _zoomFactor = zoomFactor,
        _virtualCenter = virtualCenter;

  // "zoom_factor" field.
  double? _zoomFactor;
  double get zoomFactor => _zoomFactor ?? 1.0;
  set zoomFactor(double? val) => _zoomFactor = val;

  void incrementZoomFactor(double amount) => zoomFactor = zoomFactor + amount;

  bool hasZoomFactor() => _zoomFactor != null;

  // "virtual_center" field.
  NFPointStruct? _virtualCenter;
  NFPointStruct get virtualCenter => _virtualCenter ?? NFPointStruct();
  set virtualCenter(NFPointStruct? val) => _virtualCenter = val;

  void updateVirtualCenter(Function(NFPointStruct) updateFn) {
    updateFn(_virtualCenter ??= NFPointStruct());
  }

  bool hasVirtualCenter() => _virtualCenter != null;

  static NFViewportStruct fromMap(Map<String, dynamic> data) =>
      NFViewportStruct(
        zoomFactor: castToType<double>(data['zoom_factor']),
        virtualCenter: data['virtual_center'] is NFPointStruct
            ? data['virtual_center']
            : NFPointStruct.maybeFromMap(data['virtual_center']),
      );

  static NFViewportStruct? maybeFromMap(dynamic data) => data is Map
      ? NFViewportStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'zoom_factor': _zoomFactor,
        'virtual_center': _virtualCenter?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'zoom_factor': serializeParam(
          _zoomFactor,
          ParamType.double,
        ),
        'virtual_center': serializeParam(
          _virtualCenter,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static NFViewportStruct fromSerializableMap(Map<String, dynamic> data) =>
      NFViewportStruct(
        zoomFactor: deserializeParam(
          data['zoom_factor'],
          ParamType.double,
          false,
        ),
        virtualCenter: deserializeStructParam(
          data['virtual_center'],
          ParamType.DataStruct,
          false,
          structBuilder: NFPointStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'NFViewportStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFViewportStruct &&
        zoomFactor == other.zoomFactor &&
        virtualCenter == other.virtualCenter;
  }

  @override
  int get hashCode => const ListEquality().hash([zoomFactor, virtualCenter]);
}

NFViewportStruct createNFViewportStruct({
  double? zoomFactor,
  NFPointStruct? virtualCenter,
}) =>
    NFViewportStruct(
      zoomFactor: zoomFactor,
      virtualCenter: virtualCenter ?? NFPointStruct(),
    );
