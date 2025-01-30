import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'drawing_pan_model.dart';
export 'drawing_pan_model.dart';

class DrawingPanWidget extends StatefulWidget {
  const DrawingPanWidget({super.key});

  @override
  State<DrawingPanWidget> createState() => _DrawingPanWidgetState();
}

class _DrawingPanWidgetState extends State<DrawingPanWidget> {
  late DrawingPanModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DrawingPanModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible:
          (FFAppState().EdgeDrawing.drawingState == DrawingState.started) ||
              (FFAppState().EdgeDrawing.drawingState == DrawingState.active),
      child: GestureDetector(
        onPanDown: (details) async {
          FFAppState().updateEdgeDrawingStruct(
            (e) => e
              ..drawingStartPoint = NFPointStruct(
                positionX: details.localPosition.dx,
                positionY: details.localPosition.dy,
              )
              ..drawingState = DrawingState.started
              ..drawingEndPoint = NFPointStruct(
                positionX: details.localPosition.dx,
                positionY: details.localPosition.dy,
              ),
          );
          safeSetState(() {});
        },
        onPanEnd: (details) async {
          FFAppState().updateEdgeDrawingStruct(
            (e) => e..drawingState = DrawingState.finished,
          );
          safeSetState(() {});
        },
        onPanUpdate: (details) async {
          FFAppState().updateEdgeDrawingStruct(
            (e) => e
              ..drawingState = DrawingState.active
              ..drawingEndPoint = NFPointStruct(
                positionX: details.localPosition.dx,
                positionY: details.localPosition.dy,
              ),
          );
          safeSetState(() {});
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0x324B39EF),
          ),
        ),
      ),
    );
  }
}
