// Automatic FlutterFlow imports
import 'package:flutter/gestures.dart';

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

import 'package:flutter/gestures.dart';

class ZoomableStack extends StatefulWidget {
  const ZoomableStack({
    super.key,
    this.width,
    this.height,
    this.stackComponent,
  });

  final double? width;
  final double? height;
  final Widget Function()? stackComponent;

  @override
  State<ZoomableStack> createState() => _ZoomableStackState();
}

class _ZoomableStackState extends State<ZoomableStack> {
  double scale = 10; // Initial scale factor
  final double minScale = 1; // Minimum zoom level
  final double maxScale = 10; // Maximum zoom level

  void _handleMouseWheel(PointerEvent event) {
    if (event is PointerScrollEvent) {
      setState(() {
        // Adjust the scale based on the scroll direction
        if (event.scrollDelta.dy < 0) {
          // Zoom in
          scale = (scale + 0.1).clamp(minScale, maxScale);
        } else if (event.scrollDelta.dy > 0) {
          // Zoom out
          scale = (scale - 0.1).clamp(minScale, maxScale);
        }
      });
    }
  }

  Offset viewportCenterOffset = Offset.zero;
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: _handleMouseWheel,

      onPointerDown: (PointerDownEvent event) {
        if (event.buttons == kSecondaryMouseButton || event.buttons == kMiddleMouseButton) {
          setState(() {
            _isDragging = true;
          });
        }
      },
      onPointerUp: (PointerUpEvent event) {
        if (event.buttons == 0) {
          setState(() {
            _isDragging = false;
          });
        }
      },
      onPointerMove: (PointerMoveEvent event) {
        if (_isDragging) {
          setState(() {
            viewportCenterOffset += event.delta;
          });
        }
      },

      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
        ),
        child: Container(
          child: Transform.translate(
            offset: viewportCenterOffset,
            child: Transform.scale(
                scale: scale, child: widget.stackComponent?.call()),
          ),
        ),
      ),
    );
  }
}
