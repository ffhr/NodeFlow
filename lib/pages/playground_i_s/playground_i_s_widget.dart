import '/components/playground_i_s_stack_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
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
<<<<<<< HEAD
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
                                width: _model.nodeWidth,
                                height: _model.nodeHeight,
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
                child: Container(
                  width: _model.nodeWidth,
                  height: _model.nodeHeight,
                  constraints: BoxConstraints(
                    maxWidth: _model.nodeWidth,
                    maxHeight: _model.nodeHeight,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Virtual (x, y): ${_model.virtualX.toString()}, ${_model.virtualY.toString()}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        'Absolute (x, y):  ${valueOrDefault<String>(
                          functions.helperNFOffsetToString(
                              functions.virtualToAbsolute(
                                  NFOffsetStruct(
                                    offsetX: _model.virtualX,
                                    offsetY: _model.virtualY,
                                  ),
                                  NFSizeStruct(
                                    width: _model.nodeWidth,
                                    height: _model.nodeHeight,
                                  ),
                                  NFOffsetStruct(
                                    offsetX: -100.0,
                                    offsetY: -100.0,
                                  ),
                                  1.0,
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
=======
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: custom_widgets.ZoomableStack(
              width: double.infinity,
              height: double.infinity,
              stackComponent: () => PlaygroundISStackWidget(),
            ),
>>>>>>> 4155355cbeabc600b0fda065351578c9ad458052
          ),
        ),
      ),
    );
  }
}
