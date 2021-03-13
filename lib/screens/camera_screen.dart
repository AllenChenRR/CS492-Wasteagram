// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:wasteagram/components.dart';
// import 'package:wasteagram/screens.dart';

// class CameraScreen extends StatefulWidget {
//   const CameraScreen({Key key}) : super(key: key);
//   @override
//   CameraScreenState createState() => CameraScreenState();
// }

// class CameraScreenState extends State<CameraScreen> {
//   final title = 'Wasteagram';

//   void initState() {
//     super.initState();
//   }

//   File image;
//   final picker = ImagePicker();
//   void getImage() async {
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);
//     image = File(pickedFile.path);
//     // setState(() {});
//     pushNewPostScreen(context, image );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           leading: BackButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           centerTitle: true,
//           title: Text(title)),
//       body: Center(
//           child: ElevatedButton(
//         child: Text('Select photo'),
//         onPressed: () {
//           getImage();
//         },
//       )),
//     );
//   }
// }
