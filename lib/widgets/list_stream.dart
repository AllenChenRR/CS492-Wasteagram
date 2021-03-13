import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/components.dart';
import 'package:wasteagram/models.dart';
import 'package:wasteagram/widgets.dart';

StreamBuilder listStream(BuildContext context) {
  return StreamBuilder(
      builder: (content, snapshot) {
        if (snapshot.hasData &&
            !snapshot.data.documents.isEmpty &&
            snapshot.data.documents != null) {
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                var post = snapshot.data.documents[index];
                return ListTile(
                  trailing: Text(post['quantity'].toString(),
                      textDirection: TextDirection.ltr,
                      style: TextStyle(fontSize: 25)),
                  title: Text(convertToDate(post['date'])),
                  onTap: () {
                    var wastePost = FoodWastePost(
                        date: post['date'].toDate(),
                        quantity: post['quantity'],
                        url: post['url'],
                        latitude: post['location'].latitude,
                        longitude: post['location'].longitude);
                    pushDetailedPostScreen(context, wastePost);
                  },
                );
              });
        } else {
          return Center(child: customProgressIndicator());
        }
      },
      stream: FirebaseFirestore.instance.collection('posts').snapshots());
}
