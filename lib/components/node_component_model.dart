import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/socket_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'node_component_widget.dart' show NodeComponentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NodeComponentModel extends FlutterFlowModel<NodeComponentWidget> {
  ///  Local state fields for this component.

  int renderNodeVar = 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future onClickedActionBlock(
    BuildContext context, {
    required bool? isClicked,
    required String? nodeId,
    required int? nodeIndex,
    required bool? isInput,
  }) async {
    if (isClicked!) {
      if (isInput!) {
        // Set node target input socket
        FFAppState().updateNFCurrentBuildingEdgeStruct(
          (e) => e
            ..targetNodeId = nodeId
            ..targetInputSocketIndex = nodeIndex,
        );
        FFAppState().update(() {});
      } else {
        // Set edge source output socket
        FFAppState().updateNFCurrentBuildingEdgeStruct(
          (e) => e
            ..sourceNodeId = nodeId
            ..sourceOutputSocketIndex = nodeIndex,
        );
        FFAppState().update(() {});
      }

      if (FFAppState().NFCurrentBuildingEdge.hasSourceNodeId() &&
          FFAppState().NFCurrentBuildingEdge.hasTargetNodeId() &&
          FFAppState().NFCurrentBuildingEdge.hasSourceOutputSocketIndex() &&
          FFAppState().NFCurrentBuildingEdge.hasTargetInputSocketIndex()) {
        if (functions.edgesContainsEdge(
            FFAppState().NFCurrentBuildingEdge, FFAppState().Edges.toList())) {
          // Remove building edge from list
          FFAppState().removeFromEdges(FFAppState().NFCurrentBuildingEdge);
          FFAppState().update(() {});
          // Unset
          FFAppState().NFCurrentBuildingEdge = NodeEdgeStruct();
          FFAppState().update(() {});
        } else {
          // Add building edge to list
          FFAppState().addToEdges(FFAppState().NFCurrentBuildingEdge);
          FFAppState().update(() {});
          // Unset
          FFAppState().NFCurrentBuildingEdge = NodeEdgeStruct();
          FFAppState().update(() {});
        }
      }
    } else {
      // Unset
      FFAppState().NFCurrentBuildingEdge = NodeEdgeStruct();
      FFAppState().update(() {});
    }
  }
}
