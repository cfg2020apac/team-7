

import 'package:flutter/material.dart';

class Button {

  static getChoiceButton(
      context, double widthBtn, String text, Object o) {
    return Container(
        child: RaisedButton(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.white)),
      padding: EdgeInsets.fromLTRB(widthBtn, 20, widthBtn, 20),
      textColor: Colors.white,
      color: Colors.blue[600],
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => o),
        );
      },
      child: Column(children: <Widget>[
        Text(text, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
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
}
