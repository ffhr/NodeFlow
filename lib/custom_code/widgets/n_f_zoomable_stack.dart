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

import 'dart:math';
import '../nf_interactive_viewer.dart';
import 'index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
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

const double DEFAULT_SCALE_FACTOR = 100;

class _NFZoomableStackState extends State<NFZoomableStack>
    with WidgetsBindingObserver {
  double initialScale = DEFAULT_SCALE_FACTOR;
  double scale = DEFAULT_SCALE_FACTOR;
  final double minScale = 4;
  final double maxScale = 500;

  double viewerCenterX = 0;
  double viewerCenterY = 0;

  double alignmentX = 0;
  double alignmentY = 0;

  double offsetXFromWindowCenter = 0;
  double offsetYFromWindowCenter = 0;

  // Store the previous transformation matrix
  Matrix4? _previousTransform;
  Size? _previousSize;

  final GlobalKey interactiveViewerKey = GlobalKey();
  late NFTransformationController _transformationController;

  void _centerAndScale() {
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;

    if (renderBox != null) {
      final Size parentSize = renderBox.size;
      final double dx = parentSize.width / 2 * (1 - initialScale);
      final double dy = parentSize.height / 2 * (1 - initialScale);

      _transformationController.value = Matrix4.identity()
        ..translate(dx, dy)
        ..scale(initialScale);

      viewerCenterX = dx;
      viewerCenterY = dy;

      FFAppState().NFZoomFactor = scale;
      _previousTransform = _transformationController.value.clone();
    }
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    _handleWindowResize();
  }

  void _handleWindowResize() {
    if (_previousTransform == null) return;

    final newSize =
        View.of(context).physicalSize / View.of(context).devicePixelRatio;
    if (_previousSize == null) {
      _previousSize = newSize;
      return;
    }

    // Calculate size change ratios
    final double widthRatio = newSize.width / _previousSize!.width;
    final double heightRatio = newSize.height / _previousSize!.height;

    // Adjust transformation while maintaining relative position
    final Matrix4 oldTransform = _previousTransform!.clone();
    final Matrix4 newTransform = Matrix4.identity();

    // Extract old transform components
    final double oldScale = oldTransform.getMaxScaleOnAxis();
    final double oldTranslateX = oldTransform.row0[3];
    final double oldTranslateY = oldTransform.row1[3];

    // Calculate new transform components
    final double newTranslateX = oldTranslateX * widthRatio;
    final double newTranslateY = oldTranslateY * heightRatio;

    // Apply new transform
    newTransform
      ..translate(newTranslateX, newTranslateY)
      ..scale(oldScale);

    setState(() {
      _transformationController.value = newTransform;
      _previousTransform = newTransform;
      _previousSize = newSize;

      // Update state variables
      scale = oldScale;
      alignToCenterOfViewer(context);
    });
  }

  @override
  void initState() {
    super.initState();
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
          NFInteractiveViewer(
            transformationController: _transformationController,
            minScale: minScale,
            maxScale: maxScale,
            scaleEnabled: true,
            panEnabled: true,
            trackpadScrollCausesScale: true,
            onInteractionUpdate: (details) {
              setState(() {
                scale = _transformationController.value.getMaxScaleOnAxis();
                alignToCenterOfViewer(context);
                _previousTransform = _transformationController.value.clone();
              });
            },
            boundaryMargin: EdgeInsets.zero,
            constrained: true,
            child: Container(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * maxScale,
                height: MediaQuery.of(context).size.height * maxScale,
                child: Container(
                  key: interactiveViewerKey,
                  child: widget.stackComponent!(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void alignToCenterOfViewer(BuildContext context) {
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final Size parentSize = renderBox.size;
    double w = parentSize.width * scale;
    double h = parentSize.height * scale;

    double halfW = w / 2;
    double halfH = h / 2;

    viewerCenterX = _transformationController.value.row0[3] + halfW;
    viewerCenterY = _transformationController.value.row1[3] + halfH;

    alignmentX = (viewerCenterX / parentSize.width) * 2 - 1;
    alignmentY = (viewerCenterY / parentSize.height) * 2 - 1;

    double centerX = parentSize.width / 2;
    double centerY = parentSize.height / 2;

    double offsetX = viewerCenterX - centerX;
    double offsetY = viewerCenterY - centerY;

    offsetXFromWindowCenter = offsetX;
    offsetYFromWindowCenter = offsetY;

    FFAppState().NFViewCenter = NFOffsetStruct(
      offsetX: viewerCenterX,
      offsetY: viewerCenterY,
    );

    FFAppState().NFViewportCenter = NFOffsetStruct(
      offsetX: offsetXFromWindowCenter,
      offsetY: offsetYFromWindowCenter,
    );

    FFAppState().NFZoomFactor = scale;
    FFAppState().update(() {});
  }
}
