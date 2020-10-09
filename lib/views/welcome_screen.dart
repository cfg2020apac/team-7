import 'package:flutter/material.dart';
import 'package:team7_app/components/buttons.dart';
import 'package:team7_app/components/caregiverCard.dart';
import 'package:team7_app/views/CaseManagerClientInfoPage.dart';
import 'package:team7_app/views/caregivers/ClientInfoPage.dart';
import 'package:team7_app/views/caregivers/ClientList.dart';
import 'package:team7_app/views/caregivers/ClientSessionPage.dart';
import 'package:team7_app/views/login.dart';

import 'clientList.dart';

class WelcomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[600],
        body: Center(
            child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              Container(
                height: 600,
                child: Column(
                  children: <Widget>[
                    Text(
                      'This is Home Screen',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 30),
                    Button.getChoiceButton(
                        context, 70, "Go to Login Screen", LoginForm()),
                    // context, 70, "Go to Login Screen", DisplayForm()),
                    SizedBox(height: 30),
                    Button.getChoiceButton(
                        context,
                        70,
                        "Care Giver Client Session Page",
                        CareGiverClientSessionPage()),
                    CaregiverCard("123"),
                    SizedBox(height: 30),
                    Button.getChoiceButton(context, 70, "Client List Page",
                        CareGiverClientListPage()),
                    Button.getChoiceButton(
                        context, 70, "Case List Page", ClientList()),
                    Button.getChoiceButton(context, 70,
                        "Client Info Session Page", ClientInfoSessionPage()),
                    Button.getChoiceButton(
                        context,
                        70,
                        "Case Manager Client Info Session Page",
                        CaseManagerClientInfoSessionPage()),
                  ],
                ),
              ),
            ]),
          ),
        )));
  }
}
