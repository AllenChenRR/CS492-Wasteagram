import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/components.dart';
import 'package:wasteagram/models.dart';
import 'package:wasteagram/screens.dart';
import 'package:wasteagram/widgets.dart';

class ListStream extends StatefulWidget {
  ListStream({Key key}) : super(key: key);
  @override
  ListStreamState createState() => ListStreamState();
}

class ListStreamState extends State<ListStream> {
  int count;
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int count;
    ListScreenState listScreenState =
        context.findAncestorStateOfType<ListScreenState>();
    return StreamBuilder(
        builder: (content, snapshot) {
          if (snapshot.hasData &&
              !snapshot.data.documents.isEmpty &&
              snapshot.data.documents != null) {
            count = 0;
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  var post = snapshot.data.documents[index];
                  count += post['quantity'];
                  if (index == snapshot.data.documents.length - 1) {
                    // TODO: FIX ME FOR EC
                    //listScreenState.updateCount(count);
                  }
                  return Semantics(
                    child: ListTile(
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
                    ),
                    onLongPressHint: 'Tapping entry will display more details',
                  );
                });
          } else {
            return Center(child: customProgressIndicator());
          }
        },
        stream: FirebaseFirestore.instance.collection('posts').snapshots());
  }
}
