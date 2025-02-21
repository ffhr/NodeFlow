import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/socket_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
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
    required this.child,
    this.onSecondaryTapUp,
  });

  final NodeStruct? node;
  final Future Function()? onTapDown;
  final Future Function()? onTapUp;
  final Future Function()? onPanDown;
  final Future Function()? onPanEnd;
  final Future Function(NFPointStruct deltaPoint)? onPanUpdate;
  final Future Function()? renderPanStack;
  final Widget Function()? child;
  final Future Function(NFPointStruct deltaPoint)? onSecondaryTapUp;

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
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(),
                child: Visibility(
                  visible: widget!.child != null,
                  child: GestureDetector(
                    onPanDown: (details) async {
                      if ((FFAppState().NFEdgeDrawingState.drawingStateType ==
                              NFEdgeDrawingStateType.inactive) ||
                          (FFAppState().NFEdgeDrawingState.drawingStateType ==
                              NFEdgeDrawingStateType.finished)) {
                        // On pan down
                        await widget.onPanDown?.call();
                      }
                    },
                    onPanEnd: (details) async {
                      if ((FFAppState().NFEdgeDrawingState.drawingStateType ==
                              NFEdgeDrawingStateType.inactive) ||
                          (FFAppState().NFEdgeDrawingState.drawingStateType ==
                              NFEdgeDrawingStateType.finished)) {
                        // On pan end
                        await widget.onPanEnd?.call();
                      }
                    },
                    onPanUpdate: (details) async {
                      if ((FFAppState().NFEdgeDrawingState.drawingStateType ==
                              NFEdgeDrawingStateType.inactive) ||
                          (FFAppState().NFEdgeDrawingState.drawingStateType ==
                              NFEdgeDrawingStateType.finished)) {
                        // On pan update
                        await widget.onPanUpdate?.call(
                          NFPointStruct(
                            positionX: details.delta.dx,
                            positionY: details.delta.dy,
                          ),
                        );
                      }
                    },
                    onSecondaryTapUp: (details) async {
                      if ((FFAppState().NFEdgeDrawingState.drawingStateType ==
                              NFEdgeDrawingStateType.inactive) ||
                          (FFAppState().NFEdgeDrawingState.drawingStateType ==
                              NFEdgeDrawingStateType.finished)) {
                        // On secondary tap up
                        await widget.onSecondaryTapUp?.call(
                          NFPointStruct(
                            positionX: details.globalPosition.dx,
                            positionY: details.globalPosition.dy,
                          ),
                        );
                      }
                    },
                    onTapDown: (details) async {
                      if ((FFAppState().NFEdgeDrawingState.drawingStateType ==
                              NFEdgeDrawingStateType.inactive) ||
                          (FFAppState().NFEdgeDrawingState.drawingStateType ==
                              NFEdgeDrawingStateType.finished)) {
                        // On tap down
                        await widget.onTapDown?.call();
                      }
                    },
                    onTapUp: (details) async {
                      if ((FFAppState().NFEdgeDrawingState.drawingStateType ==
                              NFEdgeDrawingStateType.inactive) ||
                          (FFAppState().NFEdgeDrawingState.drawingStateType ==
                              NFEdgeDrawingStateType.finished)) {
                        // On tap up
                        await widget.onTapUp?.call();
                      }
                    },
                    child: Builder(builder: (_) {
                      return widget.child!();
                    }),
                  ),
                ),
              ),
            ),
          ),
          Builder(
            builder: (context) {
              final inputsList = widget!.node?.inputs?.toList() ?? [];

              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(inputsList.length, (inputsListIndex) {
                  final inputsListItem = inputsList[inputsListIndex];
                  return SocketComponentWidget(
                    key: Key(
                        'Keyhbf_${inputsListIndex}_of_${inputsList.length}'),
                    isClicked:
                        (FFAppState().NFCurrentBuildingEdge.targetNodeId ==
                                widget!.node?.id) &&
                            (FFAppState()
                                    .NFCurrentBuildingEdge
                                    .targetInputSocketIndex ==
                                inputsListIndex),
                    defaultColor: Color(0xFF0034FD),
                    selectedColor: Color(0xFF00007B),
                    onClicked: (isClicked) async {
                      // On clicked a block
                      await _model.onClickedActionBlock(
                        context,
                        isClicked: isClicked,
                        nodeId: widget!.node?.id,
                        nodeIndex: inputsListIndex,
                        isInput: true,
                      );
                    },
                    onPanDown: (point) async {},
                    onPanEnd: (point) async {
                      // Set node source output socket
                      FFAppState().updateNFCurrentBuildingEdgeStruct(
                        (e) => e
                          ..sourceNodeId = functions.getSourceNodeIdFromPoint(
                              point,
                              FFAppState().Nodes.toList(),
                              FFAppState().NFViewportCenter,
                              FFAppState().NFZoomFactor /
                                  FFAppState().DefaultZoomFactor,
                              MediaQuery.sizeOf(context).width,
                              MediaQuery.sizeOf(context).height)
                          ..sourceOutputSocketIndex =
                              functions.getSourceOutputIndexFromPoint(
                                  point,
                                  FFAppState().Nodes.toList(),
                                  FFAppState().NFViewportCenter,
                                  FFAppState().NFZoomFactor /
                                      FFAppState().DefaultZoomFactor,
                                  MediaQuery.sizeOf(context).width,
                                  MediaQuery.sizeOf(context).height),
                      );
                      _model.updatePage(() {});
                      if (FFAppState().NFCurrentBuildingEdge.hasSourceNodeId() &&
                          FFAppState()
                              .NFCurrentBuildingEdge
                              .hasTargetNodeId() &&
                          FFAppState()
                              .NFCurrentBuildingEdge
                              .hasSourceOutputSocketIndex() &&
                          FFAppState()
                              .NFCurrentBuildingEdge
                              .hasTargetInputSocketIndex()) {
                        // Add building edge to list
                        FFAppState()
                            .addToEdges(FFAppState().NFCurrentBuildingEdge);
                        safeSetState(() {});
                        // Unset
                        FFAppState().NFCurrentBuildingEdge = NodeEdgeStruct();
                        _model.updatePage(() {});
                      } else {
                        // Unset
                        FFAppState().NFCurrentBuildingEdge = NodeEdgeStruct();
                        _model.updatePage(() {});
                      }
                    },
                  );
                }).divide(SizedBox(height: 10.0)),
              );
            },
          ),
          Align(
            alignment: AlignmentDirectional(1.0, 0.0),
            child: Builder(
              builder: (context) {
                final outputsList = widget!.node?.outputs?.toList() ?? [];

                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      List.generate(outputsList.length, (outputsListIndex) {
                    final outputsListItem = outputsList[outputsListIndex];
                    return GestureDetector(
                      onPanUpdate: (details) async {
                        FFAppState().updateNFEdgeDrawingStateStruct(
                          (e) => e
                            ..drawingEndPoint = NFPointStruct(
                              positionX: details.globalPosition.dx,
                              positionY: details.globalPosition.dy,
                            ),
                        );
                        safeSetState(() {});
                      },
                      child: SocketComponentWidget(
                        key: Key(
                            'Keydt4_${outputsListIndex}_of_${outputsList.length}'),
                        isClicked:
                            (FFAppState().NFCurrentBuildingEdge.sourceNodeId ==
                                    widget!.node?.id) &&
                                (FFAppState()
                                        .NFCurrentBuildingEdge
                                        .sourceOutputSocketIndex ==
                                    outputsListIndex),
                        defaultColor: Color(0xFF2EFF00),
                        selectedColor: Color(0xFF036200),
                        onClicked: (isClicked) async {
                          // On clicked action block
                          await _model.onClickedActionBlock(
                            context,
                            isClicked: isClicked,
                            nodeId: widget!.node?.id,
                            nodeIndex: outputsListIndex,
                            isInput: false,
                          );
                        },
                        onPanDown: (point) async {},
                        onPanEnd: (point) async {
                          // Set node target input socket
                          FFAppState().updateNFCurrentBuildingEdgeStruct(
                            (e) => e
                              ..targetNodeId =
                                  functions.getTargetNodeIdFromPoint(
                                      point,
                                      FFAppState().Nodes.toList(),
                                      FFAppState().NFViewportCenter,
                                      FFAppState().NFZoomFactor /
                                          FFAppState().DefaultZoomFactor,
                                      MediaQuery.sizeOf(context).width,
                                      MediaQuery.sizeOf(context).height)
                              ..targetInputSocketIndex =
                                  functions.getTargetInputIndexFromPoint(
                                      point,
                                      FFAppState().Nodes.toList(),
                                      FFAppState().NFViewportCenter,
                                      FFAppState().NFZoomFactor /
                                          FFAppState().DefaultZoomFactor,
                                      MediaQuery.sizeOf(context).width,
                                      MediaQuery.sizeOf(context).height),
                          );
                          _model.updatePage(() {});
                          if (FFAppState().NFCurrentBuildingEdge.hasSourceNodeId() &&
                              FFAppState()
                                  .NFCurrentBuildingEdge
                                  .hasTargetNodeId() &&
                              FFAppState()
                                  .NFCurrentBuildingEdge
                                  .hasSourceOutputSocketIndex() &&
                              FFAppState()
                                  .NFCurrentBuildingEdge
                                  .hasTargetInputSocketIndex()) {
                            // Add building edge to list
                            FFAppState()
                                .addToEdges(FFAppState().NFCurrentBuildingEdge);
                            safeSetState(() {});
                            // Unset
                            FFAppState().NFCurrentBuildingEdge =
                                NodeEdgeStruct();
                            _model.updatePage(() {});
                          } else {
                            // Unset
                            FFAppState().NFCurrentBuildingEdge =
                                NodeEdgeStruct();
                            _model.updatePage(() {});
                          }
                        },
                      ),
                    );
                  }).divide(SizedBox(height: 10.0)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
