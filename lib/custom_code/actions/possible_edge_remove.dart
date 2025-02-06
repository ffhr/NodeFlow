// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future possibleEdgeRemove(
  List<NodeEdgeStruct> edges,
  double screenWidth,
  double screenHeight,
  List<NodeStruct> nodes,
) async {
  // Add your function code here!
  for (var edge in edges) {
    var startPoint = calculateStartPointFromEdge(edge, screenWidth,
        screenHeight, nodes, NFOffsetStruct(offsetX: 0, offsetY: 0), 1.0);
    var endPoint = calculateEndPointFromEdge(edge, screenWidth, screenHeight,
        nodes, NFOffsetStruct(offsetX: 0, offsetY: 0), 1.0);

    // if (startPoint.positionX <= endPoint.positionY) {}
  }

  return;
}
