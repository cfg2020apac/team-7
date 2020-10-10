import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:team7_app/components/buttons.dart';
import 'package:team7_app/components/clientCard.dart';
import 'package:team7_app/components/firebase/getField.dart';
// import 'package:team7_app/views/firebasetry.dart';

class ClientList extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: AppBar(
            title: Text("Client List",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold)),
            backgroundColor: Colors.blue[600],
            brightness: Brightness.light,
            elevation: 0,
            bottom: PreferredSize(
                child: Container(
                  color: Colors.blue[600],
                  height: 4.0,
                ),
                preferredSize: Size.fromHeight(4.0))),
        backgroundColor: Colors.white,
        body: Center(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    SizedBox(width: 50),
                    Button.getProfileButton(context),
                    SizedBox(width: 10),
                    Text("My Clients",
                        style: TextStyle(
                            fontSize: 40,
                            decoration: TextDecoration.underline,
                            color: Colors.blue[600])),
                  ],
                ),
                // GetField.getWidget("caregiver", "cindy@gmail.com", ),
                SizedBox(height: 10),
                ClientCard.getClientCard(
                  context,
                  "Client 1",
                  "1",
                  "View Details",
                  "client",
                  "CWxLDCJ2SFk4VOzRD8Jn",
                ),
                SizedBox(height: 10),
                ClientCard.getClientCard(
                  context,
                  "Client 2",
                  "2",
                  "View Details",
                  "client",
                  "rBnPVLtVT6qivzHs6Mo7",
                ),
                SizedBox(height: 10),
                ClientCard.getClientCard(
                  context,
                  "Client 3",
                  "3",
                  "View Details",
                  "client",
                  "QDB1eCqSKrLyuUwzTqb2",
                ),
                SizedBox(height: 10),
                ClientCard.getClientCard(
                  context,
                  "Client 4",
                  "4",
                  "View Details",
                  "client",
                  "jsMMOclCCnVimctYQz4L",
                ),
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
