// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';


// final databaseReference = FirebaseFirestore.instance;

// void createRecord() async {
//   await databaseReference.collection("books")
//       .docs("1")
//       .setData({
//         'title': 'Mastering Flutter',
//         'description': 'Programming Guide for Dart'
//       });

//   DocumentReference ref = await databaseReference.collection("books")
//       .add({
//         'title': 'Flutter in Action',
//         'description': 'Complete Programming Guide to learn Flutter'
//       });
//   print(ref.documentID);
// }