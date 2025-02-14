import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/edge_component_widget.dart';
import '/components/node_add_form_widget.dart';
import '/components/node_child_widget.dart';
import '/components/node_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'n_f_diagram_min_model.dart';
export 'n_f_diagram_min_model.dart';

class NFDiagramMinWidget extends StatefulWidget {
  const NFDiagramMinWidget({super.key});

  @override
  State<NFDiagramMinWidget> createState() => _NFDiagramMinWidgetState();
}

class _NFDiagramMinWidgetState extends State<NFDiagramMinWidget> {
  late NFDiagramMinModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NFDiagramMinModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().Nodes = functions.initNodes().toList().cast<NodeStruct>();
      safeSetState(() {});
    });

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

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () async {
          // Reset selections
          await actions.resetSelections(
            FFAppState().Nodes.toList(),
          );
          // Set selected index
          FFAppState().NodeSelectedIndex = -1;
          safeSetState(() {});
        },
        onSecondaryTapUp: (details) async {
          // Show context menu
          await actions.showContextMenu(
            context,
            NFPointStruct(
              positionX: details.globalPosition.dx,
              positionY: details.globalPosition.dy,
            ),
            () async {
              // Show node add form
              await showDialog(
                context: context,
                builder: (dialogContext) {
                  return Dialog(
                    elevation: 0,
                    insetPadding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    alignment: AlignmentDirectional(0.0, 0.0)
                        .resolve(Directionality.of(context)),
                    child: Container(
                      height: 600.0,
                      width: 500.0,
                      child: NodeAddFormWidget(),
                    ),
                  );
                },
              );
            },
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Color(0x7AEE8B60),
          ),
          child: Stack(
            children: [
              if (true)
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: custom_widgets.NFDiagramGrid(
                    width: double.infinity,
                    height: double.infinity,
                    lineColor:
                        FlutterFlowTheme.of(context).nFDefaultGridLineColor,
                    backgroundColor: FlutterFlowTheme.of(context)
                        .nFDefaultGridBackgroundColor,
                    axisColor: FlutterFlowTheme.of(context).nFDefaultAxisColor,
                    gridType: FFAppState().CurrentGridType,
                  ),
                ),
              if (FFAppState().Nodes.isNotEmpty)
                Builder(
                  builder: (context) {
                    final edges = FFAppState().Edges.toList();

                    return Stack(
                      children: List.generate(edges.length, (edgesIndex) {
                        final edgesItem = edges[edgesIndex];
                        return Transform.scale(
                          scaleX: _model.transformFactor,
                          scaleY: _model.transformFactor,
                          child: EdgeComponentWidget(
                            key: Key('Keydv6_${edgesIndex}_of_${edges.length}'),
                            edge: edgesItem,
                            sourceNode: functions.getNodeFromId(
                                edgesItem.sourceNodeId,
                                FFAppState().Nodes.toList()),
                            targetNode: functions.getNodeFromId(
                                edgesItem.targetNodeId,
                                FFAppState().Nodes.toList()),
                          ),
                        );
                      }),
                    );
                  },
                ),
              Builder(
                builder: (context) {
                  final nodesList = FFAppState().Nodes.toList();

                  return Stack(
                    children: List.generate(nodesList.length, (nodesListIndex) {
                      final nodesListItem = nodesList[nodesListIndex];
                      return Align(
                        alignment: AlignmentDirectional(
                            valueOrDefault<double>(
                              functions
                                  .virtualToRelativeMinimized(
                                      nodesListItem.virtualPosition,
                                      nodesListItem.size,
                                      NFOffsetStruct(
                                        offsetX: 0.0,
                                        offsetY: 0.0,
                                      ),
                                      1.0,
                                      NFSizeStruct(
                                        width: MediaQuery.sizeOf(context).width,
                                        height:
                                            MediaQuery.sizeOf(context).height,
                                      ),
                                      0.01)
                                  .offsetX,
                              0.0,
                            ),
                            valueOrDefault<double>(
                              functions
                                  .virtualToRelativeMinimized(
                                      nodesListItem.virtualPosition,
                                      nodesListItem.size,
                                      NFOffsetStruct(
                                        offsetX: 0.0,
                                        offsetY: 0.0,
                                      ),
                                      1.0,
                                      NFSizeStruct(
                                        width: MediaQuery.sizeOf(context).width,
                                        height:
                                            MediaQuery.sizeOf(context).height,
                                      ),
                                      0.01)
                                  .offsetY,
                              0.0,
                            )),
                        child: Transform.scale(
                          scaleX: _model.transformFactor,
                          scaleY: _model.transformFactor,
                          child: Container(
                            decoration: BoxDecoration(),
                            child: NodeComponentWidget(
                              key: Key(
                                  'Keygv2_${nodesListIndex}_of_${nodesList.length}'),
                              node: nodesListItem,
                              onTapDown: () async {},
                              onTapUp: () async {},
                              onPanDown: () async {
                                // Set selected index
                                FFAppState().NodeSelectedIndex = nodesListIndex;
                                safeSetState(() {});
                                // Reset all isMoveable
                                await actions.resetMoveables(
                                  FFAppState().Nodes.toList(),
                                );
                                // Is moveable true
                                FFAppState().updateNodesAtIndex(
                                  FFAppState().NodeSelectedIndex,
                                  (e) => e..isMoveable = true,
                                );
                                safeSetState(() {});
                                // Reset selections
                                await actions.resetSelections(
                                  FFAppState().Nodes.toList(),
                                );
                                // Toggle selected item
                                FFAppState().updateNodesAtIndex(
                                  FFAppState().NodeSelectedIndex,
                                  (e) => e..isSelected = !e.isSelected,
                                );
                                safeSetState(() {});
                                // Bring to front selected item
                                _model.sortedNodes =
                                    await actions.sortByIsSelected(
                                  FFAppState().Nodes.toList(),
                                );
                                // Bring to front selected item
                                FFAppState().Nodes = _model.sortedNodes!
                                    .toList()
                                    .cast<NodeStruct>();
                                safeSetState(() {});
                                // Set selected index
                                FFAppState().NodeSelectedIndex =
                                    FFAppState().Nodes.length - 1;
                                safeSetState(() {});

                                safeSetState(() {});
                              },
                              onPanEnd: () async {
                                // Reset all isMoveable
                                await actions.resetMoveables(
                                  FFAppState().Nodes.toList(),
                                );
                                // Is moveable false
                                FFAppState().updateNodesAtIndex(
                                  FFAppState().NodeSelectedIndex,
                                  (e) => e..isMoveable = false,
                                );
                                safeSetState(() {});
                              },
                              onPanUpdate: (deltaPoint) async {
                                // Render node movement
                                FFAppState().updateNodesAtIndex(
                                  FFAppState().NodeSelectedIndex,
                                  (e) => e
                                    ..virtualPosition = NFOffsetStruct(
                                      offsetX: FFAppState()
                                              .Nodes
                                              .elementAtOrNull(FFAppState()
                                                  .NodeSelectedIndex)!
                                              .virtualPosition
                                              .offsetX +
                                          deltaPoint.positionX,
                                      offsetY: FFAppState()
                                              .Nodes
                                              .elementAtOrNull(FFAppState()
                                                  .NodeSelectedIndex)!
                                              .virtualPosition
                                              .offsetY +
                                          deltaPoint.positionY,
                                    ),
                                );
                                safeSetState(() {});
                              },
                              renderPanStack: () async {
                                FFAppState().updateEdgeDrawingStruct(
                                  (e) => e..drawingState = DrawingState.started,
                                );
                                safeSetState(() {});
                              },
                              onSecondaryTapUp: (deltaPoint) async {
                                await actions.showContextMenuRemoveNode(
                                  context,
                                  deltaPoint,
                                  () async {
                                    // Remove node from list
                                    FFAppState().removeFromNodes(nodesListItem);
                                    safeSetState(() {});
                                    // Remove edges by node id
                                    await actions.removeEdgesByNodeId(
                                      nodesListItem.id,
                                    );
                                  },
                                );
                              },
                              child: () => NodeChildWidget(
                                node: nodesListItem,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
              if ((FFAppState().EdgeDrawing.drawingState ==
                      DrawingState.started) ||
                  (FFAppState().EdgeDrawing.drawingState ==
                      DrawingState.active))
                Align(
                  alignment: AlignmentDirectional(
                      valueOrDefault<double>(
                        functions
                            .virtualToRelativeMinimized(
                                NFOffsetStruct(
                                  offsetX: -FFAppState().ViewportCenter.offsetX,
                                  offsetY: -FFAppState().ViewportCenter.offsetY,
                                ),
                                NFSizeStruct(
                                  width: MediaQuery.sizeOf(context).width /
                                      FFAppState().ZoomFactor,
                                  height: MediaQuery.sizeOf(context).height /
                                      FFAppState().ZoomFactor,
                                ),
                                NFOffsetStruct(
                                  offsetX: 0.0,
                                  offsetY: 0.0,
                                ),
                                FFAppState().DefaultZoomFactor /
                                    FFAppState().ZoomFactor,
                                NFSizeStruct(
                                  width: MediaQuery.sizeOf(context).width,
                                  height: MediaQuery.sizeOf(context).height,
                                ),
                                0.01)
                            .offsetX,
                        0.0,
                      ),
                      valueOrDefault<double>(
                        functions
                            .virtualToRelativeMinimized(
                                NFOffsetStruct(
                                  offsetX: -FFAppState().ViewportCenter.offsetX,
                                  offsetY: -FFAppState().ViewportCenter.offsetY,
                                ),
                                NFSizeStruct(
                                  width: MediaQuery.sizeOf(context).width /
                                      FFAppState().ZoomFactor,
                                  height: MediaQuery.sizeOf(context).height /
                                      FFAppState().ZoomFactor,
                                ),
                                NFOffsetStruct(
                                  offsetX: 0.0,
                                  offsetY: 0.0,
                                ),
                                FFAppState().DefaultZoomFactor /
                                    FFAppState().ZoomFactor,
                                NFSizeStruct(
                                  width: MediaQuery.sizeOf(context).width,
                                  height: MediaQuery.sizeOf(context).height,
                                ),
                                0.01)
                            .offsetY,
                        0.0,
                      )),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width /
                        FFAppState().ZoomFactor,
                    height: MediaQuery.sizeOf(context).height /
                        FFAppState().ZoomFactor,
                    decoration: BoxDecoration(),
                    child:
                        // TODO: needs refactor to correctly draw in scale different to 1.0
                        // Nice to heave feature, current workaround by clicking strat and end socket is good enough.
                        Visibility(
                      visible: (FFAppState().EdgeDrawing.drawingState ==
                              DrawingState.started) ||
                          (FFAppState().EdgeDrawing.drawingState ==
                              DrawingState.active),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: custom_widgets.CurvedLine(
                          width: double.infinity,
                          height: double.infinity,
                          start: FFAppState().EdgeDrawing.drawingStartPoint,
                          end: FFAppState().EdgeDrawing.drawingEndPoint,
                          lineType: NFLineType.dotted,
                          isArrowPointingToStartPoint: FFAppState()
                                      .CurrentBuildingEdge
                                      .targetNodeId !=
                                  null &&
                              FFAppState().CurrentBuildingEdge.targetNodeId !=
                                  '',
                          lineColor:
                              FlutterFlowTheme.of(context).nFDefaultEdgeColor,
                          scaleFactor: 0.01,
                          onTap: () async {},
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
