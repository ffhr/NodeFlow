import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'node_component_model.dart';
export 'node_component_model.dart';

class NodeComponentWidget extends StatefulWidget {
  const NodeComponentWidget({
    super.key,
    required this.node,
  });

  final NodeStruct? node;

  @override
  State<NodeComponentWidget> createState() => _NodeComponentWidgetState();
}

class _NodeComponentWidgetState extends State<NodeComponentWidget> {
  late NodeComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NodeComponentModel());

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.8),
      child: Container(
        width: FFAppState().NodeWidth,
        height: FFAppState().NodeHeight,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondary,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: widget!.node!.isSelected
                ? FlutterFlowTheme.of(context).primary
                : Color(0x00000000),
            width: 2.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget!.node?.title,
                        '[title]',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: Colors.white,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget!.node?.description,
                            '[description]',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
