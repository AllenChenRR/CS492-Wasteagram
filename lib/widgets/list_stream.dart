import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/components.dart';

StreamBuilder listStream(BuildContext context) {
  return StreamBuilder(
      builder: (content, snapshot) {
        if (!snapshot.data.documents.isEmpty) {
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                var post = snapshot.data.documents[index];
                return ListTile(
                    trailing: Text(post['count'].toString(),
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 25)),
                    title: Text(convertToDate(post['date'])));
              });
        } else {
          return Center(
              child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation(Colors.red)));
        }
      },
      stream: FirebaseFirestore.instance.collection('posts').snapshots());
}
