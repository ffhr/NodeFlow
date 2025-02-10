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

class NFZoomableStack extends StatefulWidget {
  const NFZoomableStack({
    super.key,
    this.width,
    this.height,
    this.stackComponent,
  });

  final double? width;
  final double? height;
  final Widget Function()? stackComponent;

  @override
  State<NFZoomableStack> createState() => _NFZoomableStackState();
}

class _NFZoomableStackState extends State<NFZoomableStack> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
