import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'socket_component_model.dart';
export 'socket_component_model.dart';

class SocketComponentWidget extends StatefulWidget {
  const SocketComponentWidget({
    super.key,
    this.renderPan,
    this.isHovered,
    this.mouseEntered,
    this.mouseExit,
  });

  final Future Function()? renderPan;
  final bool? isHovered;
  final Future Function()? mouseEntered;
  final Future Function()? mouseExit;

  @override
  State<SocketComponentWidget> createState() => _SocketComponentWidgetState();
}

class _SocketComponentWidgetState extends State<SocketComponentWidget> {
  late SocketComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocketComponentModel());

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

    return MouseRegion(
      opaque: false,
      cursor: MouseCursor.defer ?? MouseCursor.defer,
      child: GestureDetector(
        onTap: () async {
          await actions.emptyAction();
        },
        onPanDown: (details) async {
          if ((FFAppState().EdgeDrawing.drawingState ==
                  DrawingState.inactive) ||
              (FFAppState().EdgeDrawing.drawingState ==
                  DrawingState.finished)) {
            // Set status Drawing.STARTED
            FFAppState().updateEdgeDrawingStruct(
              (e) => e
                ..drawingState = DrawingState.started
                ..drawingStartPoint = NFPointStruct(
                  positionX: details.globalPosition.dx,
                  positionY: details.globalPosition.dy,
                )
                ..drawingEndPoint = NFPointStruct(
                  positionX: details.globalPosition.dx,
                  positionY: details.globalPosition.dy,
                ),
            );
            FFAppState().update(() {});
          }
        },
        onPanEnd: (details) async {
          FFAppState().updateEdgeDrawingStruct(
            (e) => e..drawingState = DrawingState.finished,
          );
          FFAppState().update(() {});
        },
        onPanUpdate: (details) async {
          FFAppState().updateEdgeDrawingStruct(
            (e) => e
              ..drawingState = DrawingState.active
              ..drawingEndPoint = NFPointStruct(
                positionX: details.globalPosition.dx,
                positionY: details.globalPosition.dy,
              ),
          );
          FFAppState().update(() {});
        },
        onTapUp: (details) async {
          FFAppState().updateEdgeDrawingStruct(
            (e) => e..drawingState = DrawingState.finished,
          );
          FFAppState().update(() {});
        },
        child: Container(
          width: 20.0,
          height: 20.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).warning,
            shape: BoxShape.circle,
            border: Border.all(
              color: valueOrDefault<Color>(
                widget!.isHovered!
                    ? Colors.white
                    : FlutterFlowTheme.of(context).warning,
                Colors.white,
              ),
              width: 3.0,
            ),
          ),
        ),
      ),
      onEnter: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = true);
        if (FFAppState().EdgeDrawing.drawingState == DrawingState.inactive) {}
        if ((FFAppState().EdgeDrawing.drawingState == DrawingState.active) ||
            (FFAppState().EdgeDrawing.drawingState == DrawingState.finished)) {}
        // Execute callback
        await widget.mouseEntered?.call();
      }),
      onExit: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = false);
        if (FFAppState().EdgeDrawing.drawingState == DrawingState.started) {}
        await widget.mouseExit?.call();
      }),
    );
  }
}
