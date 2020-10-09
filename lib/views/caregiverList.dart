import 'package:flutter/material.dart';
import 'package:team7_app/components/caregiverCard.dart';

class CaregiverList extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Client Details",
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
              SizedBox(height: 30),
              Row(
                children: <Widget>[
                  SizedBox(width: 10),
                  Icon(
                    Icons.supervised_user_circle,
                    size: 50,
                    color: Colors.blue[600],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Row(
                        children: <Widget>[
                          SizedBox(width: 10),
                          Text("Client Name: Client",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.blue[600])),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Client Gender: Male",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.blue[600])),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Client Age: 45",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.blue[600])),
                        ],
                      )
                    ],
                  )
                ],
              ),
              // care giver card
              SizedBox(height: 10),
              Text("Caregivers Assigned: ",
                  style: TextStyle(fontSize: 30, color: Colors.black)),
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
