import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wasteagram/models.dart';

class DetailedPostScreen extends StatefulWidget {
  final FoodWastePost post;
  @override
  DetailedPostScreenState createState() => DetailedPostScreenState();
  const DetailedPostScreen({Key key, @required this.post}) : super(key: key);
}

class DetailedPostScreenState extends State<DetailedPostScreen> {
  final title = 'Wasteagram';
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text(title)),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Align(
                    child: Text(widget.post.weekdayDate,
                        style: TextStyle(fontSize: 25))),
              ),
              flexibleImage(),
              Text('${widget.post.count.toString()} items',
                  style: TextStyle(fontSize: 30)),
              Text(
                  'Location:( ${widget.post.locationLatitude.toString()}, ${widget.post.locationLongitude})')
            ]));
  }

  Flexible flexibleImage() {
    return Flexible(
        child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: FractionallySizedBox(
                heightFactor: 0.5,
                widthFactor: 1,
                child: Semantics(child: Image.network(widget.post.url)))));
  }
}
