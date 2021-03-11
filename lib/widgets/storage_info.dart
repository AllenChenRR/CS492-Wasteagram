// import 'package:flutter/material.dart';

//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             body: StreamBuilder(
//                 builder: (content, snapshot) {
//                   if (snapshot.hasData) {
//                     return ListView.builder(
//                         itemCount: snapshot.data.documents.length,
//                         itemBuilder: (context, index) {
//                           var post = snapshot.data.documents[index];
//                           return ListTile(
//                               leading: Text(
//                                 post['weight'].toString(),
//                                 textDirection: TextDirection.ltr,
//                               ),
//                               title: Text('Post Title'));
//                         });
//                   } else {
//                     return Center(child: CircularProgressIndicator());
//                   }
//                 },
//                 stream: FirebaseFirestore.instance
//                     .collection('posts')
//                     .snapshots())));
//   }
// }
