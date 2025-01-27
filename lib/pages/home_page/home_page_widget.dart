import '/backend/schema/structs/index.dart';
import '/components/node_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
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
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: custom_widgets.Line(
                          width: double.infinity,
                          height: double.infinity,
                          start: NFPointStruct(
                            positionX: 100.0,
                            positionY: 120.0,
                          ),
                          end: NFPointStruct(
                            positionX: 200.0,
                            positionY: 220.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Builder(
                    builder: (context) {
                      final nodesList = _model.nodes.toList();

                      return GestureDetector(
                        onPanUpdate: (details) async {
                          // Render node movement
                          _model.updateNodesAtIndex(
                            _model.selectedIndex,
                            (e) => e
                              ..alignmentX = (nodesList
                                          .elementAtOrNull(
                                              _model.selectedIndex)!
                                          .alignmentX +
                                      (details.delta.dx * 2) /
                                          MediaQuery.sizeOf(context).width)
                                  .clamp(-1.0, 1.0)
                              ..alignmentY = (nodesList
                                          .elementAtOrNull(
                                              _model.selectedIndex)!
                                          .alignmentY +
                                      (details.delta.dy * 2) /
                                          MediaQuery.sizeOf(context).height)
                                  .clamp(-1.0, 1.0),
                          );
                          safeSetState(() {});
                        },
                        child: Stack(
                          children:
                              List.generate(nodesList.length, (nodesListIndex) {
                            final nodesListItem = nodesList[nodesListIndex];
                            return Container(
                              width: FFAppState().NodeWidth,
                              height: FFAppState().NodeHeight,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(
                                        valueOrDefault<double>(
                                          nodesListItem.alignmentX,
                                          0.0,
                                        ),
                                        valueOrDefault<double>(
                                          nodesListItem.alignmentY,
                                          0.0,
                                        )),
                                    child: GestureDetector(
                                      onTapDown: (details) async {
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
                                        // Set selected index
                                        _model.selectedIndex = nodesListIndex;
                                        // Reset selections
                                        await actions.resetSelections(
                                          _model.nodes.toList(),
                                        );
                                        // Toggle selected item
                                        _model.updateNodesAtIndex(
                                          nodesListIndex,
                                          (e) => e
                                            ..isSelected =
                                                !nodesListItem.isSelected,
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
                                      onTapUp: (details) async {
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
                                      child: Container(
                                        width: 180.0,
                                        height: 150.0,
                                        decoration: BoxDecoration(),
                                        child: NodeComponentWidget(
                                          key: Key(
                                              'Keyr1c_${nodesListIndex}_of_${nodesList.length}'),
                                          node: nodesListItem,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [],
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      );
                    },
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
