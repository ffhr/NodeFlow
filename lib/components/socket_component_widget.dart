import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
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
    this.onPanDown,
    this.onPanEnd,
    bool? isConnected,
    Color? defaultColor,
    Color? selectedColor,
  })  : this.isClicked = isClicked ?? false,
        this.isConnected = isConnected ?? false,
        this.defaultColor = defaultColor ?? const Color(0xFFFF0000),
        this.selectedColor = selectedColor ?? const Color(0xFF9100FF);

  final Future Function()? renderPan;
  final bool? isHovered;
  final Future Function()? mouseEntered;
  final Future Function()? mouseExit;
  final bool isClicked;
  final Future Function(bool isClicked)? onClicked;
  final Future Function(NFPointStruct point)? onPanDown;
  final Future Function(NFPointStruct point)? onPanEnd;
  final bool isConnected;
  final Color defaultColor;
  final Color selectedColor;

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
              onPanDown: (details) async {
                // onClicked(false)
                await widget.onClicked?.call(
                  false,
                );
                if ((FFAppState().EdgeDrawing.drawingState ==
                        DrawingState.inactive) ||
                    (FFAppState().EdgeDrawing.drawingState ==
                        DrawingState.finished)) {
                  // Set status Drawing.STARTED
                  FFAppState().updateEdgeDrawingStruct(
                    (e) => e
                      ..drawingState = DrawingState.started
                      ..drawingStartPoint = NFPointStruct(
                        positionX: functions.scaledGlobalPosition(
                            details.globalPosition.dx,
                            FFAppState().DefaultZoomFactor,
                            FFAppState().ZoomFactor),
                        positionY: functions.scaledGlobalPosition(
                            details.globalPosition.dy,
                            FFAppState().DefaultZoomFactor,
                            FFAppState().ZoomFactor),
                      )
                      ..drawingEndPoint = NFPointStruct(
                        positionX: functions.scaledGlobalPosition(
                            details.globalPosition.dx,
                            FFAppState().DefaultZoomFactor,
                            FFAppState().ZoomFactor),
                        positionY: functions.scaledGlobalPosition(
                            details.globalPosition.dy,
                            FFAppState().DefaultZoomFactor,
                            FFAppState().ZoomFactor),
                      ),
                  );
                  FFAppState().update(() {});
                  // Execute callback
                  await widget.onPanDown?.call(
                    NFPointStruct(
                      positionX: details.globalPosition.dx,
                      positionY: details.globalPosition.dy,
                    ),
                  );
                }
              },
              onPanEnd: (details) async {
                // Set status Drawing.FINISHED
                FFAppState().updateEdgeDrawingStruct(
                  (e) => e..drawingState = DrawingState.finished,
                );
                FFAppState().update(() {});
                // Execute callback
                await widget.onPanEnd?.call(
                  NFPointStruct(
                    positionX: details.globalPosition.dx,
                    positionY: details.globalPosition.dy,
                  ),
                );
              },
              onPanUpdate: (details) async {
                // Set status Drawing.ACTIVE
                FFAppState().updateEdgeDrawingStruct(
                  (e) => e
                    ..drawingState = DrawingState.active
                    ..drawingEndPoint = NFPointStruct(
                      positionX: functions.scaledGlobalPosition(
                          details.globalPosition.dx,
                          FFAppState().DefaultZoomFactor,
                          FFAppState().ZoomFactor),
                      positionY: functions.scaledGlobalPosition(
                          details.globalPosition.dy,
                          FFAppState().DefaultZoomFactor,
                          FFAppState().ZoomFactor),
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
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: widget!.selectedColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: valueOrDefault<Color>(
                      widget!.isHovered!
                          ? Colors.white
                          : FlutterFlowTheme.of(context).warning,
                      Colors.white,
                    ),
                    width: 3,
                  ),
                ),
              ),
            );
          } else {
            return GestureDetector(
              onPanDown: (details) async {
                // onClicked(true)
                await widget.onClicked?.call(
                  true,
                );
                if ((FFAppState().EdgeDrawing.drawingState ==
                        DrawingState.inactive) ||
                    (FFAppState().EdgeDrawing.drawingState ==
                        DrawingState.finished)) {
                  // Set status Drawing.STARTED
                  FFAppState().updateEdgeDrawingStruct(
                    (e) => e
                      ..drawingState = DrawingState.started
                      ..drawingStartPoint = NFPointStruct(
                        positionX: functions.scaledGlobalPosition(
                            details.globalPosition.dx,
                            FFAppState().DefaultZoomFactor,
                            FFAppState().ZoomFactor),
                        positionY: functions.scaledGlobalPosition(
                            details.globalPosition.dy,
                            FFAppState().DefaultZoomFactor,
                            FFAppState().ZoomFactor),
                      )
                      ..drawingEndPoint = NFPointStruct(
                        positionX: functions.scaledGlobalPosition(
                            details.globalPosition.dx,
                            FFAppState().DefaultZoomFactor,
                            FFAppState().ZoomFactor),
                        positionY: functions.scaledGlobalPosition(
                            details.globalPosition.dy,
                            FFAppState().DefaultZoomFactor,
                            FFAppState().ZoomFactor),
                      ),
                  );
                  FFAppState().update(() {});
                  // Execute callback
                  await widget.onPanDown?.call(
                    NFPointStruct(
                      positionX: details.globalPosition.dx,
                      positionY: details.globalPosition.dy,
                    ),
                  );
                }
              },
              onPanEnd: (details) async {
                // Set status Drawing.FINISHED
                FFAppState().updateEdgeDrawingStruct(
                  (e) => e..drawingState = DrawingState.finished,
                );
                FFAppState().update(() {});
                // Execute callback
                await widget.onPanEnd?.call(
                  NFPointStruct(
                    positionX: details.globalPosition.dx,
                    positionY: details.globalPosition.dy,
                  ),
                );
              },
              onPanUpdate: (details) async {
                // Set status Drawing.ACTIVE
                FFAppState().updateEdgeDrawingStruct(
                  (e) => e
                    ..drawingState = DrawingState.active
                    ..drawingEndPoint = NFPointStruct(
                      positionX: functions.scaledGlobalPosition(
                          details.globalPosition.dx,
                          FFAppState().DefaultZoomFactor,
                          FFAppState().ZoomFactor),
                      positionY: functions.scaledGlobalPosition(
                          details.globalPosition.dy,
                          FFAppState().DefaultZoomFactor,
                          FFAppState().ZoomFactor),
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
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: widget!.defaultColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: valueOrDefault<Color>(
                      widget!.isHovered!
                          ? Colors.white
                          : FlutterFlowTheme.of(context).warning,
                      Colors.white,
                    ),
                    width: 3,
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
