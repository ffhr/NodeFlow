// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

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

    //canvas.drawLine(start, end, paint);

    final path = Path();

    // Define the "S" shape using cubic Bézier curves
    path.moveTo(start.dx, start.dy); // Start point
    path.cubicTo(
      size.width * 0.1, size.height * 0.2, // Control point 1
      size.width * 0.1, size.height * 0.5, // Control point 2
      size.width * 0.2, size.height * 0.5, // End point for the first curve
    );
    path.cubicTo(
      size.width * 0.3, size.height * 0.5, // Control point 1
      size.width * 0.3, size.height * 0.8, // Control point 2
      size.width * 0.2, size.height * 0.8, // End point for the second curve
    );

    // Draw the path on the canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Line extends StatefulWidget {
  const Line({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<Line> createState() => _LineState();
}

class _LineState extends State<Line> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        size: MediaQuery.of(context).size,
        painter: LinePainter(Offset(100, 100), Offset(200, 200)));
  }
}
