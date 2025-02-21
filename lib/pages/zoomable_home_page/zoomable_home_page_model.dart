import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/n_f_diagram_widget.dart';
import '/components/n_f_toolbox_widget.dart';
import '/components/n_f_zoom_box_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'zoomable_home_page_widget.dart' show ZoomableHomePageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ZoomableHomePageModel extends FlutterFlowModel<ZoomableHomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NFToolbox component.
  late NFToolboxModel nFToolboxModel;
  // Model for NFZoomBox component.
  late NFZoomBoxModel nFZoomBoxModel;

  @override
  void initState(BuildContext context) {
    nFToolboxModel = createModel(context, () => NFToolboxModel());
    nFZoomBoxModel = createModel(context, () => NFZoomBoxModel());
  }

  @override
  void dispose() {
    nFToolboxModel.dispose();
    nFZoomBoxModel.dispose();
  }
}
