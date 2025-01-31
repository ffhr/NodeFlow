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
          top: false,
          left: false,
          right: false,
          bottom: false,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: custom_widgets.NFZoomableStack(
              width: double.infinity,
              height: double.infinity,
              stackComponent: () => PlaygroundISStackWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
