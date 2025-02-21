import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/socket_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'n_f_sockets_widget.dart' show NFSocketsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NFSocketsModel extends FlutterFlowModel<NFSocketsWidget> {
  ///  Local state fields for this component.

  Color? inputsDefaultColor;

  Color? inputsSelectedColor = Color(4278190203);

  Color? outputsDefaultColor = Color(4294909213);

  Color? outputsSelectedColor = Color(4287692800);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future onClickedActionBlock(
    BuildContext context, {
    required bool? isClicked,
    required bool? isInput,
    required String? nodeId,
    required int? socketIndex,
  }) async {
    if (isClicked!) {
      if (isInput!) {
        // Set node target input socket
        FFAppState().updateNFCurrentBuildingEdgeStruct(
          (e) => e
            ..targetNodeId = nodeId
            ..targetInputSocketIndex = socketIndex,
        );
        FFAppState().update(() {});
      } else {
        // Set edge source output socket
        FFAppState().updateNFCurrentBuildingEdgeStruct(
          (e) => e
            ..sourceNodeId = nodeId
            ..sourceOutputSocketIndex = socketIndex,
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

  Future onPanEndActionBlock(
    BuildContext context, {
    required NFPointStruct? point,
    required bool? isInput,
  }) async {
    if (isInput!) {
      // Set node source output socket
      FFAppState().updateNFCurrentBuildingEdgeStruct(
        (e) => e
          ..sourceNodeId = functions.getSourceNodeIdFromPoint(
              point!,
              FFAppState().Nodes.toList(),
              FFAppState().NFViewportCenter,
              FFAppState().NFZoomFactor / FFAppState().DefaultZoomFactor,
              MediaQuery.sizeOf(context).width,
              MediaQuery.sizeOf(context).height)
          ..sourceOutputSocketIndex = functions.getSourceOutputIndexFromPoint(
              point!,
              FFAppState().Nodes.toList(),
              FFAppState().NFViewportCenter,
              FFAppState().NFZoomFactor / FFAppState().DefaultZoomFactor,
              MediaQuery.sizeOf(context).width,
              MediaQuery.sizeOf(context).height),
      );
    } else {
      // Set node target input socket
      FFAppState().updateNFCurrentBuildingEdgeStruct(
        (e) => e
          ..targetNodeId = functions.getTargetNodeIdFromPoint(
              point!,
              FFAppState().Nodes.toList(),
              FFAppState().NFViewportCenter,
              FFAppState().NFZoomFactor / FFAppState().DefaultZoomFactor,
              MediaQuery.sizeOf(context).width,
              MediaQuery.sizeOf(context).height)
          ..targetInputSocketIndex = functions.getTargetInputIndexFromPoint(
              point!,
              FFAppState().Nodes.toList(),
              FFAppState().NFViewportCenter,
              FFAppState().NFZoomFactor / FFAppState().DefaultZoomFactor,
              MediaQuery.sizeOf(context).width,
              MediaQuery.sizeOf(context).height),
      );
    }

    if (FFAppState().NFCurrentBuildingEdge.hasSourceNodeId() &&
        FFAppState().NFCurrentBuildingEdge.hasTargetNodeId() &&
        FFAppState().NFCurrentBuildingEdge.hasSourceOutputSocketIndex() &&
        FFAppState().NFCurrentBuildingEdge.hasTargetInputSocketIndex()) {
      // Add building edge to list
      FFAppState().addToEdges(FFAppState().NFCurrentBuildingEdge);
      // Unset
      FFAppState().NFCurrentBuildingEdge = NodeEdgeStruct();
    } else {
      // Unset
      FFAppState().NFCurrentBuildingEdge = NodeEdgeStruct();
    }
  }
}
