import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/drawing_pan_widget.dart';
import '/components/node_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  List<NodeStruct> nodes = [];
  void addToNodes(NodeStruct item) => nodes.add(item);
  void removeFromNodes(NodeStruct item) => nodes.remove(item);
  void removeAtIndexFromNodes(int index) => nodes.removeAt(index);
  void insertAtIndexInNodes(int index, NodeStruct item) =>
      nodes.insert(index, item);
  void updateNodesAtIndex(int index, Function(NodeStruct) updateFn) =>
      nodes[index] = updateFn(nodes[index]);

  int selectedIndex = -1;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - sortByIsSelected] action in NodeComponent widget.
  List<NodeStruct>? sortedNodes;
  // Model for DrawingPan component.
  late DrawingPanModel drawingPanModel;

  @override
  void initState(BuildContext context) {
    drawingPanModel = createModel(context, () => DrawingPanModel());
  }

  @override
  void dispose() {
    drawingPanModel.dispose();
  }
}
