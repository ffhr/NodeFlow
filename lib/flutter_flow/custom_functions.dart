import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

List<NodeStruct> initNodes() {
  var item1 = NodeStruct(
      id: "000001",
      title: "Node 1",
      description: "description 1",
      virtualPosition: NFOffsetStruct(offsetX: 100, offsetY: 100),
      size: NFSizeStruct(width: 200, height: 200),
      inputs: [
        NodeInputSocketStruct(
            socket: NodeSocketStruct(
          id: "0001",
          label: "Input 1",
          color: Colors.red,
        )),
        NodeInputSocketStruct(
            socket: NodeSocketStruct(
          id: "0002",
          label: "Input 2",
          color: Colors.yellow,
        )),
        NodeInputSocketStruct(
            socket: NodeSocketStruct(
          id: "0002",
          label: "Input 3",
          color: Colors.green,
        )),
      ],
      outputs: [
        NodeOutputSocketStruct(
            socket: NodeSocketStruct(
          id: "0001",
          label: "Output 1",
          color: Colors.red,
        )),
        NodeOutputSocketStruct(
            socket: NodeSocketStruct(
          id: "0002",
          label: "Output 2",
          color: Colors.blue,
        ))
      ]);

  var item2 = NodeStruct(
      id: "000002",
      title: "Node 2",
      description: "description 2",
      virtualPosition: NFOffsetStruct(offsetX: 0, offsetY: 0),
      size: NFSizeStruct(width: 180, height: 150),
      inputs: [
        NodeInputSocketStruct(
            socket: NodeSocketStruct(
          id: "0001",
          label: "Input 1",
          color: Colors.red,
        )),
        NodeInputSocketStruct(
            socket: NodeSocketStruct(
          id: "0002",
          label: "Input 2",
          color: Colors.yellow,
        )),
        NodeInputSocketStruct(
            socket: NodeSocketStruct(
          id: "0002",
          label: "Input 3",
          color: Colors.green,
        )),
      ],
      outputs: [
        NodeOutputSocketStruct(
            socket: NodeSocketStruct(
          id: "0001",
          label: "Output 1",
          color: Colors.red,
        )),
        NodeOutputSocketStruct(
            socket: NodeSocketStruct(
          id: "0002",
          label: "Output 2",
          color: Colors.blue,
        ))
      ]);

  var item3 = NodeStruct(
      id: "000003",
      title: "Node 3",
      description: "description 3",
      virtualPosition: NFOffsetStruct(offsetX: -100, offsetY: -200),
      size: NFSizeStruct(width: 180, height: 150),
      inputs: [
        NodeInputSocketStruct(
            socket: NodeSocketStruct(
          id: "0001",
          label: "Input 1",
          color: Colors.red,
        )),
        NodeInputSocketStruct(
            socket: NodeSocketStruct(
          id: "0002",
          label: "Input 2",
          color: Colors.yellow,
        ))
      ],
      outputs: [
        NodeOutputSocketStruct(
            socket: NodeSocketStruct(
          id: "0001",
          label: "Output 1",
          color: Colors.red,
        )),
      ]);

  return [item1, item2, item3];
}

double relativeToAbsoluteX(
  double alignmentX,
  double parentWidth,
  double childWidth,
) {
  double x = (alignmentX * parentWidth + parentWidth) / 2 + childWidth / 2;
  return x;
}

double relativeToAbsoluteY(
  double alignmentY,
  double parentHeight,
  double childHeight,
) {
  double y = (alignmentY * parentHeight + parentHeight) / 2 + childHeight / 2;
  return y;
}

NFOffsetStruct virtualToAbsolute(
  NFOffsetStruct nodePosition,
  NFOffsetStruct viewportCenter,
  double zoomFactor,
  NFSizeStruct windowSize,
) {
  double absoluteX = (windowSize.width / 2) +
      (nodePosition.offsetX - viewportCenter.offsetX) * zoomFactor;

  double absoluteY = (windowSize.height / 2) +
      (nodePosition.offsetY - viewportCenter.offsetY) * zoomFactor;

  return NFOffsetStruct(offsetX: absoluteX, offsetY: absoluteY);
}

NFOffsetStruct absoluteToRelative(
  NFOffsetStruct absolutePosition,
  NFSizeStruct windowSize,
  NFSizeStruct nodeSize,
) {
  double nodeSizeWidth = nodeSize.width;
  double nodeSizeHeight = nodeSize.height;

  double relativeX = 2 *
          (absolutePosition.offsetX - (nodeSizeWidth / 2)) /
          (windowSize.width - nodeSizeWidth) -
      1;
  double relativeY = 2 *
          (absolutePosition.offsetY - (nodeSizeHeight / 2)) /
          (windowSize.height - nodeSizeHeight) -
      1;
  return NFOffsetStruct(offsetX: relativeX, offsetY: relativeY);
}

NFOffsetStruct virtualToRelative(
  NFOffsetStruct nodePosition,
  NFSizeStruct nodeSize,
  NFOffsetStruct viewportCenter,
  double zoomFactor,
  NFSizeStruct windowSize,
) {
  // Convert virtual to absolute
  NFOffsetStruct absolutePosition =
      virtualToAbsolute(nodePosition, viewportCenter, zoomFactor, windowSize);
  // Convert absolute to relative
  NFOffsetStruct relativePosition =
      absoluteToRelative(absolutePosition, windowSize, nodeSize);

  return NFOffsetStruct(
      offsetX: relativePosition.offsetX, offsetY: relativePosition.offsetY);
}

String helperNFOffsetToString(NFOffsetStruct val) {
  return "${val.offsetX},${val.offsetY}";
}

NFOffsetStruct calculateSocketPosition(
  NFOffsetStruct nodePosition,
  NFSizeStruct nodeSize,
  int socketIndex,
  bool isInput,
  int socketCount,
) {
  var topLeftY = nodePosition.offsetY - nodeSize.height / 2;
  var socketSize = NFSizeStruct(width: 20, height: 20);
  var socketSpacing = 10;

  var allSocketsHeight =
      socketCount * socketSize.height + (socketCount - 1) * socketSpacing;
  var socketStartPositionY =
      topLeftY + (nodeSize.height - allSocketsHeight) / 2;

  var socketY = socketStartPositionY +
      socketIndex * (socketSize.height + socketSpacing) +
      socketSize.height / 2;

  if (isInput) {
    return NFOffsetStruct(
        offsetX: nodePosition.offsetX - nodeSize.width / 2, offsetY: socketY);
  } else {
    return NFOffsetStruct(
        offsetX: nodePosition.offsetX + nodeSize.width / 2, offsetY: socketY);
  }
}

NFPointStruct convertNFOffsetToNFPoint(NFOffsetStruct offset) {
  return NFPointStruct(positionX: offset.offsetX, positionY: offset.offsetY);
}

NFOffsetStruct convertNFPointToNFOffset(NFPointStruct point) {
  return NFOffsetStruct(offsetX: point.positionX, offsetY: point.positionY);
}

NFPointStruct calculateStartPointFromEdge(
  NodeEdgeStruct edge,
  double screenWidth,
  double screenHeight,
  List<NodeStruct> nodes,
  NFOffsetStruct viewportCenter,
  double zoomFactor,
) {
  var startNode = getNodeFromId(edge.sourceNodeId, nodes);

  var startSocketVirtualPosition = calculateSocketPosition(
      startNode.virtualPosition,
      startNode.size,
      edge.sourceOutputSocketIndex,
      false,
      startNode.outputs.length);

  var startSocketAbsolutePosition = virtualToAbsolute(
      startSocketVirtualPosition,
      viewportCenter,
      zoomFactor,
      NFSizeStruct(width: screenWidth, height: screenHeight));

  return convertNFOffsetToNFPoint(startSocketAbsolutePosition);
}

NFPointStruct calculateEndPointFromEdge(
  NodeEdgeStruct edge,
  double screenWidth,
  double screenHeight,
  List<NodeStruct> nodes,
  NFOffsetStruct viewportCenter,
  double zoomFactor,
) {
  var startNode = getNodeFromId(edge.targetNodeId, nodes);

  var startSocketVirtualPosition = calculateSocketPosition(
      startNode.virtualPosition,
      startNode.size,
      edge.targetInputSocketIndex,
      true,
      startNode.inputs.length);

  var startSocketAbsolutePosition = virtualToAbsolute(
      startSocketVirtualPosition,
      viewportCenter,
      zoomFactor,
      NFSizeStruct(width: screenWidth, height: screenHeight));

  return convertNFOffsetToNFPoint(startSocketAbsolutePosition);
}

NodeStruct getNodeFromId(
  String id,
  List<NodeStruct> nodes,
) {
  for (var node in nodes) {
    if (node.id == id) {
      return node;
    }
  }
  return NodeStruct();
}

String? getSourceNodeIdFromPoint(
  NFPointStruct point,
  List<NodeStruct> nodes,
  NFOffsetStruct viewportCenter,
  double zoomFactor,
  double screenWidth,
  double screenHeight,
) {
  var node = getNodeFromPoint(
      point, nodes, viewportCenter, zoomFactor, screenWidth, screenHeight);
  return node?.id;
}

NodeStruct? getNodeFromPoint(
  NFPointStruct point,
  List<NodeStruct> nodes,
  NFOffsetStruct viewportCenter,
  double zoomFactor,
  double screenWidth,
  double screenHeight,
) {
  for (var index = nodes.length - 1; index >= 0; index--) {
    var node = nodes[index];
    var nodePosition = virtualToAbsolute(node.virtualPosition, viewportCenter,
        zoomFactor, NFSizeStruct(width: screenWidth, height: screenHeight));

    var nodeSize = node.size;
    var nodeWidth = nodeSize.width;
    var nodeHeight = nodeSize.height;

    var nodeTopLeftX = nodePosition.offsetX - nodeWidth / 2;
    var nodeTopLeftY = nodePosition.offsetY - nodeHeight / 2;
    var nodeBottomRightX = nodePosition.offsetX + nodeWidth / 2;
    var nodeBottomRightY = nodePosition.offsetY + nodeHeight / 2;

    if (point.positionX >= nodeTopLeftX &&
        point.positionX <= nodeBottomRightX &&
        point.positionY >= nodeTopLeftY &&
        point.positionY <= nodeBottomRightY) {
      return node;
    }
  }
  return null;
}

int? getSourceOutputIndexFromPoint(
  NFPointStruct point,
  List<NodeStruct> nodes,
  NFOffsetStruct viewportCenter,
  double zoomFactor,
  double screenWidth,
  double screenHeight,
) {
  var node = getNodeFromPoint(
      point, nodes, viewportCenter, zoomFactor, screenWidth, screenHeight);
  if (node != null) {
    for (var index = 0; index < node.outputs.length; index++) {
      var outputSocketPosition = calculateSocketPosition(
          node.virtualPosition, node.size, index, false, node.outputs.length);
      var outputSocketAbsolutePosition = virtualToAbsolute(
          outputSocketPosition,
          viewportCenter,
          zoomFactor,
          NFSizeStruct(width: screenWidth, height: screenHeight));

      var outputSocketAbsolutePositionX = outputSocketAbsolutePosition.offsetX;
      var outputSocketAbsolutePositionY = outputSocketAbsolutePosition.offsetY;

      var distance = math.sqrt(
          math.pow(point.positionX - outputSocketAbsolutePositionX, 2) +
              math.pow(point.positionY - outputSocketAbsolutePositionY, 2));

      var socketDiameter = 20;
      if (distance < socketDiameter) {
        return index;
      }
    }
  }
  return null;
}

String? getTargetNodeIdFromPoint(
  NFPointStruct point,
  List<NodeStruct> nodes,
  NFOffsetStruct viewportCenter,
  double zoomFactor,
  double screenWidth,
  double screenHeight,
) {
  var node = getNodeFromPoint(
      point, nodes, viewportCenter, zoomFactor, screenWidth, screenHeight);
  return node?.id;
}

int? getTargetInputIndexFromPoint(
  NFPointStruct point,
  List<NodeStruct> nodes,
  NFOffsetStruct viewportCenter,
  double zoomFactor,
  double screenWidth,
  double screenHeight,
) {
  var node = getNodeFromPoint(
      point, nodes, viewportCenter, zoomFactor, screenWidth, screenHeight);
  if (node != null) {
    for (var index = 0; index < node.inputs.length; index++) {
      var inputSocketPosition = calculateSocketPosition(
          node.virtualPosition, node.size, index, true, node.inputs.length);
      var inputSocketAbsolutePosition = virtualToAbsolute(
          inputSocketPosition,
          viewportCenter,
          zoomFactor,
          NFSizeStruct(width: screenWidth, height: screenHeight));

      var inputSocketAbsolutePositionX = inputSocketAbsolutePosition.offsetX;
      var inputSocketAbsolutePositionY = inputSocketAbsolutePosition.offsetY;

      var distance = math.sqrt(
          math.pow(point.positionX - inputSocketAbsolutePositionX, 2) +
              math.pow(point.positionY - inputSocketAbsolutePositionY, 2));

      var socketDiameter = 20;
      if (distance < socketDiameter) {
        return index;
      }
    }
  }
  return null;
}

NFOffsetStruct virtualToRelativeMinimized(
  NFOffsetStruct nodePosition,
  NFSizeStruct nodeSize,
  NFOffsetStruct viewportCenter,
  double zoomFactor,
  NFSizeStruct windowSize,
  double minFactor,
) {
  var relativePosition = virtualToRelative(
      nodePosition, nodeSize, viewportCenter, zoomFactor, windowSize);
  relativePosition.offsetX = relativePosition.offsetX * minFactor;
  relativePosition.offsetY = relativePosition.offsetY * minFactor;

  return relativePosition;
}

bool edgesContainsEdge(
  NodeEdgeStruct edge,
  List<NodeEdgeStruct> edges,
) {
  for (var it in edges) {
    if (it == edge) {
      return true;
    }
  }
  return false;
}

List<NodeInputSocketStruct> createNodeInputs(int count) {
  return [];
}

List<NodeOutputSocketStruct> createNodeOutputs(int count) {
  return [];
}
