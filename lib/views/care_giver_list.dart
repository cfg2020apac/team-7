import 'package:flutter/material.dart';
import 'package:team7_app/components/buttons.dart';
// import 'package:team7_app/components/careGiverCard.dart';

class CareGiverList extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[600],
        body: Center(
            child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              SizedBox(height: 70),
              Row(
                children: <Widget>[
                  Button.getProfileButton(context),
                  SizedBox(width: 10),
                  Text("All Clients",
                      style: TextStyle(
                        fontSize: 40,
                        decoration: TextDecoration.underline,
                      )),
                ],
              ),
              // care giver card
            ]),
          ),
        )));
  }
}
