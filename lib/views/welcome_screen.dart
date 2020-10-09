import 'package:flutter/material.dart';
import 'package:team7_app/components/buttons.dart';
import 'package:team7_app/views/login.dart';

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
                height: 340,
                child: Column(
                  children: <Widget>[
                    Text(
                      'This is Home Screen',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 30),
                    Button.getChoiceButton(
                        context, 70, "Go to Login Screen", LoginForm()),
                  ],
                ),
              ),
            ]),
          ),
        )));
  }
}
