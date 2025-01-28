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
      title: "Node 1",
      description: "description 1",
      alignmentX: -0.6,
      alignmentY: -0.8,
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
      title: "Node 2",
      description: "description 2",
      alignmentX: 0.0,
      alignmentY: 0.8,
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
      title: "Node 3",
      description: "description 3",
      alignmentX: 0.5,
      alignmentY: 0.5,
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
) {
  double relativeX = 2 * (absolutePosition.offsetX) / (windowSize.width) - 1;
  double relativeY = 2 * (absolutePosition.offsetY) / (windowSize.height) - 1;
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
      absoluteToRelative(absolutePosition, windowSize);
  return NFOffsetStruct(
      offsetX: relativePosition.offsetX, offsetY: relativePosition.offsetY);
}
