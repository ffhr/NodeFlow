import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
    bool? isClicked,
    required this.onClicked,
  }) : this.isClicked = isClicked ?? false;

  final Future Function()? renderPan;
  final bool? isHovered;
  final Future Function()? mouseEntered;
  final Future Function()? mouseExit;
  final bool isClicked;
  final Future Function(bool isClicked)? onClicked;

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
      child: Builder(
        builder: (context) {
          if (widget!.isClicked) {
            return GestureDetector(
              onTap: () async {
                // onClicked(false)
                await widget.onClicked?.call(
                  false,
                );
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
                // Set status Drawing.FINISHED
                FFAppState().updateEdgeDrawingStruct(
                  (e) => e..drawingState = DrawingState.finished,
                );
                FFAppState().update(() {});
              },
              onPanUpdate: (details) async {
                // Set status Drawing.ACTIVE
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
                // Set status Drawing.FINISHED
                FFAppState().updateEdgeDrawingStruct(
                  (e) => e..drawingState = DrawingState.finished,
                );
                FFAppState().update(() {});
              },
              child: Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).tertiary,
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
            );
          } else {
            return GestureDetector(
              onTap: () async {
                // onClicked(true)
                await widget.onClicked?.call(
                  true,
                );
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
                // Set status Drawing.FINISHED
                FFAppState().updateEdgeDrawingStruct(
                  (e) => e..drawingState = DrawingState.finished,
                );
                FFAppState().update(() {});
              },
              onPanUpdate: (details) async {
                // Set status Drawing.ACTIVE
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
                // Set status Drawing.FINISHED
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
            );
          }
        },
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
