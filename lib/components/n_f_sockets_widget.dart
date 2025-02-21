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
import 'n_f_sockets_model.dart';
export 'n_f_sockets_model.dart';

class NFSocketsWidget extends StatefulWidget {
  const NFSocketsWidget({
    super.key,
    required this.inputs,
    required this.outputs,
    required this.diagram,
    required this.position,
    required this.nodeId,
  });

  final List<NodeInputSocketStruct>? inputs;
  final List<NodeOutputSocketStruct>? outputs;
  final NFDiagramStruct? diagram;
  final NFPosition? position;
  final String? nodeId;

  @override
  State<NFSocketsWidget> createState() => _NFSocketsWidgetState();
}

class _NFSocketsWidgetState extends State<NFSocketsWidget> {
  late NFSocketsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NFSocketsModel());

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

    return Stack(
      children: [
        if (widget!.diagram?.inputSocketsPosition == widget!.position)
          Builder(
            builder: (context) {
              final inputsList = widget!.inputs!.toList();

              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(inputsList.length, (inputsListIndex) {
                  final inputsListItem = inputsList[inputsListIndex];
                  return SocketComponentWidget(
                    key: Key(
                        'Keyjnf_${inputsListIndex}_of_${inputsList.length}'),
                    isClicked:
                        (FFAppState().NFCurrentBuildingEdge.targetNodeId ==
                                widget!.nodeId) &&
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
                        isInput: true,
                        nodeId: widget!.nodeId,
                        socketIndex: inputsListIndex,
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
      ],
    );
  }
}
