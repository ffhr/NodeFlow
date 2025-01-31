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
  NFSizeStruct nodeSize,
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
  NFOffsetStruct absolutePosition = virtualToAbsolute(
      nodePosition, nodeSize, viewportCenter, zoomFactor, windowSize);
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

NFPointStruct calculateStartPointFromEdge(NodeEdgeStruct? edge) {
  return NFPointStruct();
}

NFPointStruct? calculateEndPointFromEdge(NodeEdgeStruct edge) {
  return NFPointStruct();
}
