import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:team7_app/components/buttons.dart';
import 'package:team7_app/components/clientCard.dart';
// import 'package:team7_app/views/firebasetry.dart';

class ResolvedCasesPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                SizedBox(height: 70),
                Row(
                  children: <Widget>[
                    SizedBox(width: 10),
                    Button.getProfileButton(context),
                    SizedBox(width: 10),
                    Text("All Clients",
                        style: TextStyle(
                          fontSize: 40,
                          decoration: TextDecoration.underline,
                          color: Colors.blue[600]
                        )),
                  ],
                ),
                // Container(child: LoadDataFromFirestore()),
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
          ),
        ));
  }
}
