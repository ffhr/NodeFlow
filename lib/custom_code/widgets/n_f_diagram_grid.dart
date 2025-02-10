// Automatic FlutterFlow imports
import 'dart:math';

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

class NFDiagramGrid extends StatefulWidget {
  const NFDiagramGrid({
    super.key,
    this.width,
    this.height,
    this.lineColor,
    this.backgroundColor,
    this.axisColor,
  });

  final double? width;
  final double? height;
  final Color? lineColor;
  final Color? backgroundColor;
  final Color? axisColor;

  @override
  State<NFDiagramGrid> createState() => _NFDiagramGridState();
}

class _NFDiagramGridState extends State<NFDiagramGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: widget.backgroundColor,
      child: CustomPaint(
        size: Size.infinite,
        painter: NFGridPainter(
            FFAppState().ZoomFactor, widget.lineColor, widget.axisColor,
            offsetX: 0.0, offsetY: 0.0),
      ),
    );
  }
}

class NFGridPainter extends CustomPainter {
  final double zoom;
  final double offsetX;
  final double offsetY;
  final Color? lineColor;
  final Color? axisColor;

  NFGridPainter(this.zoom, this.lineColor, this.axisColor,
      {this.offsetX = 0.0, this.offsetY = 0.0});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = lineColor ?? Colors.transparent
      ..style = PaintingStyle.stroke;

    double centerX = (size.width / 2) + offsetX;
    double centerY = (size.height / 2) + offsetY;

    for (var multiplyFactor = 1; multiplyFactor < 100; multiplyFactor *= 4) {
      double cellSize = size.width / 20000 * multiplyFactor;
      double startX = (centerX % cellSize) - cellSize;
      double startY = (centerY % cellSize) - cellSize;

      if (zoom < 80 && multiplyFactor < 4) continue;
      if (zoom < 30 && multiplyFactor < 16) continue;
      if (zoom < 10 && multiplyFactor < 64) continue;

      for (double i = startX; i <= size.width; i += cellSize) {
        canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
      }

      for (double j = startY; j <= size.height; j += cellSize) {
        canvas.drawLine(Offset(0, j), Offset(size.width, j), paint);
      }
    }

    // Draw X and Y axes
    final axisPaint = Paint()..color = axisColor ?? Colors.transparent;

    canvas.drawLine(
      Offset(centerX, 0),
      Offset(centerX, size.height),
      axisPaint,
    ); // Y-Axis

    canvas.drawLine(
      Offset(0, centerY),
      Offset(size.width, centerY),
      axisPaint,
    ); // X-Axis
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
