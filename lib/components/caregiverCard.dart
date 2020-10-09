import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team7_app/components/firebase/getField.dart';
import 'package:team7_app/views/CaseManagerClientInfoPage.dart';

class CaregiverCard extends StatelessWidget {
  final String clientID_caregiverID;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CaregiverCard(this.clientID_caregiverID);

  @override
  Widget build(context) {
    // retrieve data from database using above id

    String name = "test";
    String field = "field";
    String status = "status";

    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: RaisedButton(
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.white)),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        textColor: Colors.white,
        color: Colors.blue[600],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CaseManagerClientInfoSessionPage()),
          );
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
          height: 80,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.supervised_user_circle,
                    size: 50,
                  ),
                  SizedBox(width: 30),
                  // Column(
                  // children: <Widget>[
                  //   Align(
                  //       alignment: Alignment.centerLeft,
                  //       child: Container(
                  //           child: Text('Name: ' + name,
                  //               textAlign: TextAlign.left,
                  //               style: TextStyle(fontSize: 20)))),
                  //   Align(
                  //       alignment: Alignment.centerLeft,
                  //       child: Container(
                  //           child: Text('Field: ' + field,
                  //               style: TextStyle(fontSize: 20)))),
                  //   Align(
                  //       alignment: Alignment.centerLeft,
                  //       child: Container(
                  //           child: Text('Status: ' + status,
                  //               style: TextStyle(fontSize: 20)))),
                  // ],
                  // ),
                  // Container(
                  //     child:
                  //         GetField.getWidget("caregiver", "cindy@gmail.com")),
                  GetField(
                      collection: "caregiver", documentId: "cindy@gmail.com"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
