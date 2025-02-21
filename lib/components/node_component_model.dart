import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/n_f_sockets_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'node_component_widget.dart' show NodeComponentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NodeComponentModel extends FlutterFlowModel<NodeComponentWidget> {
  ///  Local state fields for this component.

  int renderNodeVar = 0;

  ///  State fields for stateful widgets in this component.

  // Model for NFSocketsLeft.
  late NFSocketsModel nFSocketsLeftModel;
  // Model for NFSocketsTop.
  late NFSocketsModel nFSocketsTopModel;
  // Model for NFSocketsRight.
  late NFSocketsModel nFSocketsRightModel;
  // Model for NFSocketsBottom.
  late NFSocketsModel nFSocketsBottomModel;

  @override
  void initState(BuildContext context) {
    nFSocketsLeftModel = createModel(context, () => NFSocketsModel());
    nFSocketsTopModel = createModel(context, () => NFSocketsModel());
    nFSocketsRightModel = createModel(context, () => NFSocketsModel());
    nFSocketsBottomModel = createModel(context, () => NFSocketsModel());
  }

  @override
  void dispose() {
    nFSocketsLeftModel.dispose();
    nFSocketsTopModel.dispose();
    nFSocketsRightModel.dispose();
    nFSocketsBottomModel.dispose();
  }
}
