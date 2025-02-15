// Automatic FlutterFlow imports
import 'package:flutter/foundation.dart';

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

import 'index.dart'; // Imports other custom widgets

import 'dart:math';
import 'dart:ui';

import 'index.dart'; // Imports other custom widgets

// Imports other custom widgets

class CurvedLoopPainter extends CustomPainter {
  final Offset start;
  final Offset end;
  final NFSizeStruct sourceNodeSize;
  final CurvedLoopType curvedLoopType;
  final NFOffsetStruct sourceNodeAbsolutePosition;
  final NFLineType lineType;
  final Color lineColor;

  CurvedLoopPainter(
      this.start,
      this.end,
      this.sourceNodeSize,
      this.curvedLoopType,
      this.sourceNodeAbsolutePosition,
      this.lineType,
      this.lineColor);

  @override
  void paint(Canvas canvas, Size size) {
    // // Draw the path on the canvas
    var path = getPath();
    if (lineType == NFLineType.solid) {
      final paint = Paint()
        ..color = lineColor
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke;

      canvas.drawPath(path, paint);
    }
    if (lineType == NFLineType.dotted) {
      final paint = Paint()
        ..color = lineColor
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

      // Create dotted effect
      final PathMetrics pathMetrics = path.computeMetrics();
      for (PathMetric metric in pathMetrics) {
        for (double i = 0; i < metric.length; i += 10) {
          canvas.drawPath(
              metric.extractPath(i, i + 5), paint); // 5px dot, 5px gap
        }
      }
    }

    // Only for debugging purposes
    // final topRightNodeCorner = Offset(
    //     sourceNodeAbsolutePosition.offsetX + sourceNodeSize.width / 2,
    //     sourceNodeAbsolutePosition.offsetY - sourceNodeSize.height / 2);
    // final topLeftNodeCorner = Offset(
    //     sourceNodeAbsolutePosition.offsetX - sourceNodeSize.width / 2,
    //     sourceNodeAbsolutePosition.offsetY - sourceNodeSize.height / 2);
    // final bottomLeftNodeCorner = Offset(
    //     sourceNodeAbsolutePosition.offsetX - sourceNodeSize.width / 2,
    //     sourceNodeAbsolutePosition.offsetY + sourceNodeSize.height / 2);
    // final bottomRightNodeCorner = Offset(
    //     sourceNodeAbsolutePosition.offsetX + sourceNodeSize.width / 2,
    //     sourceNodeAbsolutePosition.offsetY + sourceNodeSize.height / 2);

    // final paint = Paint()
    //   ..color = lineColor
    //   ..strokeWidth = 2
    //   ..style = PaintingStyle.stroke;

    // canvas.drawCircle(topRightNodeCorner, 5, paint);
    // canvas.drawCircle(topLeftNodeCorner, 5, paint);
    // canvas.drawCircle(bottomLeftNodeCorner, 5, paint);
    // canvas.drawCircle(bottomRightNodeCorner, 5, paint);

    // Draw the arrowhead 30 pixels before the end of the path
    drawArrowHead(canvas, path);
  }

  @override
  bool shouldRepaint(covariant CurvedLoopPainter oldDelegate) {
    // This will trigger changing theme.
    return true;
    // if (oldDelegate.start == start && oldDelegate.end == end) {
    //   return false;
    // }
    // return true;
  }

  Path getPath() {
    if (curvedLoopType == CurvedLoopType.topToBottom) {
      return getTopToBottomPath();
    } else if (curvedLoopType == CurvedLoopType.bottomToTop) {
      return getBottomToTopPath();
    }
    return Path();
  }

  Path getTopToBottomPath() {
    final path = Path();
    path.moveTo(start.dx, start.dy);
    // Control points for self-loop
    final controlPoint1 = Offset(
      start.dx + sourceNodeSize.width,
      start.dy - sourceNodeSize.height - 200,
    );
    final controlPoint2 = Offset(
      start.dx - 4 * sourceNodeSize.width,
      start.dy - sourceNodeSize.height - 200,
    );
    path.cubicTo(
      controlPoint1.dx,
      controlPoint1.dy,
      controlPoint2.dx,
      controlPoint2.dy,
      end.dx,
      end.dy,
    );
    return path;
  }

  Path getBottomToTopPath() {
    final path = Path();
    path.moveTo(start.dx, start.dy);
    // Control points for self-loop
    final controlPoint1 = Offset(
      start.dx + sourceNodeSize.width,
      start.dy + sourceNodeSize.height + 200,
    );
    final controlPoint2 = Offset(
      start.dx - (end.dx - start.dx).abs() * 1.8,
      start.dy + sourceNodeSize.height + 200,
    );
    path.cubicTo(
      controlPoint1.dx,
      controlPoint1.dy,
      controlPoint2.dx,
      controlPoint2.dy,
      end.dx,
      end.dy,
    );
    return path;
  }

  void drawArrowHead(Canvas canvas, Path path) {
    // Compute the metrics for the path.
    final metrics = path.computeMetrics().toList();
    if (metrics.isEmpty) return;
    final metric = metrics.first;
    if (metric.length < 30) return; // Too short for our arrow.

    // Instead of positioning the arrow based on its tip,
    // we choose a point along the path (30 pixels before the end)
    // that will serve as the arrow's center.
    final centerOffset = metric.length - 30.0;
    final centerTangent = metric.getTangentForOffset(centerOffset);
    if (centerTangent == null) return;
    final arrowCenter = centerTangent.position;
    final angle = 2 * pi - centerTangent.angle;

    // Define arrow dimensions.
    const double arrowLength = 15.0; // full length from tip to base.
    const double arrowHalfWidth = 6.0; // half of the base width.

    // Calculate the tip and base center relative to the arrow's center.
    // Here we assume the arrow should be centered on the path:
    // • The arrow tip is half the arrow length in front of the center.
    // • The arrow base center is half the arrow length behind the center.
    final tip = arrowCenter +
        Offset((arrowLength / 2) * cos(angle), (arrowLength / 2) * sin(angle));

    final baseCenter = arrowCenter -
        Offset((arrowLength / 2) * cos(angle), (arrowLength / 2) * sin(angle));

    // Compute a perpendicular vector to the path's direction.
    final perpendicular = Offset(-sin(angle), cos(angle));

    // Compute the left and right corners of the base.
    final leftBase = baseCenter + perpendicular * arrowHalfWidth;
    final rightBase = baseCenter - perpendicular * arrowHalfWidth;

    // Create the arrow triangle.
    final arrowPath = Path()
      ..moveTo(tip.dx, tip.dy)
      ..lineTo(leftBase.dx, leftBase.dy)
      ..lineTo(rightBase.dx, rightBase.dy)
      ..close();

    // Draw the arrow.
    final arrowPaint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.fill;
    canvas.drawPath(arrowPath, arrowPaint);
  }

  bool hitTestCurvedLine(Offset point) {
    var path = getPath();
    PathMetrics pathMetrics = path.computeMetrics();
    for (PathMetric pathMetric in pathMetrics) {
      for (double distance = 0.0;
          distance < pathMetric.length;
          distance += 1.0) {
        Tangent? tangent = pathMetric.getTangentForOffset(distance);

        if (tangent != null) {
          Rect rect = Rect.fromCircle(center: tangent.position, radius: 10.0);
          if (rect.contains(point)) {
            return true;
          }
        }
      }
    }
    return false;
  }
}

class CurvedLoop extends StatefulWidget {
  const CurvedLoop({
    super.key,
    this.width,
    this.height,
    required this.start,
    required this.end,
    required this.sourceNodeSize,
    required this.curvedLoopType,
    required this.sourceNodeAbsolutePosition,
    required this.onTap,
    required this.lineType,
    required this.lineColor,
  });

  final double? width;
  final double? height;
  final NFPointStruct start;
  final NFPointStruct end;
  final NFSizeStruct sourceNodeSize;
  final CurvedLoopType curvedLoopType;
  final NFOffsetStruct sourceNodeAbsolutePosition;
  final Future Function() onTap;
  final NFLineType lineType;
  final Color lineColor;

  @override
  State<CurvedLoop> createState() => _CurvedLoopState();
}

class _CurvedLoopState extends State<CurvedLoop> {
  CurvedLoopPainter _painter = CurvedLoopPainter(
      const Offset(0, 0),
      const Offset(0, 0),
      NFSizeStruct(width: 0, height: 0),
      CurvedLoopType.topToBottom,
      NFOffsetStruct(offsetX: 0, offsetY: 0),
      NFLineType.solid,
      Colors.black);

  @override
  void initState() {
    _painter = CurvedLoopPainter(
        Offset(widget.start.positionX, widget.start.positionY),
        Offset(widget.end.positionX, widget.end.positionY),
        widget.sourceNodeSize,
        widget.curvedLoopType,
        widget.sourceNodeAbsolutePosition,
        widget.lineType,
        widget.lineColor);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CurvedLoop oldWidget) {
    super.didUpdateWidget(oldWidget);
    _painter = CurvedLoopPainter(
        Offset(widget.start.positionX, widget.start.positionY),
        Offset(widget.end.positionX, widget.end.positionY),
        widget.sourceNodeSize,
        widget.curvedLoopType,
        widget.sourceNodeAbsolutePosition,
        widget.lineType,
        widget.lineColor);
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        size: MediaQuery.of(context).size,
        painter: _painter,
      ),
    );
  }
}
