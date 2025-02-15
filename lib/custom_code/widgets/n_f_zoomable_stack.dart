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

const double DEFAULT_SCALE_FACTOR = 100;

class _NFZoomableStackState extends State<NFZoomableStack>
    with WidgetsBindingObserver {
  double initialScale = DEFAULT_SCALE_FACTOR; // Initial scale factor
  double scale = DEFAULT_SCALE_FACTOR;
  // final double minScale = 0.03125; // Minimum zoom level
  // final double maxScale = 20; // Maximum zoom level
  final double minScale = 4; // Minimum zoom level
  final double maxScale = 500; // Maximum zoom level

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
      final Size parentSize = renderBox.size;
      final double parentWidth = parentSize.width;
      final double parentHeight = parentSize.height;

      final double dx = parentWidth / 2 * (1 - initialScale);
      final double dy = parentHeight / 2 * (1 - initialScale);

      _transformationController.value = Matrix4.identity()
        ..translate(dx, dy) // Shift the view so scaling is centered
        ..scale(initialScale);

      viewerCenterX = dx;
      viewerCenterY = dy;

      print("SCALE FACTOR: $scale");
      // FFAppState().ViewportCenter = NFOffsetStruct(
      //   offsetX: viewerCenterX,
      //   offsetY: viewerCenterY,
      // );
      FFAppState().NFZoomFactor = scale;
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
    print("Window metrics changed");
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
            // alignToCenterOfViewer(context);
            _center();
          });
        });
      } else {
        // print("Window resized");
        _center();
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
          NFInteractiveViewer(
            transformationController: _transformationController,
            minScale: minScale,
            maxScale: maxScale,
            scaleEnabled: true,
            panEnabled: true,
            trackpadScrollCausesScale: true,
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
            boundaryMargin: EdgeInsets.zero, // Allows free panning
            // boundaryMargin:
            //     EdgeInsets.all(double.infinity), // Allows free panning
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
                  decoration: BoxDecoration(),
                  // height: 5000,
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
    // double w = MediaQuery.of(context).size.width * scale;
    // double h = MediaQuery.of(context).size.height * scale;

    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final Size parentSize = renderBox.size;
    double w = parentSize.width * scale;
    double h = parentSize.height * scale;

    double halfW = w / 2;
    double halfH = h / 2;

    // print(w);
    // print(h);

    // print(_transformationController.value.row0[3]);
    // print(_transformationController.value.row1[3]);

    viewerCenterX = _transformationController.value.row0[3] + halfW;
    viewerCenterY = _transformationController.value.row1[3] + halfH;

    // print(viewerCenterX);
    // print(viewerCenterY);
    // print('--------------------');

    // alignmentX = (viewerCenterX / MediaQuery.of(context).size.width) * 2 - 1;
    // alignmentY = (viewerCenterY / MediaQuery.of(context).size.height) * 2 - 1;

    // // Calculate the center of the window
    // double centerX = MediaQuery.of(context).size.width / 2;
    // double centerY = MediaQuery.of(context).size.height / 2;

    alignmentX = (viewerCenterX / parentSize.width) * 2 - 1;
    alignmentY = (viewerCenterY / parentSize.height) * 2 - 1;

    // Calculate the center of the parent container
    double centerX = parentSize.width / 2;
    double centerY = parentSize.height / 2;

    // Calculate the absolute offsets from the center
    double offsetX = viewerCenterX - centerX;
    double offsetY = viewerCenterY - centerY;

    print('Offset from center X: $offsetX');
    print('Offset from center Y: $offsetY');

    offsetXFromWindowCenter = offsetX;
    offsetYFromWindowCenter = offsetY;

    FFAppState().NFViewCenter =
        NFOffsetStruct(offsetX: viewerCenterX, offsetY: viewerCenterY);

    // print('View center x ${FFAppState().ViewCenter.offsetX}');
    // print('View center y ${FFAppState().ViewCenter.offsetY}');
    FFAppState().NFViewportCenter = NFOffsetStruct(
      offsetX: offsetXFromWindowCenter,
      offsetY: offsetYFromWindowCenter,
    );
    print("Zoom: $scale");
    FFAppState().NFZoomFactor = scale;

    FFAppState().update(() {});
  }

  void _center() {
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;

    if (renderBox != null) {
      final Size parentSize = renderBox.size;
      final double parentWidth = parentSize.width;
      final double parentHeight = parentSize.height;

      final double dx = parentWidth / 2 * (1 - FFAppState().NFZoomFactor);
      final double dy = parentHeight / 2 * (1 - FFAppState().NFZoomFactor);

      _transformationController.value = Matrix4.identity()
        ..translate(dx, dy) // Shift the view so scaling is centered
        ..scale(FFAppState().NFZoomFactor);
    }
    alignToCenterOfViewer(context);
  }
}
