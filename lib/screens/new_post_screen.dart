import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:wasteagram/models.dart';
import 'package:wasteagram/widgets.dart';

class PostEntry {
  DateTime date;
  String url;
  double longitude;
  double latitude;
  int quantity;
  String toString() {
    return 'date: $date, url: $url, long: $longitude lat: $latitude, quant: $quantity';
  }
}

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
  final post = PostEntry();
  FoodWastePost wastePost;

  final formKey = GlobalKey<FormState>();
  void initState() {
    super.initState();
    retrieveLocation();
  }

  @override
  Widget build(BuildContext context) {
    print('newpost screen: ${widget.file.toString()}');
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
          saveButton(formKey, context)
        ]));
  }

  Flexible postFormField() {
    return Flexible(
        child: Padding(
            padding: const EdgeInsets.all(8),
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
                    url: widget.file.toString());
              },
            )));
  }

  Flexible flexibleImage() {
    return Flexible(
        child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: FractionallySizedBox(
                heightFactor: 0.7,
                widthFactor: 1,
                child: Image.file(widget.file))));
  }

  Widget uploadContainer(GlobalKey<FormState> formKey, BuildContext context) {
    return Align(
        //alignment: Alignment(0, 0.9),
        child: Container(
            width: double.infinity,
            height: 50,
            color: Colors.blue,
            child: GestureDetector(
                onTap: () {
                  if (formKey.currentState.validate()) {
                    formKey.currentState.save();
                    // Upload content to firestore
                    Navigator.of(context).pop();
                  }
                },
                child: Icon(Icons.cloud_upload_outlined, size: 50))));
  }

  Align saveButton(GlobalKey<FormState> formKey, BuildContext context) {
    return Align(
        alignment: Alignment(0, 1),
        child: FractionallySizedBox(
            widthFactor: 1,
            child: ButtonTheme.fromButtonThemeData(
                data: ButtonThemeData(),
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
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
