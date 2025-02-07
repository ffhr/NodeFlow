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

Future showContextMenu(
  BuildContext context,
  NFPointStruct tapPoint,
  Future Function()? onTapOption1,
) async {
  // Add your function code here!
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;

  var value = await showMenu(
      context: context,
      position: RelativeRect.fromRect(
        Offset(tapPoint.positionX, tapPoint.positionY) &
            const Size(40, 40), // smaller rect, the touch area
        Offset.zero & overlay.size, // Bigger rect, the entire screen
      ),
      items: [
        const PopupMenuItem(
          child: Text('Add node'),
          value: 1,
        ),
      ]);
  if (value != null) {
    if (value == 1) {
      onTapOption1?.call();
    }
  }
}
