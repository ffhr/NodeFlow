// Automatic FlutterFlow imports
import 'package:node_flow/custom_code/widgets/curved_line.dart';
import 'package:node_flow/custom_code/widgets/curved_loop.dart';

import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class NFEdges extends StatefulWidget {
  const NFEdges({
    super.key,
    this.width,
    this.height,
    this.edges,
    this.nodes,
    this.diagram,
    this.onTapEdge,
  });

  final double? width;
  final double? height;
  final List<NodeEdgeStruct>? edges;
  final List<NodeStruct>? nodes;
  final NFDiagramStruct? diagram;
  final Future Function(int? index)? onTapEdge;

  @override
  State<NFEdges> createState() => _NFEdgesState();
}

class _NFEdgesState extends State<NFEdges> {
  late NFEdgesPainter _painter;

  @override
  Widget build(BuildContext context) {
    _painter = NFEdgesPainter(
      context: context,
      edges: widget.edges,
      nodes: widget.nodes,
      diagram: widget.diagram,
    );
    return RepaintBoundary(
      child: CustomPaint(
        size: MediaQuery.of(context).size,
        painter: _painter,
      ),
    );
  }
}

class NFEdgesPainter extends CustomPainter {
  NFEdgesPainter({
    required this.context,
    this.edges,
    this.nodes,
    this.diagram,
  });

  final List<NodeEdgeStruct>? edges;
  final List<NodeStruct>? nodes;
  final NFDiagramStruct? diagram;
  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    var isLightThemeOn = Theme.of(context).brightness == Brightness.light;

    var edgesColor = isLightThemeOn
        ? diagram?.diagramTheme.edgesColor.light
        : diagram?.diagramTheme.edgesColor.dark;

    final paint = Paint()
      ..color = edgesColor ?? Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    for (var edge in edges ?? []) {
      print('Painting edge: ${edge.id}');
      _paintEdge(canvas, size, paint, edge);
    }
  }

  void _paintEdge(Canvas canvas, Size size, Paint paint, NodeEdgeStruct edge) {
    var startPoint = calculateStartPointFromEdge(
      edge,
      size.width,
      size.height,
      nodes!,
      NFOffsetStruct(offsetX: 0.0, offsetY: 0.0),
      1.0,
    );
    var endPoint = calculateEndPointFromEdge(
      edge,
      size.width,
      size.height,
      nodes!,
      NFOffsetStruct(offsetX: 0.0, offsetY: 0.0),
      1.0,
    );
    if (startPoint.positionX <= endPoint.positionX) {
      // Draw a curved line
      _paintCurvedEdge(startPoint, endPoint, canvas, paint);
    } else {
      // Draw a curved loop
      _paintCurvedLoopEdge(startPoint, endPoint, canvas, size, paint, edge);
    }
  }

  void _paintCurvedEdge(NFPointStruct startPoint, NFPointStruct endPoint,
      Canvas canvas, Paint paint) {
    var painter = CurvedLinePainter(
        Offset(startPoint.positionX, startPoint.positionY),
        Offset(endPoint.positionX, endPoint.positionY),
        NFLineType.solid,
        false,
        paint.color,
        1.0);
    var path = painter.getPath();
    canvas.drawPath(path, paint);
    painter.drawArrowHead(canvas, path);
  }

  void _paintCurvedLoopEdge(NFPointStruct startPoint, NFPointStruct endPoint,
      Canvas canvas, Size size, Paint paint, NodeEdgeStruct edge) {
    if (nodes == null) return;
    var sourceNode = getNodeFromId(edge.sourceNodeId, nodes!);
    var targetNode = getNodeFromId(edge.targetNodeId, nodes!);
    var loopType = _getCurvedLoopType(sourceNode, targetNode);
    var sourceNodeAbsPos = _getSourceNodeAbsolutePosition(
        sourceNode.virtualPosition, sourceNode.size);

    var painter = CurvedLoopPainter(
        Offset(startPoint.positionX, startPoint.positionY),
        Offset(endPoint.positionX, endPoint.positionY),
        sourceNode.size,
        loopType,
        sourceNodeAbsPos,
        NFLineType.solid,
        paint.color);
    var path = painter.getPath();
    canvas.drawPath(path, paint);
    painter.drawArrowHead(canvas, path);
  }

  CurvedLoopType _getCurvedLoopType(
      NodeStruct sourceNode, NodeStruct targetNode) {
    return sourceNode.virtualPosition.offsetY <
            targetNode.virtualPosition.offsetY
        ? CurvedLoopType.topToBottom
        : CurvedLoopType.bottomToTop;
  }

  NFOffsetStruct _getSourceNodeAbsolutePosition(
      NFOffsetStruct virtualPosition, NFSizeStruct size) {
    return virtualToAbsolute(
        virtualPosition, NFOffsetStruct(offsetX: 0, offsetY: 0), 1.0, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
