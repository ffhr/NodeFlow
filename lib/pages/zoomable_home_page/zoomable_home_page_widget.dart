import '/components/n_f_diagram_min_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'zoomable_home_page_model.dart';
export 'zoomable_home_page_model.dart';

class ZoomableHomePageWidget extends StatefulWidget {
  const ZoomableHomePageWidget({super.key});

  @override
  State<ZoomableHomePageWidget> createState() => _ZoomableHomePageWidgetState();
}

class _ZoomableHomePageWidgetState extends State<ZoomableHomePageWidget> {
  late ZoomableHomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZoomableHomePageModel());

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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: custom_widgets.NFZoomableStack(
            width: double.infinity,
            height: double.infinity,
            stackComponent: () => NFDiagramMinWidget(),
          ),
        ),
      ),
    );
  }
}
