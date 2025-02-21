import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/socket_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
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
    required this.nodeId,
  });

  final List<NodeInputSocketStruct>? inputs;
  final List<NodeOutputSocketStruct>? outputs;
  final NFDiagramStruct? diagram;
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
        if (widget!.diagram?.inputSocketsPosition == NFPosition.left)
          Builder(
            builder: (context) {
              final inputsList1 = widget!.inputs!.toList();

              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(inputsList1.length, (inputsList1Index) {
                  final inputsList1Item = inputsList1[inputsList1Index];
                  return SocketComponentWidget(
                    key: Key(
                        'Keyjnf_${inputsList1Index}_of_${inputsList1.length}'),
                    isClicked:
                        (FFAppState().NFCurrentBuildingEdge.targetNodeId ==
                                widget!.nodeId) &&
                            (FFAppState()
                                    .NFCurrentBuildingEdge
                                    .targetInputSocketIndex ==
                                inputsList1Index),
                    defaultColor: _model.inputsDefaultColor,
                    selectedColor: _model.inputsSelectedColor,
                    onClicked: (isClicked) async {
                      // On clicked a block
                      await _model.onClickedActionBlock(
                        context,
                        isClicked: isClicked,
                        isInput: true,
                        nodeId: widget!.nodeId,
                        socketIndex: inputsList1Index,
                      );
                    },
                    onPanDown: (point) async {},
                    onPanEnd: (point) async {
                      // On pan end action block
                      await _model.onPanEndActionBlock(
                        context,
                        point: point,
                        isInput: true,
                      );
                    },
                  );
                }).divide(SizedBox(height: 10.0)),
              );
            },
          ),
        if (widget!.diagram?.outputSocketsPosition == NFPosition.left)
          Builder(
            builder: (context) {
              final outputsList1 = widget!.outputs!.toList();

              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    List.generate(outputsList1.length, (outputsList1Index) {
                  final outputsList1Item = outputsList1[outputsList1Index];
                  return SocketComponentWidget(
                    key: Key(
                        'Keyo53_${outputsList1Index}_of_${outputsList1.length}'),
                    isClicked:
                        (FFAppState().NFCurrentBuildingEdge.sourceNodeId ==
                                widget!.nodeId) &&
                            (FFAppState()
                                    .NFCurrentBuildingEdge
                                    .sourceOutputSocketIndex ==
                                outputsList1Index),
                    defaultColor: _model.outputsDefaultColor,
                    selectedColor: _model.outputsSelectedColor,
                    onClicked: (isClicked) async {
                      // On clicked a block
                      await _model.onClickedActionBlock(
                        context,
                        isClicked: isClicked,
                        isInput: false,
                        nodeId: widget!.nodeId,
                        socketIndex: outputsList1Index,
                      );
                    },
                    onPanDown: (point) async {},
                    onPanEnd: (point) async {
                      // On pan end action block
                      await _model.onPanEndActionBlock(
                        context,
                        point: point,
                        isInput: false,
                      );
                    },
                  );
                }).divide(SizedBox(height: 10.0)),
              );
            },
          ),
        if (widget!.diagram?.inputSocketsPosition == NFPosition.top)
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Builder(
              builder: (context) {
                final inputsList2 = widget!.inputs!.toList();

                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      List.generate(inputsList2.length, (inputsList2Index) {
                    final inputsList2Item = inputsList2[inputsList2Index];
                    return SocketComponentWidget(
                      key: Key(
                          'Key19s_${inputsList2Index}_of_${inputsList2.length}'),
                      isClicked:
                          (FFAppState().NFCurrentBuildingEdge.targetNodeId ==
                                  widget!.nodeId) &&
                              (FFAppState()
                                      .NFCurrentBuildingEdge
                                      .targetInputSocketIndex ==
                                  inputsList2Index),
                      defaultColor: _model.inputsDefaultColor,
                      selectedColor: _model.inputsSelectedColor,
                      onClicked: (isClicked) async {
                        // On clicked a block
                        await _model.onClickedActionBlock(
                          context,
                          isClicked: isClicked,
                          isInput: true,
                          nodeId: widget!.nodeId,
                          socketIndex: inputsList2Index,
                        );
                      },
                      onPanDown: (point) async {},
                      onPanEnd: (point) async {
                        // On pan end action block
                        await _model.onPanEndActionBlock(
                          context,
                          point: point,
                          isInput: true,
                        );
                      },
                    );
                  }).divide(SizedBox(width: 10.0)),
                );
              },
            ),
          ),
        if (widget!.diagram?.outputSocketsPosition == NFPosition.top)
          Builder(
            builder: (context) {
              final outputList2 = widget!.outputs!.toList();

              return Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(outputList2.length, (outputList2Index) {
                  final outputList2Item = outputList2[outputList2Index];
                  return SocketComponentWidget(
                    key: Key(
                        'Keyce2_${outputList2Index}_of_${outputList2.length}'),
                    isClicked:
                        (FFAppState().NFCurrentBuildingEdge.sourceNodeId ==
                                widget!.nodeId) &&
                            (FFAppState()
                                    .NFCurrentBuildingEdge
                                    .sourceOutputSocketIndex ==
                                outputList2Index),
                    defaultColor: _model.outputsDefaultColor,
                    selectedColor: _model.outputsSelectedColor,
                    onClicked: (isClicked) async {
                      // On clicked a block
                      await _model.onClickedActionBlock(
                        context,
                        isClicked: isClicked,
                        isInput: false,
                        nodeId: widget!.nodeId,
                        socketIndex: outputList2Index,
                      );
                    },
                    onPanDown: (point) async {},
                    onPanEnd: (point) async {
                      // On pan end action block
                      await _model.onPanEndActionBlock(
                        context,
                        point: point,
                        isInput: false,
                      );
                    },
                  );
                }).divide(SizedBox(width: 10.0)),
              );
            },
          ),
        if (widget!.diagram?.inputSocketsPosition == NFPosition.right)
          Align(
            alignment: AlignmentDirectional(1.0, 0.0),
            child: Builder(
              builder: (context) {
                final inputsList3 = widget!.inputs!.toList();

                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      List.generate(inputsList3.length, (inputsList3Index) {
                    final inputsList3Item = inputsList3[inputsList3Index];
                    return SocketComponentWidget(
                      key: Key(
                          'Keyywm_${inputsList3Index}_of_${inputsList3.length}'),
                      isClicked:
                          (FFAppState().NFCurrentBuildingEdge.targetNodeId ==
                                  widget!.nodeId) &&
                              (FFAppState()
                                      .NFCurrentBuildingEdge
                                      .targetInputSocketIndex ==
                                  inputsList3Index),
                      defaultColor: _model.inputsDefaultColor,
                      selectedColor: _model.inputsSelectedColor,
                      onClicked: (isClicked) async {
                        // On clicked a block
                        await _model.onClickedActionBlock(
                          context,
                          isClicked: isClicked,
                          isInput: true,
                          nodeId: widget!.nodeId,
                          socketIndex: inputsList3Index,
                        );
                      },
                      onPanDown: (point) async {},
                      onPanEnd: (point) async {
                        // On pan end action block
                        await _model.onPanEndActionBlock(
                          context,
                          point: point,
                          isInput: true,
                        );
                      },
                    );
                  }).divide(SizedBox(height: 10.0)),
                );
              },
            ),
          ),
        if (widget!.diagram?.outputSocketsPosition == NFPosition.right)
          Align(
            alignment: AlignmentDirectional(1.0, 0.0),
            child: Builder(
              builder: (context) {
                final outputsList3 = widget!.outputs!.toList();

                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      List.generate(outputsList3.length, (outputsList3Index) {
                    final outputsList3Item = outputsList3[outputsList3Index];
                    return SocketComponentWidget(
                      key: Key(
                          'Keyvo3_${outputsList3Index}_of_${outputsList3.length}'),
                      isClicked:
                          (FFAppState().NFCurrentBuildingEdge.sourceNodeId ==
                                  widget!.nodeId) &&
                              (FFAppState()
                                      .NFCurrentBuildingEdge
                                      .sourceOutputSocketIndex ==
                                  outputsList3Index),
                      defaultColor: _model.outputsDefaultColor,
                      selectedColor: _model.outputsSelectedColor,
                      onClicked: (isClicked) async {
                        // On clicked a block
                        await _model.onClickedActionBlock(
                          context,
                          isClicked: isClicked,
                          isInput: false,
                          nodeId: widget!.nodeId,
                          socketIndex: outputsList3Index,
                        );
                      },
                      onPanDown: (point) async {},
                      onPanEnd: (point) async {
                        // On pan end action block
                        await _model.onPanEndActionBlock(
                          context,
                          point: point,
                          isInput: false,
                        );
                      },
                    );
                  }).divide(SizedBox(height: 10.0)),
                );
              },
            ),
          ),
        if (widget!.diagram?.inputSocketsPosition == NFPosition.bottom)
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Builder(
              builder: (context) {
                final inputsList4 = widget!.inputs!.toList();

                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      List.generate(inputsList4.length, (inputsList4Index) {
                    final inputsList4Item = inputsList4[inputsList4Index];
                    return SocketComponentWidget(
                      key: Key(
                          'Keycm5_${inputsList4Index}_of_${inputsList4.length}'),
                      isClicked:
                          (FFAppState().NFCurrentBuildingEdge.targetNodeId ==
                                  widget!.nodeId) &&
                              (FFAppState()
                                      .NFCurrentBuildingEdge
                                      .targetInputSocketIndex ==
                                  inputsList4Index),
                      defaultColor: _model.inputsDefaultColor,
                      selectedColor: _model.inputsSelectedColor,
                      onClicked: (isClicked) async {
                        // On clicked a block
                        await _model.onClickedActionBlock(
                          context,
                          isClicked: isClicked,
                          isInput: true,
                          nodeId: widget!.nodeId,
                          socketIndex: inputsList4Index,
                        );
                      },
                      onPanDown: (point) async {},
                      onPanEnd: (point) async {
                        // On pan end action block
                        await _model.onPanEndActionBlock(
                          context,
                          point: point,
                          isInput: true,
                        );
                      },
                    );
                  }).divide(SizedBox(width: 10.0)),
                );
              },
            ),
          ),
        if (widget!.diagram?.outputSocketsPosition == NFPosition.bottom)
          Builder(
            builder: (context) {
              final outputsList4 = widget!.outputs!.toList();

              return Row(
                mainAxisSize: MainAxisSize.max,
                children:
                    List.generate(outputsList4.length, (outputsList4Index) {
                  final outputsList4Item = outputsList4[outputsList4Index];
                  return SocketComponentWidget(
                    key: Key(
                        'Keybdf_${outputsList4Index}_of_${outputsList4.length}'),
                    isClicked:
                        (FFAppState().NFCurrentBuildingEdge.sourceNodeId ==
                                widget!.nodeId) &&
                            (FFAppState()
                                    .NFCurrentBuildingEdge
                                    .sourceOutputSocketIndex ==
                                outputsList4Index),
                    defaultColor: _model.outputsDefaultColor,
                    selectedColor: _model.outputsSelectedColor,
                    onClicked: (isClicked) async {
                      // On clicked a block
                      await _model.onClickedActionBlock(
                        context,
                        isClicked: isClicked,
                        isInput: false,
                        nodeId: widget!.nodeId,
                        socketIndex: outputsList4Index,
                      );
                    },
                    onPanDown: (point) async {},
                    onPanEnd: (point) async {
                      // On pan end action block
                      await _model.onPanEndActionBlock(
                        context,
                        point: point,
                        isInput: false,
                      );
                    },
                  );
                }),
              );
            },
          ),
      ],
    );
  }
}
