import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/screens.dart';

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();

  App({Key key}) : super(key: key);
}

class AppState extends State<App> {
  final String title = 'Wasteagram';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(brightness: Brightness.dark),
        home: ListScreen());
  }
}
