import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/components.dart';

StreamBuilder listStream(BuildContext context) {
  return StreamBuilder(
      builder: (content, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                var post = snapshot.data.documents[index];
                return ListTile(
                    trailing: Text(post['count'].toString(),
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 25)),
                    title: Text(convertToDate(post['submission_date'])));
              });
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
      stream: FirebaseFirestore.instance.collection('posts').snapshots());
}
