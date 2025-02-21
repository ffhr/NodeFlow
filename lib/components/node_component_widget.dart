import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/n_f_sockets_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
    required this.child,
    this.onSecondaryTapUp,
    required this.diagram,
  });

  final NodeStruct? node;
  final Future Function()? onTapDown;
  final Future Function()? onTapUp;
  final Future Function()? onPanDown;
  final Future Function()? onPanEnd;
  final Future Function(NFPointStruct deltaPoint)? onPanUpdate;
  final Widget Function()? child;
  final Future Function(NFPointStruct deltaPoint)? onSecondaryTapUp;
  final NFDiagramStruct? diagram;

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
          wrapWithModel(
            model: _model.nFSocketsLeftModel,
            updateCallback: () => safeSetState(() {}),
            child: NFSocketsWidget(
              nodeId: widget!.node!.id,
              inputs: widget!.node!.inputs,
              outputs: widget!.node!.outputs,
              diagram: widget!.diagram!,
            ),
          ),
          wrapWithModel(
            model: _model.nFSocketsTopModel,
            updateCallback: () => safeSetState(() {}),
            child: NFSocketsWidget(
              nodeId: widget!.node!.id,
              inputs: widget!.node!.inputs,
              outputs: widget!.node!.outputs,
              diagram: widget!.diagram!,
            ),
          ),
          wrapWithModel(
            model: _model.nFSocketsRightModel,
            updateCallback: () => safeSetState(() {}),
            child: NFSocketsWidget(
              nodeId: widget!.node!.id,
              inputs: widget!.node!.inputs,
              outputs: widget!.node!.outputs,
              diagram: widget!.diagram!,
            ),
          ),
          wrapWithModel(
            model: _model.nFSocketsBottomModel,
            updateCallback: () => safeSetState(() {}),
            child: NFSocketsWidget(
              nodeId: widget!.node!.id,
              inputs: widget!.node!.inputs,
              outputs: widget!.node!.outputs,
              diagram: widget!.diagram!,
            ),
          ),
        ],
      ),
    );
  }
}
