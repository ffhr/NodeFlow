// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NFEdgeDrawingStateStruct extends BaseStruct {
  NFEdgeDrawingStateStruct({
    NFPointStruct? drawingStartPoint,
    NFPointStruct? drawingEndPoint,
    NFEdgeDrawingStateType? drawingStateType,
  })  : _drawingStartPoint = drawingStartPoint,
        _drawingEndPoint = drawingEndPoint,
        _drawingStateType = drawingStateType;

  // "drawing_start_point" field.
  NFPointStruct? _drawingStartPoint;
  NFPointStruct get drawingStartPoint => _drawingStartPoint ?? NFPointStruct();
  set drawingStartPoint(NFPointStruct? val) => _drawingStartPoint = val;

  void updateDrawingStartPoint(Function(NFPointStruct) updateFn) {
    updateFn(_drawingStartPoint ??= NFPointStruct());
  }

  bool hasDrawingStartPoint() => _drawingStartPoint != null;

  // "drawing_end_point" field.
  NFPointStruct? _drawingEndPoint;
  NFPointStruct get drawingEndPoint => _drawingEndPoint ?? NFPointStruct();
  set drawingEndPoint(NFPointStruct? val) => _drawingEndPoint = val;

  void updateDrawingEndPoint(Function(NFPointStruct) updateFn) {
    updateFn(_drawingEndPoint ??= NFPointStruct());
  }

  bool hasDrawingEndPoint() => _drawingEndPoint != null;

  // "drawing_state_type" field.
  NFEdgeDrawingStateType? _drawingStateType;
  NFEdgeDrawingStateType get drawingStateType =>
      _drawingStateType ?? NFEdgeDrawingStateType.inactive;
  set drawingStateType(NFEdgeDrawingStateType? val) => _drawingStateType = val;

  bool hasDrawingStateType() => _drawingStateType != null;

  static NFEdgeDrawingStateStruct fromMap(Map<String, dynamic> data) =>
      NFEdgeDrawingStateStruct(
        drawingStartPoint: data['drawing_start_point'] is NFPointStruct
            ? data['drawing_start_point']
            : NFPointStruct.maybeFromMap(data['drawing_start_point']),
        drawingEndPoint: data['drawing_end_point'] is NFPointStruct
            ? data['drawing_end_point']
            : NFPointStruct.maybeFromMap(data['drawing_end_point']),
        drawingStateType: data['drawing_state_type'] is NFEdgeDrawingStateType
            ? data['drawing_state_type']
            : deserializeEnum<NFEdgeDrawingStateType>(
                data['drawing_state_type']),
      );

  static NFEdgeDrawingStateStruct? maybeFromMap(dynamic data) => data is Map
      ? NFEdgeDrawingStateStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'drawing_start_point': _drawingStartPoint?.toMap(),
        'drawing_end_point': _drawingEndPoint?.toMap(),
        'drawing_state_type': _drawingStateType?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'drawing_start_point': serializeParam(
          _drawingStartPoint,
          ParamType.DataStruct,
        ),
        'drawing_end_point': serializeParam(
          _drawingEndPoint,
          ParamType.DataStruct,
        ),
        'drawing_state_type': serializeParam(
          _drawingStateType,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static NFEdgeDrawingStateStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NFEdgeDrawingStateStruct(
        drawingStartPoint: deserializeStructParam(
          data['drawing_start_point'],
          ParamType.DataStruct,
          false,
          structBuilder: NFPointStruct.fromSerializableMap,
        ),
        drawingEndPoint: deserializeStructParam(
          data['drawing_end_point'],
          ParamType.DataStruct,
          false,
          structBuilder: NFPointStruct.fromSerializableMap,
        ),
        drawingStateType: deserializeParam<NFEdgeDrawingStateType>(
          data['drawing_state_type'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'NFEdgeDrawingStateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NFEdgeDrawingStateStruct &&
        drawingStartPoint == other.drawingStartPoint &&
        drawingEndPoint == other.drawingEndPoint &&
        drawingStateType == other.drawingStateType;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([drawingStartPoint, drawingEndPoint, drawingStateType]);
}

NFEdgeDrawingStateStruct createNFEdgeDrawingStateStruct({
  NFPointStruct? drawingStartPoint,
  NFPointStruct? drawingEndPoint,
  NFEdgeDrawingStateType? drawingStateType,
}) =>
    NFEdgeDrawingStateStruct(
      drawingStartPoint: drawingStartPoint ?? NFPointStruct(),
      drawingEndPoint: drawingEndPoint ?? NFPointStruct(),
      drawingStateType: drawingStateType,
    );
