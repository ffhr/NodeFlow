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

List<NodeStruct> initNodes() {
  var item1 = NodeStruct(
      title: "Node 1",
      description: "description 1",
      alignmentX: -0.6,
      alignmentY: -0.8);

  var item2 = NodeStruct(
      title: "Node 2",
      description: "description 2",
      alignmentX: 0.0,
      alignmentY: 0.8);

  var item3 = NodeStruct(
      title: "Node 3",
      description: "description 3",
      alignmentX: 0.5,
      alignmentY: 0.5);

  return [item1, item2, item3];
}
