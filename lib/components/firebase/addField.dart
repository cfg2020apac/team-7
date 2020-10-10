import 'package:cloud_firestore/cloud_firestore.dart';

class AddField {
  // random documentid
  static addField() {
    FirebaseFirestore.instance.collection("caregiver").add({"name": "test"});
  }

  // specific documentid
  static setField() {
    FirebaseFirestore.instance
        .collection("caregiver")
        .doc("getthatham@gmail.com")
        .set({"name": "ham"});
  }
}
