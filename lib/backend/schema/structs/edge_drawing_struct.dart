// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EdgeDrawingStruct extends BaseStruct {
  EdgeDrawingStruct({
    NFPointStruct? drawingStartPoint,
    NFPointStruct? drawingEndPoint,
    DrawingState? drawingState,
  })  : _drawingStartPoint = drawingStartPoint,
        _drawingEndPoint = drawingEndPoint,
        _drawingState = drawingState;

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

  // "drawing_state" field.
  DrawingState? _drawingState;
  DrawingState get drawingState => _drawingState ?? DrawingState.inactive;
  set drawingState(DrawingState? val) => _drawingState = val;

  bool hasDrawingState() => _drawingState != null;

  static EdgeDrawingStruct fromMap(Map<String, dynamic> data) =>
      EdgeDrawingStruct(
        drawingStartPoint: data['drawing_start_point'] is NFPointStruct
            ? data['drawing_start_point']
            : NFPointStruct.maybeFromMap(data['drawing_start_point']),
        drawingEndPoint: data['drawing_end_point'] is NFPointStruct
            ? data['drawing_end_point']
            : NFPointStruct.maybeFromMap(data['drawing_end_point']),
        drawingState: data['drawing_state'] is DrawingState
            ? data['drawing_state']
            : deserializeEnum<DrawingState>(data['drawing_state']),
      );

  static EdgeDrawingStruct? maybeFromMap(dynamic data) => data is Map
      ? EdgeDrawingStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'drawing_start_point': _drawingStartPoint?.toMap(),
        'drawing_end_point': _drawingEndPoint?.toMap(),
        'drawing_state': _drawingState?.serialize(),
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
        'drawing_state': serializeParam(
          _drawingState,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static EdgeDrawingStruct fromSerializableMap(Map<String, dynamic> data) =>
      EdgeDrawingStruct(
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
        drawingState: deserializeParam<DrawingState>(
          data['drawing_state'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'EdgeDrawingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EdgeDrawingStruct &&
        drawingStartPoint == other.drawingStartPoint &&
        drawingEndPoint == other.drawingEndPoint &&
        drawingState == other.drawingState;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([drawingStartPoint, drawingEndPoint, drawingState]);
}

EdgeDrawingStruct createEdgeDrawingStruct({
  NFPointStruct? drawingStartPoint,
  NFPointStruct? drawingEndPoint,
  DrawingState? drawingState,
}) =>
    EdgeDrawingStruct(
      drawingStartPoint: drawingStartPoint ?? NFPointStruct(),
      drawingEndPoint: drawingEndPoint ?? NFPointStruct(),
      drawingState: drawingState,
    );
