import 'package:flutter/material.dart';
import 'package:team7_app/components/buttons.dart';
import 'package:team7_app/components/caregiverCard.dart';

class CaregiverList extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
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
                  Column(
                    children: [
                      Row(
                        children: <Widget>[
                          Text("Client Name: Client",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue[400],
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Client Gender: Male",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue[400],
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Client Age: 45",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue[400],
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      )
                    ],
                  )
                ],
              ),
              // care giver card
              SizedBox(height: 10),
              CaregiverCard("1"),
              SizedBox(height: 10),
              CaregiverCard("2"),
              SizedBox(height: 10),
              CaregiverCard("3"),
              Row()
            ]),
          ),
        )));
  }
}
