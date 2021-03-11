import 'package:flutter/material.dart';
import 'package:wasteagram/widgets.dart';
//import 'package:wasteagram/screens.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key key}) : super(key: key);

  @override
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {
  final title = 'Wasteagram';

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // TODO: Need to make title include the number of wasted items
        appBar: AppBar(centerTitle: true, title: Text(title)),
        body: Column(children: [
          Flexible(child: listStream(context)),
          Flexible(
              child: Align(
                  alignment: Alignment.bottomCenter, child: cameraFab(context)))
        ]));
  }
}
