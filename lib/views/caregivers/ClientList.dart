/**
 * This class implements the one-time registration of the user when they launch
 * the application for the first time and input details which include Height,
 * Weight and Age.
 *
 * @author Jay Gupta
 */
import 'package:flutter/material.dart';
import 'package:team7_app/components/clientCard.dart';
import 'package:team7_app/views/caregivers/ClientInfoPage.dart';

class CareGiverClientListPage extends StatefulWidget {
  State createState() => ClientListState();
}

class ClientListState extends State<CareGiverClientListPage> {
  final formKey = GlobalKey<FormState>();
  var _username = new TextEditingController();
  var _password = new TextEditingController();
  String _selectedOption;

  List<ClientMeetings> _getClientMeetings() {
    List<ClientMeetings> meetings = [];
    ClientMeetings meeting1 = new ClientMeetings(
      'Client 1',
      '11/9/2020',
    );
    ClientMeetings meeting2 = new ClientMeetings('Client 2', '12/09/2020');
    meetings.add(meeting1);
    meetings.add(meeting2);
    print(meetings);
    print(meeting1);
    return meetings;
  }

  List<ClientDetails> _getClientDetails() {
    List<ClientDetails> clients = [];
    ClientDetails client1 = new ClientDetails(
      '1',
      'Client 2',
    );
    ClientDetails client2 = new ClientDetails('2', 'Client 2');
    clients.add(client1);
    clients.add(client2);
    print(clients);
    print(client1);
    return clients;
  }

  @override
  Widget build(BuildContext context) {
    var clientMeetings = _getClientMeetings();
    var clientDetails = _getClientDetails();
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
                      Column(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        child: Text('Welcome Care Giver',
                                            style: new TextStyle(
                                                fontSize: 30,
                                                color: Colors.blue[400],
                                                fontWeight: FontWeight.bold)),
                                      )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  DropdownButton<String>(
                                      hint: Text('Viewing Options',
                                          style: new TextStyle(
                                              fontSize: 18,
                                              color: Colors.grey[400])),
                                      value: _selectedOption,
                                      items: <String>[
                                        'Upcoming Schedule',
                                        'View All Clients',
                                      ].map((String value) {
                                        return new DropdownMenuItem<String>(
                                          value: value,
                                          child: new Text(value,
                                              style: new TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.grey[400])),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedOption = newValue;
                                        });
                                      }),
                                  (_selectedOption == "Upcoming Schedule")
                                      ? (ListView.builder(
                                          shrinkWrap: true,
                                          physics: ScrollPhysics(),
                                          itemCount: clientMeetings.length,
                                          itemBuilder:
                                              (BuildContext context, index) {
                                            return ClientCard.getClientSchedule(
                                                context,
                                                clientMeetings[index]
                                                    .clientName,
                                                clientMeetings[index]
                                                    .clientDate,
                                                ClientInfoSessionPage(
                                                    data: "data 1"));
                                          }))
                                      : (_selectedOption == "View All Clients")
                                          ? (ListView.builder(
                                              shrinkWrap: true,
                                              physics: ScrollPhysics(),
                                              itemCount: clientMeetings.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      index) {
                                                return ClientCard.getClientCard(
                                                    context,
                                                    clientDetails[index]
                                                        .clientName,
                                                    clientDetails[index]
                                                        .clientId);
                                              }))
                                          : Column(),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ]))
                      ])
                    ])))));
  }
}

class ClientMeetings {
  final String clientName;
  final String clientDate;
  ClientMeetings(this.clientName, this.clientDate);
}

class ClientDetails {
  final String clientId;
  final String clientName;
  ClientDetails(this.clientId, this.clientName);
}
