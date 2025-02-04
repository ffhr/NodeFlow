// Automatic FlutterFlow imports

import 'dart:math';

import '../nf_interactive_viewer.dart';
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

import 'package:flutter/gestures.dart';

class NFZoomableStack extends StatefulWidget {
  const NFZoomableStack({
    super.key,
    this.width,
    this.height,
    this.stackComponent,
  });

  final double? width;
  final double? height;
  final Widget Function()? stackComponent;

  @override
  State<NFZoomableStack> createState() => _NFZoomableStackState();
}

const double DEFAULT_SCALE_FACTOR = 1;

class _NFZoomableStackState extends State<NFZoomableStack>
    with WidgetsBindingObserver {
  double initialScale = DEFAULT_SCALE_FACTOR; // Initial scale factor
  double scale = DEFAULT_SCALE_FACTOR;
  final double minScale = 0.03125; // Minimum zoom level
  final double maxScale = 20; // Maximum zoom level

  double viewerCenterX = 0;
  double viewerCenterY = 0;

  double alignmentX = 0;
  double alignmentY = 0;

  double offsetXFromWindowCenter = 0;
  double offsetYFromWindowCenter = 0;

  final GlobalKey interactiveViewerKey = GlobalKey();
  late NFTransformationController _transformationController;

  void _centerAndScale() {
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final Size size = renderBox.size;
      final double screenWidth = size.width;
      final double screenHeight = size.height;

      final double dx = screenWidth / 2 * (1 - initialScale);
      final double dy = screenHeight / 2 * (1 - initialScale);

      _transformationController.value = Matrix4.identity()
        ..translate(dx, dy) // Shift the view so scaling is centered
        ..scale(initialScale);

      viewerCenterX = dx;
      viewerCenterY = dy;

      FFAppState().ViewportCenter = NFOffsetStruct(
        offsetX: viewerCenterX,
        offsetY: viewerCenterY,
      );
    }
  }

  Offset getInteractiveViewerCenter() {
    final RenderBox? renderBox =
        interactiveViewerKey.currentContext?.findRenderObject() as RenderBox?;

    if (renderBox != null) {
      final Offset position =
          renderBox.localToGlobal(Offset.zero); // Absolute position
      final Size size = renderBox.size;

      final double centerX = position.dx + size.width / 2;
      final double centerY = position.dy + size.height / 2;

      return Offset(centerX, centerY);
    }
    return Offset.zero; // Default if not found
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    _updateWindowSize();
  }

  Size? _previousSize;

  void _updateWindowSize() {
    final newSize =
        View.of(context).physicalSize / View.of(context).devicePixelRatio;

    if (_previousSize != null) {
      double dx = newSize.width - _previousSize!.width;
      double dy = newSize.height - _previousSize!.height;

      // print("dx: $dx, dy: $dy");

      if (dx.abs() > 50 || dy.abs() > 50) {
        // Arbitrary threshold for maximize
        // print("Window maximized");

        Future.delayed(Duration(milliseconds: 100), () {
          setState(() {
            alignToCenterOfViewer(context);
          });
        });
      } else {
        // print("Window resized");
        setState(() {
          alignToCenterOfViewer(context);
        });
      }
    }

    _previousSize = newSize;
  }

  @override
  void initState() {
    super.initState();
    // Initialize the TransformationController with the desired scale
    _transformationController = NFTransformationController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _centerAndScale();
    });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _transformationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: CustomPaint(
                size: Size.infinite,
                painter: NFGridPainter(scale,
                    offsetX: offsetXFromWindowCenter,
                    offsetY: offsetYFromWindowCenter),
              ),
            ),
          ),
          // Align(
          //   alignment: AlignmentDirectional(alignmentX, alignmentY),
          //   child: Container(
          //     width: scale * 4,
          //     height: double.infinity,
          //     color: Colors.green,
          //   ),
          // ),
          // Align(
          //   alignment: AlignmentDirectional(alignmentX, alignmentY),
          //   child: Container(
          //     width: double.infinity,
          //     height: scale * 4,
          //     color: Colors.green,
          //   ),
          // ),
          Container(
            child: NFInteractiveViewer(
              transformationController: _transformationController,
              minScale: minScale,
              maxScale: maxScale,
              onInteractionUpdate: (details) {
                setState(() {
                  // print("onInteractionUpdate");
                  // print(_transformationController.value.getMaxScaleOnAxis());
                  scale = _transformationController.value.getMaxScaleOnAxis();
                  alignToCenterOfViewer(context);
                });
              },
              onInteractionEnd: (details) {
                // NOTE: removed HACK with NFInteractiveViewer
                // HACK to make sure the alignment is updated after the interaction ends, becasue
                // it is impossible to disable internal Tween animation after Pan is done
                // for (int delay = 200; delay <= 1000; delay += 100) {
                //   Future.delayed(Duration(milliseconds: delay), () {
                //     setState(() {
                //       alignToCenterOfViewer(context);
                //     });
                //   });
                // }
              },
              boundaryMargin:
                  EdgeInsets.all(double.infinity), // Allows free panning
              constrained: true,
              child: Container(
                decoration: BoxDecoration(
                    // color: Colors.yellow,
                    ),
                constraints: BoxConstraints(
                    // minWidth: 10000,
                    // minHeight: 10000, // Ensures minimum height of 6000

                    ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * maxScale,
                  height: MediaQuery.of(context).size.height * maxScale,
                  // width: 1000,
                  // height: 150,
                  child: Container(
                    // decoration: BoxDecoration(color: Colors.blue),
                    // height: 5000,
                    key: interactiveViewerKey,
                    child: widget.stackComponent!(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void alignToCenterOfViewer(BuildContext context) {
    double w = MediaQuery.of(context).size.width * scale;
    double h = MediaQuery.of(context).size.height * scale;

    double halfW = w / 2;
    double halfH = h / 2;

    // print(w);
    // print(h);

    // print(_transformationController.value.row0[3]);
    // print(_transformationController.value.row1[3]);

    viewerCenterX = _transformationController.value.row0[3] + halfW;
    viewerCenterY = _transformationController.value.row1[3] + halfH;

    FFAppState().ViewportCenter = NFOffsetStruct(
      offsetX: viewerCenterX,
      offsetY: viewerCenterY,
    );

    // print(viewerCenterX);
    // print(viewerCenterY);
    // print('--------------------');

    alignmentX = (viewerCenterX / MediaQuery.of(context).size.width) * 2 - 1;
    alignmentY = (viewerCenterY / MediaQuery.of(context).size.height) * 2 - 1;

    // Calculate the center of the window
    double centerX = MediaQuery.of(context).size.width / 2;
    double centerY = MediaQuery.of(context).size.height / 2;

    // Calculate the absolute offsets from the center
    double offsetX = viewerCenterX - centerX;
    double offsetY = viewerCenterY - centerY;

    // print('Offset from center X: $offsetX');
    // print('Offset from center Y: $offsetY');

    offsetXFromWindowCenter = offsetX;
    offsetYFromWindowCenter = offsetY;
  }
}

class NFGridPainter extends CustomPainter {
  final double zoom;
  final double offsetX;
  final double offsetY;

  NFGridPainter(this.zoom, {this.offsetX = 0.0, this.offsetY = 0.0});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey.withOpacity(0.125)
      ..style = PaintingStyle.stroke;

    double baseSize = 10.0; // Base grid unit
    double maxZoom = 4.0; // 400%
    double minZoom = 0.0001; // 0.01%
    double zoomFactor = max(minZoom, min(zoom, maxZoom));

    int levels = 5;
    double centerX = (size.width / 2) + offsetX;
    double centerY = (size.height / 2) + offsetY;

    for (int i = 0; i < levels; i++) {
      double gridSize = baseSize * pow(5, i) * zoomFactor;
      if (gridSize < 1.0 || (zoomFactor <= 0.1 && i < 2))
        continue; // Avoid rendering too small grids at low zoom

      double startX = (centerX % gridSize) - gridSize;
      double startY = (centerY % gridSize) - gridSize;

      for (double x = startX; x < size.width; x += gridSize) {
        canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
      }
      for (double y = startY; y < size.height; y += gridSize) {
        canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
      }
    }

    // Draw X and Y axes
    final axisPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2.0;

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
