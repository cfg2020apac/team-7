import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:team7_app/views/caregivers/ClientSessionPage.dart';

class ClientInfoSessionPage extends StatefulWidget {
  final data;

  ClientInfoSessionPage({this.data});

  State createState() => ClientInfoPage(data: this.data);
}

class ClientInfoPage extends State<ClientInfoSessionPage> {
  final formKey = GlobalKey<FormState>();
  final data;
  ClientInfoPage({this.data});
  String _date = DateFormat('yMd').format(new DateTime.now());

  List<Session> _getMeetingHistory(clientId) {
    List<Session> sessions = [];
    if (clientId == 'CWxLDCJ2SFk4VOzRD8Jn') {
      Session session1 = new Session('Session 1', 'Completed', '30-01-2020',
          'Good progress in mental health');
      Session session2 = new Session('Session 2', 'Completed', '27-03-2020',
          'All good, no need for follow up');
      sessions.add(session1);
      sessions.add(session2);
      return sessions;
    } else if (clientId == 'D5Vf3rEMYomeUlu97iHx') {
      Session session1 = new Session(
          'Session 1', 'Completed', '20-09-2020', 'Good learning progress');
      Session session2 = new Session('Session 2', 'New', '25-09-2020', '');
      sessions.add(session1);
      sessions.add(session2);
      return sessions;
    } else {
      Session session1 = new Session('Session 1', 'Completed', '30-09-2020',
          'Completed initial phase of vetting.');
      Session session2 = new Session('Session 2', 'Alert', '10-10-2020',
          'Missing financial documents which needs to be submitted');
      sessions.add(session1);
      sessions.add(session2);
      return sessions;
    }
  }

  ClientInfo _getClientInfo(String clientId, Session sessionObj) {
    if (clientId == 'CWxLDCJ2SFk4VOzRD8Jn')
      return ClientInfo(sessionObj, clientId, 'M', '30-12-1990', 'John', 'Tan',
          '5EbY0ULbXOPEon4bezlt');
    else if (clientId == 'D5Vf3rEMYomeUlu97iHx')
      return ClientInfo(
          sessionObj, clientId, 'M', '30-12-1990', 'Adam', 'Tan', '');
    else
      return ClientInfo(
          sessionObj, clientId, 'F', '30-12-1990', 'Amy', 'Loh', '');
  }

  // String _firstName = 'First';
  // String _lastName = 'Last';

  Widget build(BuildContext context) {
    print("data");
    print(data);
    var sessions = _getMeetingHistory(data.clientId);
    // var clientInfo = _getClientInfo(data.clientId, sessions);
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
                                          Text(
                                              _getClientInfo(data.clientId,
                                                      sessions[0])
                                                  .firstName,
                                              style: new TextStyle(
                                                  fontSize: 40,
                                                  color: Colors.blue[400])),
                                          Text(
                                              ' ' +
                                                  _getClientInfo(data.clientId,
                                                          sessions[0])
                                                      .lastName
                                                      .toUpperCase(),
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
                                          Text(
                                              _getClientInfo(data.clientId,
                                                      sessions[0])
                                                  .gender,
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
                                          Text(
                                              _getClientInfo(data.clientId,
                                                      sessions[0])
                                                  .dateOfBirth,
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
                                      "Meeting History",
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
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CareGiverClientSessionPage(
                                                data: _getClientInfo(
                                                    data.clientId,
                                                    sessions[index])))),
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
                                              sessions[index].sessionDate,
                                              style: new TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                  fontWeight:
                                                      FontWeight.normal),
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
                                                  fontWeight:
                                                      FontWeight.normal),
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

class ClientInfo {
  Session session;
  final String clientId;
  final String gender;
  final String dateOfBirth;
  final String firstName;
  final String lastName;
  final String hdbMatching;
  ClientInfo(this.session, this.clientId, this.gender, this.dateOfBirth,
      this.firstName, this.lastName, this.hdbMatching);
}

class Session {
  final String sessionNumber;
  final String sessionStatus;
  final String sessionDate;
  final String sessionNotes;
  Session(this.sessionNumber, this.sessionStatus, this.sessionDate,
      this.sessionNotes);
}
