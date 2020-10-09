import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddField {
  // random documentid
  static addField() {
    FirebaseFirestore.instance.collection("caregiver").add({"name": "test"});
  }

  static setField() {
    FirebaseFirestore.instance
        .collection("caregiver")
        .doc("getthatham@gmail.com")
        .set({"name": "ham"});
  }
}
