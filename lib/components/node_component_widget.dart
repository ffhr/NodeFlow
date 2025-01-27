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

    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.8),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
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
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
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
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5.0, 36.0, 0.0, 0.0),
          child: Builder(
            builder: (context) {
              final inputsList =
                  (widget!.node?.inputs?.toList() ?? []).take(3).toList();

              return Column(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(inputsList.length, (inputsListIndex) {
                  final inputsListItem = inputsList[inputsListIndex];
                  return Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).warning,
                      shape: BoxShape.circle,
                    ),
                  );
                })
                    .divide(SizedBox(height: 10.0))
                    .addToStart(SizedBox(height: 15.0))
                    .addToEnd(SizedBox(height: 15.0)),
              );
            },
          ),
        ),
        Align(
          alignment: AlignmentDirectional(1.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 5.0, 0.0),
            child: Builder(
              builder: (context) {
                final outputsList =
                    (widget!.node?.outputs?.toList() ?? []).take(3).toList();

                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children:
                      List.generate(outputsList.length, (outputsListIndex) {
                    final outputsListItem = outputsList[outputsListIndex];
                    return Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).warning,
                        shape: BoxShape.circle,
                      ),
                    );
                  })
                          .divide(SizedBox(height: 10.0))
                          .addToStart(SizedBox(height: 15.0))
                          .addToEnd(SizedBox(height: 15.0)),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
