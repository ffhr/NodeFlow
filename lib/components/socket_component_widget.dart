import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'socket_component_model.dart';
export 'socket_component_model.dart';

class SocketComponentWidget extends StatefulWidget {
  const SocketComponentWidget({
    super.key,
    required this.nodeSocket,
    this.onMouseEnterNodeSocket,
  });

  final NodeSocketStruct? nodeSocket;
  final Future Function()? onMouseEnterNodeSocket;

  @override
  State<SocketComponentWidget> createState() => _SocketComponentWidgetState();
}

class _SocketComponentWidgetState extends State<SocketComponentWidget> {
  late SocketComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocketComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // Set NodeSocket
      _model.nodeSocket = widget!.nodeSocket;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return MouseRegion(
      opaque: false,
      cursor: MouseCursor.defer ?? MouseCursor.defer,
      child: Container(
        width: 20.0,
        height: 20.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).warning,
          shape: BoxShape.circle,
          border: Border.all(
            color: valueOrDefault<Color>(
              widget!.nodeSocket!.isHover
                  ? Colors.white
                  : FlutterFlowTheme.of(context).warning,
              Colors.white,
            ),
            width: 3.0,
          ),
        ),
      ),
      onEnter: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = true);
        // Reset drawing
        FFAppState().updateEdgeDrawingStruct(
          (e) =>
              e..drawingEndPoint = FFAppState().EdgeDrawing.drawingStartPoint,
        );
        if (FFAppState().EdgeDrawing.drawingState == DrawingState.inactive) {
          // Set status Drawing.STARTED
          FFAppState().updateEdgeDrawingStruct(
            (e) => e..drawingState = DrawingState.started,
          );
          safeSetState(() {});
        }
        if ((FFAppState().EdgeDrawing.drawingState == DrawingState.active) ||
            (FFAppState().EdgeDrawing.drawingState == DrawingState.finished)) {
          // Set status Drawing.INACTIVE
          FFAppState().updateEdgeDrawingStruct(
            (e) => e..drawingState = DrawingState.inactive,
          );
          safeSetState(() {});
        }
        // Set is hover ON
        _model.updateNodeSocketStruct(
          (e) => e..isHover = true,
        );
        safeSetState(() {});
      }),
      onExit: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = false);
        // Set is hover OFF
        _model.updateNodeSocketStruct(
          (e) => e..isHover = false,
        );
        safeSetState(() {});
      }),
    );
  }
}
