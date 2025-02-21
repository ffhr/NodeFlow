// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class NFEdges extends StatefulWidget {
  const NFEdges({
    super.key,
    this.width,
    this.height,
    this.edges,
    this.nodes,
    this.diagram,
    this.onTapEdge,
  });

  final double? width;
  final double? height;
  final List<NodeEdgeStruct>? edges;
  final List<NodeStruct>? nodes;
  final NFDiagramStruct? diagram;
  final Future Function(int? index)? onTapEdge;

  @override
  State<NFEdges> createState() => _NFEdgesState();
}

class _NFEdgesState extends State<NFEdges> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
