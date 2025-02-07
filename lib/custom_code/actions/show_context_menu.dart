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
) async {
  // Add your function code here!
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;
  showMenu(
    context: context,
    position: RelativeRect.fromRect(
      Offset(tapPoint.positionX, tapPoint.positionY) &
          const Size(40, 40), // smaller rect, the touch area
      Offset.zero & overlay.size, // Bigger rect, the entire screen
    ),
    items: [
      PopupMenuItem(
        child: Text('Option 1'),
        value: 1,
      ),
      PopupMenuItem(
        child: Text('Option 2'),
        value: 2,
      ),
    ],
  ).then((value) {
    if (value != null) {
      _onContextMenuItemSelected(context, value);
    }
  });
}

void _onContextMenuItemSelected(BuildContext context, int value) {
  if (value == 1) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Option 1 selected')),
    );
  } else if (value == 2) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Option 2 selected')),
    );
  }
}
