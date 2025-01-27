import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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
                alignment: AlignmentDirectional(
                    valueOrDefault<double>(
                      functions.absoluteToRelativeX(
                          100.0, MediaQuery.sizeOf(context).width, 100.0),
                      0.0,
                    ),
                    valueOrDefault<double>(
                      functions.absoluteToRelativeY(
                          200.0, MediaQuery.sizeOf(context).height, 100.0),
                      0.0,
                    )),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
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
