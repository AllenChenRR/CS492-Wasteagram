import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:path/path.dart' as Path;
import 'package:wasteagram/models.dart';
import 'package:wasteagram/widgets.dart';

class NewPostScreen extends StatefulWidget {
  final File file;
  final FirebaseFirestore firestore;
  const NewPostScreen({Key key, this.file, this.firestore}) : super(key: key);

  @override
  NewPostScreenState createState() => NewPostScreenState();
}

class NewPostScreenState extends State<NewPostScreen> {
  final title = 'New Post';
  Image image;
  LocationData locationData;
  FoodWastePost wastePost;

  final formKey = GlobalKey<FormState>();
  void initState() {
    super.initState();
    retrieveLocation();
  }

  @override
  Widget build(BuildContext context) {
    if (locationData == null) {
      return Center(child: customProgressIndicator());
    }
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(centerTitle: true, title: Text(title)),
        body: Column(children: [
          Flexible(
              child: Form(
                  key: formKey,
                  child: Column(children: [
                    flexibleImage(),
                    postFormField(),
                  ]))),
          Semantics(
            child: saveButton(formKey, context),
            onTapHint: 'Uploads post',
            button: true,
          )
        ]));
  }

  Flexible postFormField() {
    return Flexible(
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Semantics(
              child: TextFormField(
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
                decoration:
                    const InputDecoration(hintText: 'Number of Wasted Items'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a value';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  wastePost = FoodWastePost(
                    date: DateTime.now(),
                    quantity: int.parse(value),
                    latitude: locationData.latitude,
                    longitude: locationData.longitude,
                  );
                },
              ),
              textField: true,
              onLongPressHint: 'Enter text into this field',
            )));
  }

  Flexible flexibleImage() {
    return Flexible(
        child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: FractionallySizedBox(
                heightFactor: 0.7,
                widthFactor: 1,
                child:
                    Semantics(child: Image.file(widget.file), image: true))));
  }

  Align saveButton(GlobalKey<FormState> formKey, BuildContext context) {
    return Align(
        alignment: Alignment(0, 1),
        child: FractionallySizedBox(
            widthFactor: 1,
            child: ButtonTheme.fromButtonThemeData(
                data: ButtonThemeData(),
                child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        StorageReference storageReference = FirebaseStorage
                            .instance
                            .ref()
                            .child(Path.basename(DateTime.now()
                                .millisecondsSinceEpoch
                                .toString()));
                        StorageUploadTask uploadTask =
                            storageReference.putFile(widget.file);
                        await uploadTask.onComplete;
                        final url = await storageReference.getDownloadURL();
                        wastePost.path = url;
                        widget.firestore
                            .collection('posts')
                            .add(wastePost.mappedValues);
                        Navigator.of(context).pop();
                      }
                    },
                    child: Icon(Icons.cloud_upload_outlined, size: 60)))));
  }

  void retrieveLocation() async {
    var locationService = Location();
    locationData = await locationService.getLocation();
    setState(() {});
  }
}
