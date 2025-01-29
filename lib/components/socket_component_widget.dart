import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'socket_component_model.dart';
export 'socket_component_model.dart';

class SocketComponentWidget extends StatefulWidget {
  const SocketComponentWidget({
    super.key,
    required this.nodeSocket,
    this.onSocketTap,
  });

  final NodeSocketStruct? nodeSocket;
  final Future Function()? onSocketTap;

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

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      cursor: MouseCursor.defer ?? MouseCursor.defer,
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          // On socket tap
          await widget.onSocketTap?.call();
        },
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
      ),
      onEnter: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = true);
        // On mouse hover node socket
        await actions.onMouseEnterNodeSocket(
          widget!.nodeSocket!,
        );
      }),
      onExit: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = false);
        // On mouse exit node socket
        await actions.onMouseExitNodeSocket(
          widget!.nodeSocket!,
        );
      }),
    );
  }
}
