import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/node_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // Init nodes
      FFAppState().Nodes = functions.initNodes().toList().cast<NodeStruct>();
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: InkWell(
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
                color: FlutterFlowTheme.of(context).secondaryText,
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
                            return Visibility(
                              visible: true,
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: custom_widgets.CurvedLine(
                                  width: double.infinity,
                                  height: double.infinity,
                                  start: functions.calculateStartPointFromEdge(
                                      edgesItem,
                                      MediaQuery.sizeOf(context).width,
                                      MediaQuery.sizeOf(context).height,
                                      FFAppState().Nodes.toList(),
                                      FFAppState().ViewportCenter,
                                      FFAppState().ZoomFactor),
                                  end: functions.calculateEndPointFromEdge(
                                      edgesItem,
                                      MediaQuery.sizeOf(context).width,
                                      MediaQuery.sizeOf(context).height,
                                      FFAppState().Nodes.toList(),
                                      FFAppState().ViewportCenter,
                                      FFAppState().ZoomFactor)!,
                                  onTap: () async {
                                    // Remove from list
                                    FFAppState().removeFromEdges(edgesItem);
                                    safeSetState(() {});
                                  },
                                ),
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
                        children:
                            List.generate(nodesList.length, (nodesListIndex) {
                          final nodesListItem = nodesList[nodesListIndex];
                          return Align(
                            alignment: AlignmentDirectional(
                                valueOrDefault<double>(
                                  functions
                                      .virtualToRelative(
                                          nodesListItem.virtualPosition,
                                          nodesListItem.size,
                                          FFAppState().ViewportCenter,
                                          FFAppState().ZoomFactor,
                                          NFSizeStruct(
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            height: MediaQuery.sizeOf(context)
                                                .height,
                                          ))
                                      .offsetX,
                                  0.0,
                                ),
                                valueOrDefault<double>(
                                  functions
                                      .virtualToRelative(
                                          nodesListItem.virtualPosition,
                                          nodesListItem.size,
                                          FFAppState().ViewportCenter,
                                          FFAppState().ZoomFactor,
                                          NFSizeStruct(
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            height: MediaQuery.sizeOf(context)
                                                .height,
                                          ))
                                      .offsetY,
                                  0.0,
                                )),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: NodeComponentWidget(
                                key: Key(
                                    'Keyr1c_${nodesListIndex}_of_${nodesList.length}'),
                                node: nodesListItem,
                                onTapDown: () async {},
                                onTapUp: () async {},
                                onPanDown: () async {
                                  // Set selected index
                                  FFAppState().NodeSelectedIndex =
                                      nodesListIndex;
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
                                    (e) =>
                                        e..drawingState = DrawingState.started,
                                  );
                                  safeSetState(() {});
                                },
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
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: custom_widgets.CurvedLine(
                        width: double.infinity,
                        height: double.infinity,
                        start: FFAppState().EdgeDrawing.drawingStartPoint,
                        end: FFAppState().EdgeDrawing.drawingEndPoint,
                        onTap: () async {},
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
