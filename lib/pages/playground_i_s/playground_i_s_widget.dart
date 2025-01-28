import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'playground_i_s_model.dart';
export 'playground_i_s_model.dart';

class PlaygroundISWidget extends StatefulWidget {
  const PlaygroundISWidget({super.key});

  @override
  State<PlaygroundISWidget> createState() => _PlaygroundISWidgetState();
}

class _PlaygroundISWidgetState extends State<PlaygroundISWidget> {
  late PlaygroundISModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaygroundISModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: 1.0,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: _model.containerWidth,
                  height: _model.containerHeight,
                  constraints: BoxConstraints(
                    maxWidth: 200.0,
                    maxHeight: 200.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(
                        valueOrDefault<double>(
                          functions
                              .virtualToRelative(
                                  NFOffsetStruct(
                                    offsetX: _model.virtualX,
                                    offsetY: _model.virtualY,
                                  ),
                                  NFSizeStruct(
                                    width: 200.0,
                                    height: 200.0,
                                  ),
                                  NFOffsetStruct(
                                    offsetX: 0.0,
                                    offsetY: 0.0,
                                  ),
                                  1.0,
                                  NFSizeStruct(
                                    width: MediaQuery.sizeOf(context).width,
                                    height: MediaQuery.sizeOf(context).height,
                                  ))
                              .offsetX,
                          0.0,
                        ),
                        valueOrDefault<double>(
                          functions
                              .virtualToRelative(
                                  NFOffsetStruct(
                                    offsetX: _model.virtualX,
                                    offsetY: _model.virtualY,
                                  ),
                                  NFSizeStruct(
                                    width: 200.0,
                                    height: 200.0,
                                  ),
                                  NFOffsetStruct(
                                    offsetX: 0.0,
                                    offsetY: 0.0,
                                  ),
                                  1.0,
                                  NFSizeStruct(
                                    width: MediaQuery.sizeOf(context).width,
                                    height: MediaQuery.sizeOf(context).height,
                                  ))
                              .offsetY,
                          0.0,
                        )),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Virtual (x, y): ${_model.virtualX.toString()}, ${_model.virtualY.toString()}',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Text(
                          'Absolute (x, y):  ${functions.virtualToAbsolute(NFOffsetStruct(
                                offsetX: _model.virtualX,
                                offsetY: _model.virtualY,
                              ), NFSizeStruct(
                                width: _model.containerWidth,
                                height: _model.containerHeight,
                              ), NFOffsetStruct(
                                offsetX: 0.0,
                                offsetY: 0.0,
                              ), 1.0, NFSizeStruct(
                                width: MediaQuery.sizeOf(context).width,
                                height: MediaQuery.sizeOf(context).height,
                              )).offsetX.toString()}, ${functions.virtualToAbsolute(NFOffsetStruct(
                                offsetX: _model.virtualX,
                                offsetY: _model.virtualY,
                              ), NFSizeStruct(
                                width: _model.containerWidth,
                                height: _model.containerHeight,
                              ), NFOffsetStruct(
                                offsetX: 0.0,
                                offsetY: 0.0,
                              ), 1.0, NFSizeStruct(
                                width: MediaQuery.sizeOf(context).width,
                                height: MediaQuery.sizeOf(context).height,
                              )).offsetY.toString()}',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Text(
                          'Relative (x, y): ${functions.virtualToRelative(NFOffsetStruct(
                                offsetX: _model.virtualX,
                                offsetY: _model.virtualY,
                              ), NFSizeStruct(
                                width: _model.containerWidth,
                                height: _model.containerHeight,
                              ), NFOffsetStruct(
                                offsetX: 0.0,
                                offsetY: 0.0,
                              ), 1.0, NFSizeStruct(
                                width: MediaQuery.sizeOf(context).width,
                                height: MediaQuery.sizeOf(context).height,
                              )).offsetX.toString()}, ${functions.virtualToRelative(NFOffsetStruct(
                                offsetX: _model.virtualX,
                                offsetY: _model.virtualY,
                              ), NFSizeStruct(
                                width: _model.containerWidth,
                                height: _model.containerHeight,
                              ), NFOffsetStruct(
                                offsetX: 0.0,
                                offsetY: 0.0,
                              ), 1.0, NFSizeStruct(
                                width: MediaQuery.sizeOf(context).width,
                                height: MediaQuery.sizeOf(context).height,
                              )).offsetY.toString()}',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
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
    );
  }
}
