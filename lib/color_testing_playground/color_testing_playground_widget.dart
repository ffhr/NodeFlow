import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'color_testing_playground_model.dart';
export 'color_testing_playground_model.dart';

class ColorTestingPlaygroundWidget extends StatefulWidget {
  const ColorTestingPlaygroundWidget({
    super.key,
    required this.colorNeki,
  });

  final NFColorStruct? colorNeki;

  @override
  State<ColorTestingPlaygroundWidget> createState() =>
      _ColorTestingPlaygroundWidgetState();
}

class _ColorTestingPlaygroundWidgetState
    extends State<ColorTestingPlaygroundWidget> {
  late ColorTestingPlaygroundModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ColorTestingPlaygroundModel());

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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? valueOrDefault<Color>(
                          widget!.colorNeki?.dark,
                          Colors.white,
                        )
                      : valueOrDefault<Color>(
                          widget!.colorNeki?.light,
                          Colors.black,
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
