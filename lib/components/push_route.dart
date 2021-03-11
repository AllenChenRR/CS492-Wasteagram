import 'package:flutter/material.dart';
import 'package:wasteagram/screens.dart';

void pushCamera(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => CameraScreen()));
}

// void pushPhoto(BuildContext context) {
//   Navigator.of(context)
//       .push(MaterialPageRoute(builder: (context) => PhotoScreen()));
// }

void pushListScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => ListScreen()));
}
