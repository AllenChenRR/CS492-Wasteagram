import 'package:flutter/material.dart';
import 'package:wasteagram/components.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key key}) : super(key: key);
  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  final title = 'Wasteagram';

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: BackButton(
              onPressed: () {
                pushListScreen(context);
              },
            ),
            centerTitle: true,
            title: Text(title)));
  }
}
