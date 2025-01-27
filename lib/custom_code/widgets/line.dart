// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
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

enum LineDirection {
  topLeftToBottomRight,
  topRightToBottomLeft,
  bottomLeftToTopRight,
  bottomRightToTopLeft,
}

class LinePainter extends CustomPainter {
  final Offset start;
  final Offset end;

  LinePainter(this.start, this.end);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // canvas.drawLine(start, end, paint);

    final path = Path();
    final width = end.dx - start.dx;
    final height = end.dy - start.dy;

    print("width: $width, height: $height");

    // Define the "S" shape using cubic Bézier curves
    path.moveTo(start.dx, start.dy); // Start point
    var direction = getLineDirection(start, end);

    // More information:
    // https://flutter.github.io/assets-for-api-docs/assets/dart-ui/path_cubic_to.png#gh-light-mode-only
    switch (direction) {
      case LineDirection.topLeftToBottomRight:
        print("topLeftToBottomRight");
        path.cubicTo(
          start.dx + 0.5 * height.abs(),
          start.dy - 0.15 * height.abs(), // Control point 1
          end.dx - 0.5 * height.abs(),
          end.dy + 0.15 * height.abs(), // Control point 2
          end.dx,
          end.dy, // End point
        );
        break;
      case LineDirection.topRightToBottomLeft:
        print("topRightToBottomLeft");
        path.cubicTo(
          start.dx - 0.5 * height.abs(),
          start.dy - 0.15 * height.abs(), // Control point 1
          end.dx + 0.5 * height.abs(),
          end.dy + 0.15 * height.abs(), // Control point 2
          end.dx, end.dy, // End point
        );
        break;
      case LineDirection.bottomLeftToTopRight:
        print("bottomLeftToTopRight");
        path.cubicTo(
          start.dx + 0.5 * height.abs(),
          start.dy + 0.15 * height.abs(), // Control point 1
          end.dx - 0.5 * height.abs(),
          end.dy - 0.15 * height.abs(), // Control point 2
          end.dx,
          end.dy, // End point
        );
        break;
      case LineDirection.bottomRightToTopLeft:
        print("bottomRightToTopLeft");
        path.cubicTo(
          start.dx - 0.5 * height.abs(),
          start.dy + 0.15 * height.abs(), // Control point 1
          end.dx + 0.5 * height.abs(),
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
  bool shouldRepaint(covariant LinePainter oldDelegate) {
    if (oldDelegate.start == start && oldDelegate.end == end) {
      print("shouldRepaint: false");
      return false;
    }
    print("shouldRepaint: true");
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
}

class Line extends StatefulWidget {
  const Line({
    super.key,
    this.width,
    this.height,
    required this.start,
    required this.end,
  });

  final double? width;
  final double? height;
  final NFPointStruct start;
  final NFPointStruct end;

  @override
  State<Line> createState() => _LineState();
}

class _LineState extends State<Line> {
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
          size: MediaQuery.of(context).size,
          painter: LinePainter(
              Offset(widget.start.positionX, widget.start.positionY),
              Offset(widget.end.positionX, widget.end.positionY))),
    );
  }
}
