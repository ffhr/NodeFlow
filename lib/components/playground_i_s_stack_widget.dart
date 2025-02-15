import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'playground_i_s_stack_model.dart';
export 'playground_i_s_stack_model.dart';

class PlaygroundISStackWidget extends StatefulWidget {
  const PlaygroundISStackWidget({super.key});

  @override
  State<PlaygroundISStackWidget> createState() =>
      _PlaygroundISStackWidgetState();
}

class _PlaygroundISStackWidgetState extends State<PlaygroundISStackWidget> {
  late PlaygroundISStackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaygroundISStackModel());

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

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFF58585),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-0.5, -0.5),
            child: Container(
              width: 500.0,
              height: 500.0,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: SvgPicture.asset(
                  'assets/images/coordinate_system_2D_math_v1_a.svg',
                  width: 2211.0,
                  height: 2211.0,
                  fit: BoxFit.fill,
                  alignment: Alignment(0.0, 0.0),
                ),
              ),
            ),
          ),
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
            alignment: AlignmentDirectional(
                valueOrDefault<double>(
                  functions
                      .virtualToRelative(
                          NFOffsetStruct(
                            offsetX: _model.virtualX,
                            offsetY: _model.virtualY,
                          ),
                          NFSizeStruct(
                            width: _model.nodeWidth,
                            height: _model.nodeHeight,
                          ),
                          FFAppState().NFViewportCenter,
                          FFAppState().NFZoomFactor,
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
                            width: _model.nodeWidth,
                            height: _model.nodeHeight,
                          ),
                          FFAppState().NFViewportCenter,
                          FFAppState().NFZoomFactor,
                          NFSizeStruct(
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height,
                          ))
                      .offsetY,
                  0.0,
                )),
            child: Container(
              width: _model.nodeWidth,
              height: _model.nodeHeight,
              constraints: BoxConstraints(
                maxWidth: _model.nodeWidth,
                maxHeight: _model.nodeHeight,
              ),
              decoration: BoxDecoration(
                color: Color(0x624B39EF),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Virtual (x, y): ${_model.virtualX.toString()}, ${_model.virtualY?.toString()}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    'Absolute (x, y):  ${valueOrDefault<String>(
                      functions
                          .helperNFOffsetToString(functions.virtualToAbsolute(
                              NFOffsetStruct(
                                offsetX: _model.virtualX,
                                offsetY: _model.virtualY,
                              ),
                              FFAppState().NFViewportCenter,
                              FFAppState().NFZoomFactor,
                              NFSizeStruct(
                                width: MediaQuery.sizeOf(context).width,
                                height: MediaQuery.sizeOf(context).height,
                              ))),
                      'n/a',
                    )}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    'Relative (x, y): ${formatNumber(
                      functions
                          .virtualToRelative(
                              NFOffsetStruct(
                                offsetX: _model.virtualX,
                                offsetY: _model.virtualY,
                              ),
                              NFSizeStruct(
                                width: _model.nodeWidth,
                                height: _model.nodeHeight,
                              ),
                              FFAppState().NFViewportCenter,
                              FFAppState().NFZoomFactor,
                              NFSizeStruct(
                                width: MediaQuery.sizeOf(context).width,
                                height: MediaQuery.sizeOf(context).height,
                              ))
                          .offsetX,
                      formatType: FormatType.custom,
                      format: '##.####',
                      locale: '',
                    )}, ${formatNumber(
                      functions
                          .virtualToRelative(
                              NFOffsetStruct(
                                offsetX: _model.virtualX,
                                offsetY: _model.virtualY,
                              ),
                              NFSizeStruct(
                                width: _model.nodeWidth,
                                height: _model.nodeHeight,
                              ),
                              FFAppState().NFViewportCenter,
                              FFAppState().NFZoomFactor,
                              NFSizeStruct(
                                width: MediaQuery.sizeOf(context).width,
                                height: MediaQuery.sizeOf(context).height,
                              ))
                          .offsetY,
                      formatType: FormatType.custom,
                      format: '##.####',
                      locale: '',
                    )}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
