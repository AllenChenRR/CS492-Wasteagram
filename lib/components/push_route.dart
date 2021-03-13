import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wasteagram/models/food_waste_post.dart';
import 'package:wasteagram/screens.dart';
import 'package:wasteagram/screens/detailed_post.dart';

// void pushCamera(BuildContext context) {
//   Navigator.of(context)
//       .push(MaterialPageRoute(builder: (context) => CameraScreen()));
// }

void pushNewPostScreen(
    BuildContext context, File file, FirebaseFirestore firestore) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => NewPostScreen(file: file, firestore: firestore)));
}

void pushListScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => ListScreen()));
}

void pushDetailedPostScreen(BuildContext context, FoodWastePost wastePost) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DetailedPostScreen(post: wastePost)));
}
