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
      _model.nodes = functions.initNodes().toList().cast<NodeStruct>();
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
                _model.nodes.toList(),
              );
              // Set selected index
              _model.selectedIndex = -1;
              safeSetState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
              child: Stack(
                children: [
                  Builder(
                    builder: (context) {
                      final nodesList = _model.nodes.toList();

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
                                  // Reset all isMoveable
                                  await actions.resetMoveables(
                                    _model.nodes.toList(),
                                  );
                                  // Is moveable true
                                  _model.updateNodesAtIndex(
                                    nodesListIndex,
                                    (e) => e..isMoveable = true,
                                  );
                                  safeSetState(() {});
                                  // Reset selections
                                  await actions.resetSelections(
                                    _model.nodes.toList(),
                                  );
                                  // Toggle selected item
                                  _model.updateNodesAtIndex(
                                    nodesListIndex,
                                    (e) => e
                                      ..isSelected = !nodesListItem.isSelected,
                                  );
                                  safeSetState(() {});
                                  // Bring to front selected item
                                  _model.sortedNodes =
                                      await actions.sortByIsSelected(
                                    _model.nodes.toList(),
                                  );
                                  // Bring to front selected item
                                  _model.nodes = _model.sortedNodes!
                                      .toList()
                                      .cast<NodeStruct>();
                                  safeSetState(() {});
                                  // Set selected index
                                  _model.selectedIndex =
                                      _model.nodes.length - 1;

                                  safeSetState(() {});
                                },
                                onPanEnd: () async {
                                  // Reset all isMoveable
                                  await actions.resetMoveables(
                                    _model.nodes.toList(),
                                  );
                                  // Is moveable false
                                  _model.updateNodesAtIndex(
                                    nodesListIndex,
                                    (e) => e..isMoveable = false,
                                  );
                                  safeSetState(() {});
                                },
                                onPanUpdate: (deltaPoint) async {
                                  // Render node movement
                                  _model.updateNodesAtIndex(
                                    _model.selectedIndex,
                                    (e) => e
                                      ..virtualPosition = NFOffsetStruct(
                                        offsetX: _model.nodes
                                                .elementAtOrNull(
                                                    _model.selectedIndex)!
                                                .virtualPosition
                                                .offsetX +
                                            deltaPoint.positionX,
                                        offsetY: _model.nodes
                                                .elementAtOrNull(
                                                    _model.selectedIndex)!
                                                .virtualPosition
                                                .offsetY +
                                            deltaPoint.positionY,
                                      ),
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
                      ),
                    ),
                  if ((FFAppState().EdgeDrawing.drawingState ==
                          DrawingState.started) ||
                      (FFAppState().EdgeDrawing.drawingState ==
                          DrawingState.active))
                    GestureDetector(
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
