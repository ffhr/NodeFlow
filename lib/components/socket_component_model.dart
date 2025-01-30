import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'socket_component_widget.dart' show SocketComponentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SocketComponentModel extends FlutterFlowModel<SocketComponentWidget> {
  ///  Local state fields for this component.

  NodeSocketStruct? nodeSocket;
  void updateNodeSocketStruct(Function(NodeSocketStruct) updateFn) {
    updateFn(nodeSocket ??= NodeSocketStruct());
  }

  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
