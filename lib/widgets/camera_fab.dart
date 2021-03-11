import 'package:flutter/material.dart';
import 'package:wasteagram/components.dart';

FloatingActionButton cameraFab(BuildContext context) {
  return FloatingActionButton(
      onPressed: () {
        pushCamera(context);
      },
      child: Icon(Icons.camera_alt));
}
