// Automatic FlutterFlow imports
import 'dart:math';

import 'package:flutter_svg/flutter_svg.dart';

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

import 'index.dart'; // Imports other custom widgets

import 'dart:math';

import 'index.dart'; // Imports other custom widgets

class NFDiagramGrid extends StatefulWidget {
  const NFDiagramGrid({
    super.key,
    this.width,
    this.height,
    this.lineColor,
    this.backgroundColor,
    this.axisColor,
    this.gridType,
  });

  final double? width;
  final double? height;
  final Color? lineColor;
  final Color? backgroundColor;
  final Color? axisColor;
  final NFGridType? gridType;

  @override
  State<NFDiagramGrid> createState() => _NFDiagramGridState();
}

class _NFDiagramGridState extends State<NFDiagramGrid> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: widget.backgroundColor,
      child: RepaintBoundary(
        child: CustomPaint(
          size: Size.infinite,
          painter: NFGridPainter(FFAppState().ZoomFactor, widget.lineColor,
              widget.axisColor, widget.gridType,
              offsetX: 0.0, offsetY: 0.0),
        ),
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
  final NFGridType? gridType;

  NFGridPainter(this.zoom, this.lineColor, this.axisColor, this.gridType,
      {this.offsetX = 0.0, this.offsetY = 0.0});

  @override
  void paint(Canvas canvas, Size size) {
    if (gridType == NFGridType.grid) {
      _drawGrid(canvas, size);
    }
    if (gridType == NFGridType.dots) {
      _drawDots(canvas, size);
    }
  }

  void _drawGrid(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = lineColor ?? Colors.transparent
      ..style = PaintingStyle.stroke;

    double centerX = (size.width / 2);
    double centerY = (size.height / 2);

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

  void _drawDots(Canvas canvas, Size size) async {
    double dotSpacing = 0.4; // Distance between dots
    double dotRadius = 0.02; // Radius of each dot
    Paint paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;

    Paint redPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    print("Size width ${size.width}");

    // var zoomFactor = FFAppState().ZoomFactor / FFAppState().DefaultZoomFactor;
    var zoomFactor = FFAppState().ZoomFactor;
    var viewportOffsetX = FFAppState().ViewportCenter.offsetX;
    var viewportOffsetY = FFAppState().ViewportCenter.offsetY;

    var startAbsoluteX =
        (((size.width * zoomFactor) / 2) - size.width / 2 - viewportOffsetX) /
            zoomFactor;
    var endAbsoluteX =
        (((size.width * zoomFactor) / 2) + size.width / 2 - viewportOffsetX) /
            zoomFactor;

    var startAbsoluteY =
        (((size.height * zoomFactor) / 2) - size.height / 2 - viewportOffsetY) /
            zoomFactor;
    var endAbsoluteY =
        (((size.height * zoomFactor) / 2) + size.height / 2 - viewportOffsetY) /
            zoomFactor;

    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var cellSize = dotSpacing + dotRadius;

    double startX = (centerX % cellSize) - cellSize;
    double startY = (centerY % cellSize) - cellSize;
    // startX = 0.0;
    // startY = 0.0;

    print('Start x ${startX}');
    print('Start y ${startY}');

    for (double x = startAbsoluteX + startX;
        x <= endAbsoluteX;
        x += dotSpacing) {
      for (double y = startAbsoluteY + startY;
          y <= endAbsoluteY;
          y += dotSpacing) {
        if (x == startAbsoluteX ||
            x == endAbsoluteX ||
            y == startAbsoluteY ||
            y == endAbsoluteY) {
          canvas.drawCircle(Offset(x, y), dotRadius, redPaint);
        } else {
          canvas.drawCircle(Offset(x, y), dotRadius, paint);
        }
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
