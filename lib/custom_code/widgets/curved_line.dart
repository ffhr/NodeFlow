// Automatic FlutterFlow imports
import 'dart:ui';

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

import 'dart:math';

enum LineDirection {
  leftToRight,
  rightToLeft,
}

class CurvedLinePainter extends CustomPainter {
  final Offset start;
  final Offset end;

  CurvedLinePainter(this.start, this.end);

  @override
  void paint(Canvas canvas, Size size) {
    // // Draw the path on the canvas
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    var path = getPath();
    canvas.drawPath(path, paint);
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
  });

  final double? width;
  final double? height;
  final NFPointStruct start;
  final NFPointStruct end;
  final Future Function()? onTap;

  @override
  State<CurvedLine> createState() => _CurvedLineState();
}

class _CurvedLineState extends State<CurvedLine> {
  CurvedLinePainter _painter = CurvedLinePainter(Offset(0, 0), Offset(0, 0));

  @override
  void initState() {
    _painter = CurvedLinePainter(
        Offset(widget.start.positionX, widget.start.positionY),
        Offset(widget.end.positionX, widget.end.positionY));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CurvedLine oldWidget) {
    super.didUpdateWidget(oldWidget);
    _painter = CurvedLinePainter(
        Offset(widget.start.positionX, widget.start.positionY),
        Offset(widget.end.positionX, widget.end.positionY));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapUp: (details) {
          final RenderBox renderBox = context.findRenderObject() as RenderBox;
          final Offset localPosition =
              renderBox.globalToLocal(details.globalPosition);
          if (_painter.hitTestCurvedLine(localPosition)) {
            //print('Tapped on rendered part!');
            widget.onTap?.call();
          } else {
            //print('Tapped outside rendered part.');
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
