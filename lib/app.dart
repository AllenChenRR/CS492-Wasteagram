import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: StreamBuilder(
                builder: (content, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          var post = snapshot.data.documents[index];
                          return ListTile(
                              leading: Text(
                                post['weight'].toString(),
                                textDirection: TextDirection.ltr,
                              ),
                              title: Text('Post Title'));
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
                stream: FirebaseFirestore.instance
                    .collection('posts')
                    .snapshots())));
  }
}
