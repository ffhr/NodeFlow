// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<NodeStruct>> sortByIsSelected(List<NodeStruct> nodes) async {
  // Add your function code here!
  nodes.sort((a, b) {
    if (a.isSelected && !b.isSelected) {
      return 1;
    } else if (!a.isSelected && b.isSelected) {
      return -1;
    } else {
      return 0;
    }
  });
  return nodes;
}
