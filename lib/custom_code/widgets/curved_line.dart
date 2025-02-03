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

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'dart:math';

enum LineDirection {
  topLeftToBottomRight,
  topRightToBottomLeft,
  bottomLeftToTopRight,
  bottomRightToTopLeft,
}

class CurvedLinePainter extends CustomPainter {
  final Offset start;
  final Offset end;

  CurvedLinePainter(this.start, this.end);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // canvas.drawLine(start, end, paint);

    final path = Path();
    //final width = end.dx - start.dx;
    final height = end.dy - start.dy;

    //print("width: $width, height: $height");

    // Define the "S" shape using cubic Bézier curves
    path.moveTo(start.dx, start.dy); // Start point
    var direction = getLineDirection(start, end);

    // More information:
    // https://flutter.github.io/assets-for-api-docs/assets/dart-ui/path_cubic_to.png#gh-light-mode-only
    switch (direction) {
      case LineDirection.topLeftToBottomRight:
        //print("topLeftToBottomRight");
        path.cubicTo(
          start.dx + 0.15 * height.abs(),
          start.dy - 0.15 * height.abs(), // Control point 1
          end.dx - 0.15 * height.abs(),
          end.dy + 0.15 * height.abs(), // Control point 2
          end.dx,
          end.dy, // End point
        );
        break;
      case LineDirection.topRightToBottomLeft:
        //print("topRightToBottomLeft");
        path.cubicTo(
          start.dx - 0.15 * height.abs(),
          start.dy - 0.15 * height.abs(), // Control point 1
          end.dx + 0.15 * height.abs(),
          end.dy + 0.15 * height.abs(), // Control point 2
          end.dx, end.dy, // End point
        );
        break;
      case LineDirection.bottomLeftToTopRight:
        //print("bottomLeftToTopRight");
        path.cubicTo(
          start.dx + 0.15 * height.abs(),
          start.dy + 0.15 * height.abs(), // Control point 1
          end.dx - 0.15 * height.abs(),
          end.dy - 0.15 * height.abs(), // Control point 2
          end.dx,
          end.dy, // End point
        );
        break;
      case LineDirection.bottomRightToTopLeft:
        //print("bottomRightToTopLeft");
        path.cubicTo(
          start.dx - 0.15 * height.abs(),
          start.dy + 0.15 * height.abs(), // Control point 1
          end.dx + 0.15 * height.abs(),
          end.dy - 0.15 * height.abs(), // Control point 2
          end.dx,
          end.dy, // End point
        );
        break;
    }

    // // Draw the path on the canvas
    canvas.drawPath(path, paint);
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
    final width = end.dx - start.dx;
    final height = end.dy - start.dy;

    if (width > 0 && height > 0) {
      return LineDirection.topLeftToBottomRight;
    }
    if (width > 0 && height < 0) {
      return LineDirection.bottomLeftToTopRight;
    }
    if (width < 0 && height > 0) {
      return LineDirection.topRightToBottomLeft;
    }
    if (width < 0 && height < 0) {
      return LineDirection.bottomRightToTopLeft;
    }
    return LineDirection.topLeftToBottomRight;
  }

  // Hit test method for lines
  bool hitTest(Offset position) {
    final double tolerance = 10.0; // Define a tolerance distance

    // Calculate the distance from the tap position to the line
    final double distance = _distanceToLine(position, start, end);

    return distance <= tolerance;
  }

  // Helper function to calculate the distance from a point to a line segment
  double _distanceToLine(Offset point, Offset start, Offset end) {
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
    // TODO: implement initState
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
          if (_painter.hitTest(localPosition)) {
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
