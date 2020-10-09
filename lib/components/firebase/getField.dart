import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetField extends StatelessWidget {
  final String documentId;
  final String collection;

  GetField({this.documentId, this.collection});

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection(collection);

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Text("Full Name: ${data['firstName']}");
        }

        return Text("loading");
      },
    );
  }

  // not getWidget(collection: "caregiver", documentId: "cindy@gmail.com")
  //
  // call getWidget("caregiver", "cindy@gmail.com"), not the above
  static Widget getWidget(String collection, String documentId) {
    CollectionReference users =
        FirebaseFirestore.instance.collection(collection);

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Text(
            "First Name: ${data['firstName']}",
            style: TextStyle(fontSize: 20),
          );
        }

        return Text("loading");
      },
    );
  }
}
