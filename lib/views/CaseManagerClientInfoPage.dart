import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class CaseManagerClientInfoSessionPage extends StatefulWidget {
  State createState() => CaseManagerClientInfoPage();
}

class CaseManagerClientInfoPage
    extends State<CaseManagerClientInfoSessionPage> {
  final formKey = GlobalKey<FormState>();

  String _firstName = 'First';
  String _lastName = 'Last';
  String _date = DateFormat('yMd').format(new DateTime.now());

  List<Session> _getSessionHistory() {
    List<Session> sessions = [];
    Session session1 = new Session('Session 1', 'Completed');
    Session session2 = new Session('Session 2', 'New');
    sessions.add(session1);
    sessions.add(session2);
    print(sessions);
    print(session1);
    return sessions;
  }

  Widget build(BuildContext context) {
    var sessions = _getSessionHistory();
    return Scaffold(
        backgroundColor: Colors.grey[50],
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
                child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView(children: <Widget>[
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                    ),
                                    CircleAvatar(
                                      radius: 100,
                                      backgroundImage: NetworkImage(
                                          'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                        children: <Widget>[
                                          Text('$_firstName',
                                              style: new TextStyle(
                                                  fontSize: 40,
                                                  color: Colors.blue[400])),
                                          Text(' $_lastName',
                                              style: new TextStyle(
                                                  fontSize: 40,
                                                  color: Colors.blue[400],
                                                  fontWeight: FontWeight.bold))
                                        ],
                                        mainAxisAlignment:
                                            MainAxisAlignment.center),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Column(children: <Widget>[
                                      Row(
                                        children: [
                                          Text("Gender: ",
                                              style: new TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                          Text("$_date",
                                              style: new TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black)),
                                          SizedBox(
                                            height: 30,
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Date of Birth: ",
                                              style: new TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                          Text("10/10/1997 (x years old)",
                                              style: new TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black)),
                                          SizedBox(
                                            height: 30,
                                          )
                                        ],
                                      )
                                    ]),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Session History",
                                      style: new TextStyle(
                                          fontSize: 26,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: sessions.length,
                          itemBuilder: (BuildContext context, index) {
                            return ListTile(
                                title: Column(
                              children: <Widget>[
                                Divider(
                                  height: 10.0,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "10/10/2020",
                                          style: new TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 30.0,
                                    ),
                                    Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          sessions[index].sessionNumber,
                                          style: new TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 40.0,
                                    ),
                                    Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        SizedBox(
                                          width: 100.0,
                                          child: RaisedButton(
                                            onPressed: null,
                                            color: Colors.green,
                                            child: Text(
                                              sessions[index].sessionStatus,
                                              style: new TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        18.0)),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ));
                          }),
                    ])))));
  }
}

class Session {
  final String sessionNumber;
  final String sessionStatus;
  Session(this.sessionNumber, this.sessionStatus);
}
