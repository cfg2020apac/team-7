import 'package:flutter/material.dart';
import 'package:team7_app/views/addClient.dart';
import 'package:team7_app/views/caseManagerInfoPage.dart';
import 'package:team7_app/views/clientList.dart';
// import 'package:team7_app/views/welcome_screen.dart';

class Button {
  static getChoiceButton(context, double widthBtn, String text, Object o) {
    return Container(
        child: RaisedButton(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.white)),
      padding: EdgeInsets.fromLTRB(widthBtn, 10, widthBtn, 10),
      textColor: Colors.white,
      color: Colors.blue[600],
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => o),
        );
      },
      child: Column(children: <Widget>[
        Text(text, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
      ]),
    ));
  }

  static getRaisedButton(context, double widthBtn, String text, Object o) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.white)),
      padding: EdgeInsets.fromLTRB(widthBtn, 10, widthBtn, 10),
      textColor: Colors.white,
      color: Colors.blue[400],
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => o),
        );
      },
      child: Column(children: <Widget>[
        Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
      ]),
    );
  }

  static getAddCaseButton(context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
      width: 70,
      height: 70,
      child: FloatingActionButton(
          shape: CircleBorder(side: BorderSide(color: Colors.white)),
          child: Icon(
            Icons.add,
            size: 50,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddClientForm()),
            );
          }),
    );
  }

  static getProfileButton(context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
      width: 70,
      height: 70,
      child: FloatingActionButton(
          heroTag: null,
          shape: CircleBorder(side: BorderSide(color: Colors.white)),
          child: Icon(
            Icons.supervisor_account,
            size: 50,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CaseManagerInfoPage()),
            );
          }),
    );
  }
}
