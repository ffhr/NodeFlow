import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edge_component_model.dart';
export 'edge_component_model.dart';

class EdgeComponentWidget extends StatefulWidget {
  const EdgeComponentWidget({
    super.key,
    required this.edge,
    required this.sourceNode,
    required this.targetNode,
    required this.diagram,
  });

  final NodeEdgeStruct? edge;
  final NodeStruct? sourceNode;
  final NodeStruct? targetNode;
  final NFDiagramStruct? diagram;

  @override
  State<EdgeComponentWidget> createState() => _EdgeComponentWidgetState();
}

class _EdgeComponentWidgetState extends State<EdgeComponentWidget> {
  late EdgeComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EdgeComponentModel());

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
      builder: (context) {
        if (functions
                .calculateStartPointFromEdge(
                    widget!.edge!,
                    MediaQuery.sizeOf(context).width,
                    MediaQuery.sizeOf(context).height,
                    FFAppState().Nodes.toList(),
                    FFAppState().NFViewportCenter,
                    FFAppState().NFZoomFactor,
                    widget!.diagram!)
                .positionX <=
            functions
                .calculateEndPointFromEdge(
                    widget!.edge!,
                    MediaQuery.sizeOf(context).width,
                    MediaQuery.sizeOf(context).height,
                    FFAppState().Nodes.toList(),
                    FFAppState().NFViewportCenter,
                    FFAppState().NFZoomFactor,
                    widget!.diagram!)
                .positionX) {
          return Visibility(
            visible: true,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: custom_widgets.CurvedLine(
                width: double.infinity,
                height: double.infinity,
                start: functions.calculateStartPointFromEdge(
                    widget!.edge!,
                    MediaQuery.sizeOf(context).width,
                    MediaQuery.sizeOf(context).height,
                    FFAppState().Nodes.toList(),
                    NFOffsetStruct(
                      offsetX: 0.0,
                      offsetY: 0.0,
                    ),
                    1.0,
                    widget!.diagram!),
                end: functions.calculateEndPointFromEdge(
                    widget!.edge!,
                    MediaQuery.sizeOf(context).width,
                    MediaQuery.sizeOf(context).height,
                    FFAppState().Nodes.toList(),
                    NFOffsetStruct(
                      offsetX: 0.0,
                      offsetY: 0.0,
                    ),
                    1.0,
                    NFDiagramStruct()),
                lineType: NFLineType.solid,
                isArrowPointingToStartPoint: false,
                lineColor: FlutterFlowTheme.of(context).nFDefaultEdgeColor,
                scaleFactor: 1.0,
                onTap: () async {
                  // Remove from list
                  print('Edge line tapped');
                  FFAppState().removeFromEdges(widget!.edge!);
                  FFAppState().update(() {});
                },
              ),
            ),
          );
        } else {
          return Container(
            width: double.infinity,
            height: double.infinity,
            child: custom_widgets.CurvedLoop(
              width: double.infinity,
              height: double.infinity,
              start: functions.calculateStartPointFromEdge(
                  widget!.edge!,
                  MediaQuery.sizeOf(context).width,
                  MediaQuery.sizeOf(context).height,
                  FFAppState().Nodes.toList(),
                  NFOffsetStruct(
                    offsetX: 0.0,
                    offsetY: 0.0,
                  ),
                  1.0,
                  widget!.diagram!),
              end: functions.calculateEndPointFromEdge(
                  widget!.edge!,
                  MediaQuery.sizeOf(context).width,
                  MediaQuery.sizeOf(context).height,
                  FFAppState().Nodes.toList(),
                  NFOffsetStruct(
                    offsetX: 0.0,
                    offsetY: 0.0,
                  ),
                  1.0,
                  widget!.diagram!),
              sourceNodeSize: widget!.sourceNode!.size,
              curvedLoopType: widget!.sourceNode!.virtualPosition.offsetY <
                      widget!.targetNode!.virtualPosition.offsetY
                  ? CurvedLoopType.topToBottom
                  : CurvedLoopType.bottomToTop,
              sourceNodeAbsolutePosition: functions.virtualToAbsolute(
                  widget!.sourceNode!.virtualPosition,
                  NFOffsetStruct(
                    offsetX: 0.0,
                    offsetY: 0.0,
                  ),
                  1.0,
                  NFSizeStruct(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                  )),
              lineType: NFLineType.solid,
              lineColor: FlutterFlowTheme.of(context).nFDefaultEdgeColor,
              onTap: () async {
                // Remove from list
                print('Edge loop tapped');
                FFAppState().removeFromEdges(widget!.edge!);
                FFAppState().update(() {});
              },
            ),
          );
        }
      },
    );
  }
}
