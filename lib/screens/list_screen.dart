import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wasteagram/components.dart';
import 'package:wasteagram/widgets.dart';

class ListScreen extends StatefulWidget {
  final FirebaseFirestore firestore;
  const ListScreen({Key key, this.firestore}) : super(key: key);

  @override
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {
  final title = 'Wasteagram';
  int count;
  void initState() {
    super.initState();
    count = 0;
  }

  File image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text(title)),
        body: Column(children: [
          Flexible(child: ListStream()),
          Flexible(
              child: Align(
                  alignment: Alignment(0, 0.9),
                  child: Semantics(
                    child: cameraFab(context, image),
                    button: true,
                    onTapHint: 'Select an image from the image gallery',
                  )))
        ]));
  }

  FloatingActionButton cameraFab(BuildContext context, File image) {
    return FloatingActionButton(
        onPressed: () {
          getImage();
        },
        child: Icon(Icons.camera_alt));
  }

  void getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    image = File(pickedFile.path);
    setState(() {});
    pushNewPostScreen(context, image, widget.firestore);
  }

  void updateCount(int newCount) {
    setState(() {
      count = newCount;
    });
  }
}
