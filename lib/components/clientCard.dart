import 'package:flutter/material.dart';
import 'package:team7_app/components/buttons.dart';
import 'package:team7_app/components/firebase/getField.dart';
import 'package:team7_app/views/caregiverList.dart';
import 'package:team7_app/views/clientList.dart';

class ClientCard {
  static getClientCard(context, String clientname, String clientid, String text,
      String collection, String document) {
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
        onPressed: () {},
        child: Container(
          // decoration: BoxDecoration(
          // border: Border(bottom: BorderSide(color: Colors.grey[100]),top: BorderSide(color: Colors.grey[100]),left: BorderSide(color: Colors.grey[100]),right: BorderSide(color: Colors.grey[100]))),
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          height: 160,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.supervised_user_circle,
                    size: 50,
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: GetField.getWidget(collection, document),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              child: Text(' User ID: ' + clientid,
                                  style: TextStyle(fontSize: 20)))),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Button.getChoiceButton(
                  context, 10, text, CaregiverList()),
            ],
          ),
        ),
      ),
    );
  }

  static getClientSchedule(context, String clientname, String date, callback) {
    print("context");
    print(context);
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
        onPressed: () {},
        child: Container(
          // decoration: BoxDecoration(
          // border: Border(bottom: BorderSide(color: Colors.grey[100]),top: BorderSide(color: Colors.grey[100]),left: BorderSide(color: Colors.grey[100]),right: BorderSide(color: Colors.grey[100]))),
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          height: 160,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.supervised_user_circle,
                    size: 50,
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              child: Text('Name: ' + clientname,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20)))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              child: Text('Date: ' + date,
                                  style: TextStyle(fontSize: 20)))),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Button.getChoiceButton(
                  context, 10, "View Meeting Details", callback),
            ],
          ),
        ),
      ),
    );
  }
}
