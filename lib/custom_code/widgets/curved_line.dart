// Automatic FlutterFlow imports
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

import 'dart:ui';
import 'dart:math';
import 'index.dart'; // Imports other custom widgets

enum LineDirection {
  leftToRight,
  rightToLeft,
}

class CurvedLinePainter extends CustomPainter {
  final Offset start;
  final Offset end;
  final NFLineType lineType;
  final bool isArrowPointingToStartPoint;

  CurvedLinePainter(
      this.start, this.end, this.lineType, this.isArrowPointingToStartPoint);

  @override
  void paint(Canvas canvas, Size size) {
    var path = getPath();
    if (lineType == NFLineType.solid) {
      // Draw the path on the canvas
      final paint = Paint()
        ..color = Colors.white
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke;

      canvas.drawPath(path, paint);
    }
    if (lineType == NFLineType.dotted) {
      final paint = Paint()
        ..color = Colors.white
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
    drawArrowHead(canvas, path);
  }

  Path getPath() {
    final path = Path();
    final width = end.dx - start.dx;
    final height = end.dy - start.dy;
    final distanceX = width.abs();
    final distanceY = height.abs();

    path.moveTo(start.dx, start.dy); // Start point
    var direction = getLineDirection(start, end);

    // Dynamically calculate xFactor based on distanceY
    double xFactor = 1.25 - 0.0025 * (distanceY - 100);
    xFactor = xFactor.clamp(0.25, 1.25); // Ensure it stays within bounds

    double yFactor = 0; // nice WHEN

    // More information:
    // https://flutter.github.io/assets-for-api-docs/assets/dart-ui/path_cubic_to.png#gh-light-mode-only
    if (direction == LineDirection.leftToRight) {
      path.cubicTo(
        start.dx + xFactor * height.abs(),
        start.dy + yFactor * width.abs(), // Control point 1
        end.dx - xFactor * height.abs(),
        end.dy - yFactor * width.abs(), // Control point 2
        end.dx,
        end.dy, // End point
      );
    } else if (direction == LineDirection.rightToLeft) {
      path.cubicTo(
        start.dx - xFactor * height.abs(),
        start.dy + yFactor * width.abs(), // Control point 1
        end.dx + xFactor * height.abs(),
        end.dy - yFactor * width.abs(), // Control point 2
        end.dx,
        end.dy, // End point
      );
    }

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

    final centerOffset =
        isArrowPointingToStartPoint ? 40.0 : metric.length - 30.0;
    final centerTangent = metric.getTangentForOffset(centerOffset);
    if (centerTangent == null) return;
    final arrowCenter = centerTangent.position;
    final angle =
        (isArrowPointingToStartPoint ? 1 : 2) * pi - centerTangent.angle;

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
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawPath(arrowPath, arrowPaint);
  }

  @override
  bool shouldRepaint(covariant CurvedLinePainter oldDelegate) {
    if (oldDelegate.start == start && oldDelegate.end == end) {
      //print("shouldRepaint: false");
      return false;
    }
    //print("shouldRepaint: true");
    return true;
  }

  LineDirection getLineDirection(Offset start, Offset end) {
    if (start.dx < end.dx) {
      return LineDirection.leftToRight;
    } else {
      return LineDirection.rightToLeft;
    }
  }

  // LineDirection getLineDirection(Offset start, Offset end) {
  //   final width = end.dx - start.dx;
  //   final height = end.dy - start.dy;

  //   if (width > 0 && height > 0) {
  //     return LineDirection.topLeftToBottomRight;
  //   }
  //   if (width > 0 && height < 0) {
  //     return LineDirection.bottomLeftToTopRight;
  //   }
  //   if (width < 0 && height > 0) {
  //     return LineDirection.topRightToBottomLeft;
  //   }
  //   if (width < 0 && height < 0) {
  //     return LineDirection.bottomRightToTopLeft;
  //   }
  //   return LineDirection.topLeftToBottomRight;
  // }

  // Hit test method for lines
  bool hitTestStraightLine(Offset point) {
    const double tolerance = 10.0; // Define a tolerance distance

    // Calculate the distance from the tap position to the line
    final double distance = _distanceToStraightLine(point, start, end);

    return distance <= tolerance;
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

  // Helper function to calculate the distance from a point to a line segment
  double _distanceToStraightLine(Offset point, Offset start, Offset end) {
    final double dx = end.dx - start.dx;
    final double dy = end.dy - start.dy;
    final double lengthSquared = dx * dx + dy * dy;
    double t = ((point.dx - start.dx) * dx + (point.dy - start.dy) * dy) /
        lengthSquared;

    t = t.clamp(0, 1);
    final double nearestX = start.dx + t * dx;
    final double nearestY = start.dy + t * dy;
    final double distance = (point.dx - nearestX) * (point.dx - nearestX) +
        (point.dy - nearestY) * (point.dy - nearestY);

    return sqrt(distance);
  }
}

class CurvedLine extends StatefulWidget {
  const CurvedLine({
    super.key,
    this.width,
    this.height,
    required this.start,
    required this.end,
    this.onTap,
    required this.lineType,
    required this.isArrowPointingToStartPoint,
  });

  final double? width;
  final double? height;
  final NFPointStruct start;
  final NFPointStruct end;
  final Future Function()? onTap;
  final NFLineType lineType;
  final bool isArrowPointingToStartPoint;

  @override
  State<CurvedLine> createState() => _CurvedLineState();
}

class _CurvedLineState extends State<CurvedLine> {
  CurvedLinePainter _painter =
      CurvedLinePainter(Offset(0, 0), Offset(0, 0), NFLineType.solid, false);

  @override
  void initState() {
    _painter = CurvedLinePainter(
        Offset(widget.start.positionX, widget.start.positionY),
        Offset(widget.end.positionX, widget.end.positionY),
        widget.lineType,
        widget.isArrowPointingToStartPoint);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CurvedLine oldWidget) {
    super.didUpdateWidget(oldWidget);
    _painter = CurvedLinePainter(
        Offset(widget.start.positionX, widget.start.positionY),
        Offset(widget.end.positionX, widget.end.positionY),
        widget.lineType,
        widget.isArrowPointingToStartPoint);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapUp: (details) {
          final RenderBox renderBox = context.findRenderObject() as RenderBox;
          final Offset localPosition =
              renderBox.globalToLocal(details.globalPosition);
          if (_painter.hitTestCurvedLine(localPosition)) {
            print('Tapped on rendered part!');
            widget.onTap?.call();
          } else {
            print('Tapped outside rendered part.');
          }
        },
        child: RepaintBoundary(
          child: CustomPaint(
            size: MediaQuery.of(context).size,
            painter: _painter,
          ),
        ));
  }
}
