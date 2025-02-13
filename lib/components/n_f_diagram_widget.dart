import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/dummy_node_widget.dart';
import '/components/edge_component_widget.dart';
import '/components/node_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'n_f_diagram_model.dart';
export 'n_f_diagram_model.dart';

class NFDiagramWidget extends StatefulWidget {
  const NFDiagramWidget({super.key});

  @override
  State<NFDiagramWidget> createState() => _NFDiagramWidgetState();
}

class _NFDiagramWidgetState extends State<NFDiagramWidget> {
  late NFDiagramModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NFDiagramModel());

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        // Reset selections
        await actions.resetSelections(
          FFAppState().Nodes.toList(),
        );
        // Set selected index
        FFAppState().NodeSelectedIndex = -1;
        safeSetState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0x67000000),
        ),
        child: Stack(
          children: [
            if (FFAppState().Nodes.isNotEmpty)
              Builder(
                builder: (context) {
                  final edges = FFAppState().Edges.toList();

                  return Stack(
                    children: List.generate(edges.length, (edgesIndex) {
                      final edgesItem = edges[edgesIndex];
                      return EdgeComponentWidget(
                        key: Key('Key9fy_${edgesIndex}_of_${edges.length}'),
                        edge: edgesItem,
                        sourceNode: functions.getNodeFromId(
                            edgesItem.sourceNodeId,
                            FFAppState().Nodes.toList()),
                        targetNode: functions.getNodeFromId(
                            edgesItem.targetNodeId,
                            FFAppState().Nodes.toList()),
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
                                .virtualToRelative(
                                    nodesListItem.virtualPosition,
                                    nodesListItem.size,
                                    NFOffsetStruct(
                                      offsetX: 0.0,
                                      offsetY: 0.0,
                                    ),
                                    1.0,
                                    NFSizeStruct(
                                      width: MediaQuery.sizeOf(context).width,
                                      height: MediaQuery.sizeOf(context).height,
                                    ))
                                .offsetX,
                            0.0,
                          ),
                          valueOrDefault<double>(
                            functions
                                .virtualToRelative(
                                    nodesListItem.virtualPosition,
                                    nodesListItem.size,
                                    NFOffsetStruct(
                                      offsetX: 0.0,
                                      offsetY: 0.0,
                                    ),
                                    1.0,
                                    NFSizeStruct(
                                      width: MediaQuery.sizeOf(context).width,
                                      height: MediaQuery.sizeOf(context).height,
                                    ))
                                .offsetY,
                            0.0,
                          )),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: NodeComponentWidget(
                          key: Key(
                              'Key95t_${nodesListIndex}_of_${nodesList.length}'),
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
                            _model.sortedNodes = await actions.sortByIsSelected(
                              FFAppState().Nodes.toList(),
                            );
                            // Bring to front selected item
                            FFAppState().Nodes =
                                _model.sortedNodes!.toList().cast<NodeStruct>();
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
                                          .elementAtOrNull(
                                              FFAppState().NodeSelectedIndex)!
                                          .virtualPosition
                                          .offsetX +
                                      deltaPoint.positionX,
                                  offsetY: FFAppState()
                                          .Nodes
                                          .elementAtOrNull(
                                              FFAppState().NodeSelectedIndex)!
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
                          onSecondaryTapUp: (deltaPoint) async {},
                          child: () => DummyNodeWidget(),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
