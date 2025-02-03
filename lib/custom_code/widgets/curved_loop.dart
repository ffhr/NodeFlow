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

class CurvedLoopPainter extends CustomPainter {
  final Offset start;
  final Offset end;

  CurvedLoopPainter(this.start, this.end);

  @override
  void paint(Canvas canvas, Size size) {
    // // Draw the path on the canvas
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    var path = getPath();
    canvas.drawPath(path, paint);

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(covariant CurvedLoopPainter oldDelegate) {
    if (oldDelegate.start == start && oldDelegate.end == end) {
      return false;
    }
    return true;
  }

  Path getPath() {
    return Path();
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
    this.onTap,
  });

  final double? width;
  final double? height;
  final NFPointStruct start;
  final NFPointStruct end;
  final NFSizeStruct sourceNodeSize;
  final Future Function()? onTap;

  @override
  State<CurvedLoop> createState() => _CurvedLoopState();
}

class _CurvedLoopState extends State<CurvedLoop> {
  CurvedLoopPainter _painter = CurvedLoopPainter(Offset(0, 0), Offset(0, 0));
  @override
  void initState() {
    _painter = CurvedLoopPainter(
        Offset(widget.start.positionX, widget.start.positionY),
        Offset(widget.end.positionX, widget.end.positionY));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CurvedLoop oldWidget) {
    super.didUpdateWidget(oldWidget);
    _painter = CurvedLoopPainter(
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
