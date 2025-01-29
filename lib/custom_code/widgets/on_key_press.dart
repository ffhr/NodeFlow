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

import 'package:flutter/services.dart';

import 'index.dart'; // Imports other custom widgets

class OnKeyPress extends StatefulWidget {
  const OnKeyPress({
    super.key,
    this.width,
    this.height,
    this.onKeyPressedL,
    this.onKeyPressedH,
  });

  final double? width;
  final double? height;
  final Future Function()? onKeyPressedL;
  final Future Function()? onKeyPressedH;

  @override
  State<OnKeyPress> createState() => _OnKeyPressState();
}

class _OnKeyPressState extends State<OnKeyPress> {
  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: FocusNode(),
      onKeyEvent: (KeyEvent event) {
        if (event is KeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.keyL) {
            // Trigger your desired action here
            print('L key pressed!');
            widget.onKeyPressedL?.call();
          } else if (event.logicalKey == LogicalKeyboardKey.keyH) {
            print('H key pressed');
            widget.onKeyPressedH?.call();
          }
        }
      },
      child: Container(),
    );
  }
}
