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
    bool? isClicked,
    required this.onClicked,
    this.onPanDown,
    this.onPanEnd,
    Color? defaultColor,
    Color? selectedColor,
  })  : this.isClicked = isClicked ?? false,
        this.defaultColor = defaultColor ?? const Color(0xFFFF0000),
        this.selectedColor = selectedColor ?? const Color(0xFF9100FF);

  final bool isClicked;
  final Future Function(bool isClicked)? onClicked;
  final Future Function(NFPointStruct point)? onPanDown;
  final Future Function(NFPointStruct point)? onPanEnd;
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
                if ((FFAppState().NFEdgeDrawingState.drawingStateType ==
                        NFEdgeDrawingStateType.inactive) ||
                    (FFAppState().NFEdgeDrawingState.drawingStateType ==
                        NFEdgeDrawingStateType.finished)) {
                  // Set status Drawing.STARTED
                  FFAppState().updateNFEdgeDrawingStateStruct(
                    (e) => e
                      ..drawingStateType = NFEdgeDrawingStateType.started
                      ..drawingStartPoint = NFPointStruct(
                        positionX: functions.scaledGlobalPosition(
                            details.globalPosition.dx,
                            FFAppState().DefaultZoomFactor,
                            FFAppState().NFZoomFactor),
                        positionY: functions.scaledGlobalPosition(
                            details.globalPosition.dy,
                            FFAppState().DefaultZoomFactor,
                            FFAppState().NFZoomFactor),
                      )
                      ..drawingEndPoint = NFPointStruct(
                        positionX: functions.scaledGlobalPosition(
                            details.globalPosition.dx,
                            FFAppState().DefaultZoomFactor,
                            FFAppState().NFZoomFactor),
                        positionY: functions.scaledGlobalPosition(
                            details.globalPosition.dy,
                            FFAppState().DefaultZoomFactor,
                            FFAppState().NFZoomFactor),
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
                FFAppState().updateNFEdgeDrawingStateStruct(
                  (e) => e..drawingStateType = NFEdgeDrawingStateType.finished,
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
                FFAppState().updateNFEdgeDrawingStateStruct(
                  (e) => e
                    ..drawingStateType = NFEdgeDrawingStateType.active
                    ..drawingEndPoint = NFPointStruct(
                      positionX: functions.scaledGlobalPosition(
                          details.globalPosition.dx,
                          FFAppState().DefaultZoomFactor,
                          FFAppState().NFZoomFactor),
                      positionY: functions.scaledGlobalPosition(
                          details.globalPosition.dy,
                          FFAppState().DefaultZoomFactor,
                          FFAppState().NFZoomFactor),
                    ),
                );
                FFAppState().update(() {});
              },
              onTapUp: (details) async {
                // Set status Drawing.FINISHED
                FFAppState().updateNFEdgeDrawingStateStruct(
                  (e) => e..drawingStateType = NFEdgeDrawingStateType.finished,
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
                      _model.mouseRegionHovered! ? Colors.white : Colors.white,
                      Colors.white,
                    ),
                    width: _model.mouseRegionHovered! ? 3.0 : 1.0,
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
                if ((FFAppState().NFEdgeDrawingState.drawingStateType ==
                        NFEdgeDrawingStateType.inactive) ||
                    (FFAppState().NFEdgeDrawingState.drawingStateType ==
                        NFEdgeDrawingStateType.finished)) {
                  // Set status Drawing.STARTED
                  FFAppState().updateNFEdgeDrawingStateStruct(
                    (e) => e
                      ..drawingStateType = NFEdgeDrawingStateType.started
                      ..drawingStartPoint = NFPointStruct(
                        positionX: functions.scaledGlobalPosition(
                            details.globalPosition.dx,
                            FFAppState().DefaultZoomFactor,
                            FFAppState().NFZoomFactor),
                        positionY: functions.scaledGlobalPosition(
                            details.globalPosition.dy,
                            FFAppState().DefaultZoomFactor,
                            FFAppState().NFZoomFactor),
                      )
                      ..drawingEndPoint = NFPointStruct(
                        positionX: functions.scaledGlobalPosition(
                            details.globalPosition.dx,
                            FFAppState().DefaultZoomFactor,
                            FFAppState().NFZoomFactor),
                        positionY: functions.scaledGlobalPosition(
                            details.globalPosition.dy,
                            FFAppState().DefaultZoomFactor,
                            FFAppState().NFZoomFactor),
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
                FFAppState().updateNFEdgeDrawingStateStruct(
                  (e) => e..drawingStateType = NFEdgeDrawingStateType.finished,
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
                FFAppState().updateNFEdgeDrawingStateStruct(
                  (e) => e
                    ..drawingStateType = NFEdgeDrawingStateType.active
                    ..drawingEndPoint = NFPointStruct(
                      positionX: functions.scaledGlobalPosition(
                          details.globalPosition.dx,
                          FFAppState().DefaultZoomFactor,
                          FFAppState().NFZoomFactor),
                      positionY: functions.scaledGlobalPosition(
                          details.globalPosition.dy,
                          FFAppState().DefaultZoomFactor,
                          FFAppState().NFZoomFactor),
                    ),
                );
                FFAppState().update(() {});
              },
              onTapUp: (details) async {
                // Set status Drawing.FINISHED
                FFAppState().updateNFEdgeDrawingStateStruct(
                  (e) => e..drawingStateType = NFEdgeDrawingStateType.finished,
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
                      _model.mouseRegionHovered! ? Colors.white : Colors.white,
                      Colors.white,
                    ),
                    width: _model.mouseRegionHovered! ? 3.0 : 1.0,
                  ),
                ),
              ),
            );
          }
        },
      ),
      onEnter: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = true);
      }),
      onExit: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = false);
      }),
    );
  }
}
