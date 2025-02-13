import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'n_f_toolbox_model.dart';
export 'n_f_toolbox_model.dart';

class NFToolboxWidget extends StatefulWidget {
  const NFToolboxWidget({super.key});

  @override
  State<NFToolboxWidget> createState() => _NFToolboxWidgetState();
}

class _NFToolboxWidgetState extends State<NFToolboxWidget> {
  late NFToolboxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NFToolboxModel());

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

    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 40.0,
            fillColor: FlutterFlowTheme.of(context).primary,
            icon: Icon(
              Icons.opacity_sharp,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
            onPressed: () async {
              if (Theme.of(context).brightness == Brightness.light) {
                // Set dark theme
                setDarkModeSetting(context, ThemeMode.dark);
              }
              if (Theme.of(context).brightness == Brightness.dark) {
                // Set light theme
                setDarkModeSetting(context, ThemeMode.light);
              }
            },
          ),
          FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 40.0,
            fillColor: FlutterFlowTheme.of(context).primary,
            icon: Icon(
              Icons.grid_4x4,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
            onPressed: () async {
              if (FFAppState().CurrentGridType == NFGridType.grid) {
                FFAppState().CurrentGridType = NFGridType.dots;
                safeSetState(() {});
                return;
              }
              if (FFAppState().CurrentGridType == NFGridType.dots) {
                FFAppState().CurrentGridType = NFGridType.grid;
                safeSetState(() {});
                return;
              }
            },
          ),
        ].divide(SizedBox(height: 15.0)),
      ),
    );
  }
}
