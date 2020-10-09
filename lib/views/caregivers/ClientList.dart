/**
 * This class implements the one-time registration of the user when they launch
 * the application for the first time and input details which include Height,
 * Weight and Age.
 *
 * @author Jay Gupta
 */
import 'package:flutter/material.dart';
import 'package:team7_app/components/clientCard.dart';

class CareGiverClientListPage extends StatefulWidget {
  State createState() => ClientListState();
}

class ClientListState extends State<CareGiverClientListPage> {
  final formKey = GlobalKey<FormState>();
  var _username = new TextEditingController();
  var _password = new TextEditingController();
  String _selectedOption;

  @override
  Widget build(BuildContext context) {
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
                    child: SingleChildScrollView(
                        child: Column(children: <Widget>[
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
                                    ? (Column(children: <Widget>[
                                        SizedBox(height: 10),
                                        ClientCard.getClientSchedule(
                                            context, "Client 1", "11/9/2020"),
                                        SizedBox(height: 10),
                                        ClientCard.getClientSchedule(
                                            context, "Client 2", "12/9/2020"),
                                        SizedBox(height: 10),
                                        ClientCard.getClientSchedule(
                                            context, "Client 3", "13/9/2020"),
                                        SizedBox(height: 10),
                                        ClientCard.getClientSchedule(
                                            context, "Client 4", "14/9/2020"),
                                      ]))
                                    : (_selectedOption == "View All Clients")
                                        ? (Column(children: <Widget>[
                                            SizedBox(height: 10),
                                            ClientCard.getClientCard(
                                                context, "Client 1", "1"),
                                            SizedBox(height: 10),
                                            ClientCard.getClientCard(
                                                context, "Client 2", "2"),
                                            SizedBox(height: 10),
                                            ClientCard.getClientCard(
                                                context, "Client 3", "3"),
                                            SizedBox(height: 10),
                                            ClientCard.getClientCard(
                                                context, "Client 4", "4"),
                                          ]))
                                        : Column(),
                                SizedBox(
                                  height: 20,
                                ),
                              ]))
                    ]))))));
  }
}
