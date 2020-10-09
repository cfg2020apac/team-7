import 'package:flutter/material.dart';
import 'package:team7_app/components/buttons.dart';
import 'package:team7_app/components/clientCard.dart';

class ClientList extends StatelessWidget {
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

              SizedBox(height: 10),
              ClientCard.getClientCard(context, "Client 1", "1"),
              SizedBox(height: 10),
              ClientCard.getClientCard(context, "Client 2", "2"),
              SizedBox(height: 10),
              ClientCard.getClientCard(context, "Client 3", "3"),
              SizedBox(height: 10),
              ClientCard.getClientCard(context, "Client 4", "4"),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(width: 5),
                  Button.getAddCaseButton(context),
                ],
              )
              // Button.getAddCaseButton(context)
            ]),
          ),
        )));
  }
}
