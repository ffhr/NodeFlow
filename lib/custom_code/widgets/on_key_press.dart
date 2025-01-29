// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class OnKeyPress extends StatefulWidget {
  const OnKeyPress({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<OnKeyPress> createState() => _OnKeyPressState();
}

class _OnKeyPressState extends State<OnKeyPress> {
  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (event) {
        if (event is RawKeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.keyL) {
          // Trigger your desired action here
          print('L key pressed!');
        }
        if (event is RawKeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.keyH) {
          print('H key pressed');
        }
      },
      child: Container(),
    );
  }
}
