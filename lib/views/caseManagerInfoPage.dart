import 'package:flutter/material.dart';
import 'package:team7_app/components/buttons.dart';
import 'package:team7_app/views/ResolvedCase.dart';

class CaseManagerInfoPage extends StatefulWidget {
  State createState() => CaseManagerClientInfoPage();
}

class CaseManagerClientInfoPage
    extends State<CaseManagerInfoPage> {
  final formKey = GlobalKey<FormState>();


  Widget build(BuildContext context) {
    // var sessions = _getSessionHistory();
    return Scaffold(
        backgroundColor: Colors.blue[600],
        body: Center(
            // onTap: () {
            //   FocusScope.of(context).requestFocus(new FocusNode());
            // },
            child: Container(
                child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView(children: <Widget>[
                      Column(
                        children: [
                          SizedBox(
                            height: 0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: [
                                    SizedBox(
                                      height:130,
                                    ),
                                    Text('User Profile',
                                              style: new TextStyle(
                                                decoration: TextDecoration.underline,
                                                  fontSize: 40,
                                                  color: Colors.white)),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    CircleAvatar(
                                      radius: 100,
                                      backgroundImage: NetworkImage(
                                          'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Row(
                                        children: [
                                          Text("Name: ",
                                              style: new TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold)),
                                          Text("Divyesh Mundhra",
                                              style: new TextStyle(
                                                  fontSize: 25,
                                                 color: Colors.white)),
                                          SizedBox(
                                            height: 30,
                                          )
                                        ],
                                      ),
                                    Column(children: <Widget>[
                                      Row(
                                        children: [
                                          Text("Gender: ",
                                              style: new TextStyle(
                                                  fontSize: 25,
                                                 color: Colors.white,
                                                  fontWeight: FontWeight.bold)),
                                          Text("Male",
                                              style: new TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.white)),
                                          SizedBox(
                                            height: 30,
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Date of Birth: ",
                                              style: new TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold)),
                                          Text("10/10/1997",
                                              style: new TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.white)),
                                          SizedBox(
                                            height: 30,
                                          )
                                        ],
                                      ),
                                       Row(
                                        children: [
                                          Text("Number of cases at present: ",
                                              style: new TextStyle(
                                                  fontSize: 23,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold)),
                                          Text("17",
                                              style: new TextStyle(
                                                  fontSize: 23,
                                                  color: Colors.white)),
                                          SizedBox(
                                            height: 30,
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Button.getChoiceButton(
                                        context, 20, "Cases Resolved", ResolvedCasesPage())
                                      ]),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ])))));
  }
}
