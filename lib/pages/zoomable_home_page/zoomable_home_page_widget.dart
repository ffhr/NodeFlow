import '/components/n_f_diagram_min_widget.dart';
import '/components/n_f_toolbox_widget.dart';
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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: custom_widgets.NFZoomableStack(
                width: double.infinity,
                height: double.infinity,
                stackComponent: () => NFDiagramMinWidget(),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: wrapWithModel(
                model: _model.nFToolboxModel,
                updateCallback: () => safeSetState(() {}),
                child: NFToolboxWidget(),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(1.0, 1.0),
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Zoom: ${formatNumber(
                      FFAppState().ZoomFactor,
                      formatType: FormatType.custom,
                      format: '000',
                      locale: '',
                    )}%',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
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
