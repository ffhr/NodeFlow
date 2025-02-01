import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/socket_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'node_component_model.dart';
export 'node_component_model.dart';

class NodeComponentWidget extends StatefulWidget {
  const NodeComponentWidget({
    super.key,
    required this.node,
    this.onTapDown,
    this.onTapUp,
    this.onPanDown,
    this.onPanEnd,
    this.onPanUpdate,
    this.renderPanStack,
  });

  final NodeStruct? node;
  final Future Function()? onTapDown;
  final Future Function()? onTapUp;
  final Future Function()? onPanDown;
  final Future Function()? onPanEnd;
  final Future Function(NFPointStruct deltaPoint)? onPanUpdate;
  final Future Function()? renderPanStack;

  @override
  State<NodeComponentWidget> createState() => _NodeComponentWidgetState();
}

class _NodeComponentWidgetState extends State<NodeComponentWidget> {
  late NodeComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NodeComponentModel());

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

    return Container(
      width: widget!.node?.size?.width,
      height: widget!.node?.size?.height,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
            child: GestureDetector(
              onPanDown: (details) async {
                if ((FFAppState().EdgeDrawing.drawingState ==
                        DrawingState.inactive) ||
                    (FFAppState().EdgeDrawing.drawingState ==
                        DrawingState.finished)) {
                  // On pan down
                  await widget.onPanDown?.call();
                }
              },
              onPanEnd: (details) async {
                if ((FFAppState().EdgeDrawing.drawingState ==
                        DrawingState.inactive) ||
                    (FFAppState().EdgeDrawing.drawingState ==
                        DrawingState.finished)) {
                  // On pan end
                  await widget.onPanEnd?.call();
                }
              },
              onPanUpdate: (details) async {
                if ((FFAppState().EdgeDrawing.drawingState ==
                        DrawingState.inactive) ||
                    (FFAppState().EdgeDrawing.drawingState ==
                        DrawingState.finished)) {
                  // On pan update
                  await widget.onPanUpdate?.call(
                    NFPointStruct(
                      positionX: details.delta.dx,
                      positionY: details.delta.dy,
                    ),
                  );
                }
              },
              onTapDown: (details) async {
                if ((FFAppState().EdgeDrawing.drawingState ==
                        DrawingState.inactive) ||
                    (FFAppState().EdgeDrawing.drawingState ==
                        DrawingState.finished)) {
                  // On tap down
                  await widget.onTapDown?.call();
                }
              },
              onTapUp: (details) async {
                if ((FFAppState().EdgeDrawing.drawingState ==
                        DrawingState.inactive) ||
                    (FFAppState().EdgeDrawing.drawingState ==
                        DrawingState.finished)) {
                  // On tap up
                  await widget.onTapUp?.call();
                }
              },
              child: Container(
                width: widget!.node?.size?.width,
                height: widget!.node?.size?.height,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondary,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: widget!.node!.isSelected
                        ? Colors.white
                        : Color(0x00000000),
                    width: 2.0,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget!.node?.title,
                                '[title]',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 0.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget!.node?.description,
                                    '[description]',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                  '${valueOrDefault<String>(
                                    formatNumber(
                                      widget!.node?.virtualPosition?.offsetX,
                                      formatType: FormatType.custom,
                                      format: '##.##',
                                      locale: '',
                                    ),
                                    '##.##',
                                  )}, ${valueOrDefault<String>(
                                    formatNumber(
                                      widget!.node?.virtualPosition?.offsetY,
                                      formatType: FormatType.custom,
                                      format: '##.##',
                                      locale: '',
                                    ),
                                    '##.###',
                                  )}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
            child: Builder(
              builder: (context) {
                final inputsList =
                    (widget!.node?.inputs?.toList() ?? []).take(3).toList();

                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(inputsList.length, (inputsListIndex) {
                    final inputsListItem = inputsList[inputsListIndex];
                    return SocketComponentWidget(
                      key: Key(
                          'Keyhbf_${inputsListIndex}_of_${inputsList.length}'),
                      isHovered: inputsListItem.socket.isHover,
                      isClicked:
                          (FFAppState().CurrentBuildingEdge.targetNodeId ==
                                  widget!.node?.id) &&
                              (FFAppState()
                                      .CurrentBuildingEdge
                                      .targetInputSocketIndex ==
                                  inputsListIndex),
                      renderPan: () async {
                        await widget.renderPanStack?.call();
                      },
                      mouseEntered: () async {
                        await actions.onMouseEnterNodeSocket(
                          inputsListItem.socket,
                        );
                        _model.renderNodeVar = _model.renderNodeVar;
                        safeSetState(() {});
                      },
                      mouseExit: () async {
                        await actions.onMouseExitNodeSocket(
                          inputsListItem.socket,
                        );
                        _model.renderNodeVar = _model.renderNodeVar;
                        safeSetState(() {});
                      },
                      onClicked: (isClicked) async {
                        if (isClicked) {
                          // Set node target input socket
                          FFAppState().updateCurrentBuildingEdgeStruct(
                            (e) => e
                              ..targetNodeId = widget!.node?.id
                              ..targetInputSocketIndex = inputsListIndex,
                          );
                          _model.updatePage(() {});
                          if (FFAppState().CurrentBuildingEdge.hasSourceNodeId() &&
                              FFAppState()
                                  .CurrentBuildingEdge
                                  .hasTargetNodeId() &&
                              FFAppState()
                                  .CurrentBuildingEdge
                                  .hasSourceOutputSocketIndex() &&
                              FFAppState()
                                  .CurrentBuildingEdge
                                  .hasTargetInputSocketIndex()) {
                            // Add building edge to list
                            FFAppState()
                                .addToEdges(FFAppState().CurrentBuildingEdge);
                            safeSetState(() {});
                            // Unset
                            FFAppState().CurrentBuildingEdge = NodeEdgeStruct();
                            _model.updatePage(() {});
                          }
                        } else {
                          // Unset
                          FFAppState().updateCurrentBuildingEdgeStruct(
                            (e) => e
                              ..targetNodeId = null
                              ..targetInputSocketIndex = null,
                          );
                          _model.updatePage(() {});
                        }
                      },
                      onPanDown: (point) async {
                        // Set node target input socket
                        FFAppState().updateCurrentBuildingEdgeStruct(
                          (e) => e
                            ..targetNodeId = widget!.node?.id
                            ..targetInputSocketIndex = inputsListIndex,
                        );
                        _model.updatePage(() {});
                      },
                      onPanEnd: (point) async {
                        // Set node source output socket
                        FFAppState().updateCurrentBuildingEdgeStruct(
                          (e) => e
                            ..sourceNodeId = functions.getSourceNodeIdFromPoint(
                                point,
                                FFAppState().Nodes.toList(),
                                FFAppState().ViewportCenter,
                                FFAppState().ZoomFactor,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height)
                            ..sourceOutputSocketIndex =
                                functions.getSourceOutputIndexFromPoint(
                                    point,
                                    FFAppState().Nodes.toList(),
                                    FFAppState().ViewportCenter,
                                    FFAppState().ZoomFactor,
                                    MediaQuery.sizeOf(context).width,
                                    MediaQuery.sizeOf(context).height),
                        );
                        _model.updatePage(() {});
                        if (FFAppState().CurrentBuildingEdge.hasSourceNodeId() &&
                            FFAppState()
                                .CurrentBuildingEdge
                                .hasTargetNodeId() &&
                            FFAppState()
                                .CurrentBuildingEdge
                                .hasSourceOutputSocketIndex() &&
                            FFAppState()
                                .CurrentBuildingEdge
                                .hasTargetInputSocketIndex()) {
                          // Show snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Crtam edge...',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 2000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                          // Add building edge to list
                          FFAppState()
                              .addToEdges(FFAppState().CurrentBuildingEdge);
                          safeSetState(() {});
                          // Unset
                          FFAppState().CurrentBuildingEdge = NodeEdgeStruct();
                          _model.updatePage(() {});
                        } else {
                          // Unset
                          FFAppState().CurrentBuildingEdge = NodeEdgeStruct();
                          _model.updatePage(() {});
                        }
                      },
                    );
                  }).divide(SizedBox(height: 10.0)),
                );
              },
            ),
          ),
          Align(
            alignment: AlignmentDirectional(1.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
              child: Builder(
                builder: (context) {
                  final outputsList =
                      (widget!.node?.outputs?.toList() ?? []).take(3).toList();

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        List.generate(outputsList.length, (outputsListIndex) {
                      final outputsListItem = outputsList[outputsListIndex];
                      return SocketComponentWidget(
                        key: Key(
                            'Keydt4_${outputsListIndex}_of_${outputsList.length}'),
                        isHovered: outputsListItem.socket.isHover,
                        isClicked:
                            (FFAppState().CurrentBuildingEdge.sourceNodeId ==
                                    widget!.node?.id) &&
                                (FFAppState()
                                        .CurrentBuildingEdge
                                        .sourceOutputSocketIndex ==
                                    outputsListIndex),
                        renderPan: () async {},
                        mouseEntered: () async {
                          await actions.onMouseEnterNodeSocket(
                            outputsListItem.socket,
                          );
                          _model.renderNodeVar = _model.renderNodeVar;
                          safeSetState(() {});
                        },
                        mouseExit: () async {
                          await actions.onMouseExitNodeSocket(
                            outputsListItem.socket,
                          );
                          _model.renderNodeVar = _model.renderNodeVar;
                          safeSetState(() {});
                        },
                        onClicked: (isClicked) async {
                          if (isClicked) {
                            // Set edge source output socket
                            FFAppState().updateCurrentBuildingEdgeStruct(
                              (e) => e
                                ..sourceNodeId = widget!.node?.id
                                ..sourceOutputSocketIndex = outputsListIndex,
                            );
                            _model.updatePage(() {});
                            if (FFAppState().CurrentBuildingEdge.hasSourceNodeId() &&
                                FFAppState()
                                    .CurrentBuildingEdge
                                    .hasTargetNodeId() &&
                                FFAppState()
                                    .CurrentBuildingEdge
                                    .hasSourceOutputSocketIndex() &&
                                FFAppState()
                                    .CurrentBuildingEdge
                                    .hasTargetInputSocketIndex()) {
                              // Add building edge to list
                              FFAppState()
                                  .addToEdges(FFAppState().CurrentBuildingEdge);
                              safeSetState(() {});
                              // Unset
                              FFAppState().CurrentBuildingEdge =
                                  NodeEdgeStruct();
                              _model.updatePage(() {});
                            }
                          } else {
                            // Unset
                            FFAppState().updateCurrentBuildingEdgeStruct(
                              (e) => e
                                ..sourceNodeId = null
                                ..sourceOutputSocketIndex = null,
                            );
                            _model.updatePage(() {});
                          }
                        },
                        onPanDown: (point) async {
                          // Set node source output socket
                          FFAppState().updateCurrentBuildingEdgeStruct(
                            (e) => e
                              ..sourceNodeId = widget!.node?.id
                              ..sourceOutputSocketIndex = outputsListIndex,
                          );
                          _model.updatePage(() {});
                        },
                        onPanEnd: (point) async {
                          // Set node target input socket
                          FFAppState().updateCurrentBuildingEdgeStruct(
                            (e) => e
                              ..targetNodeId =
                                  functions.getTargetNodeIdFromPoint(
                                      point,
                                      FFAppState().Nodes.toList(),
                                      FFAppState().ViewportCenter,
                                      FFAppState().ZoomFactor,
                                      MediaQuery.sizeOf(context).width,
                                      MediaQuery.sizeOf(context).height)
                              ..targetInputSocketIndex =
                                  functions.getTargetInputIndexFromPoint(
                                      point,
                                      FFAppState().Nodes.toList(),
                                      FFAppState().ViewportCenter,
                                      FFAppState().ZoomFactor,
                                      MediaQuery.sizeOf(context).width,
                                      MediaQuery.sizeOf(context).height),
                          );
                          _model.updatePage(() {});
                          if (FFAppState().CurrentBuildingEdge.hasSourceNodeId() &&
                              FFAppState()
                                  .CurrentBuildingEdge
                                  .hasTargetNodeId() &&
                              FFAppState()
                                  .CurrentBuildingEdge
                                  .hasSourceOutputSocketIndex() &&
                              FFAppState()
                                  .CurrentBuildingEdge
                                  .hasTargetInputSocketIndex()) {
                            // Show snackbar
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Crtam edge...',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 2000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                            // Add building edge to list
                            FFAppState()
                                .addToEdges(FFAppState().CurrentBuildingEdge);
                            safeSetState(() {});
                            // Unset
                            FFAppState().CurrentBuildingEdge = NodeEdgeStruct();
                            _model.updatePage(() {});
                          } else {
                            // Unset
                            FFAppState().CurrentBuildingEdge = NodeEdgeStruct();
                            _model.updatePage(() {});
                          }
                        },
                      );
                    }).divide(SizedBox(height: 10.0)),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
