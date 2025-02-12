import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/dummy_node_widget.dart';
import '/components/edge_component_widget.dart';
import '/components/node_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'n_f_diagram_widget.dart' show NFDiagramWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NFDiagramModel extends FlutterFlowModel<NFDiagramWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - sortByIsSelected] action in NodeComponent widget.
  List<NodeStruct>? sortedNodes;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
