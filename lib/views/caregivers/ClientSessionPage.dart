import 'package:flutter/material.dart';
import 'package:team7_app/views/text_field.dart';
import 'package:intl/intl.dart';

class CareGiverClientSessionPage extends StatefulWidget {
  final data;
  CareGiverClientSessionPage({this.data});
  State createState() => ClientSessionState(data: this.data);
}

class ClientSessionState extends State<CareGiverClientSessionPage> {
  final formKey = GlobalKey<FormState>();
  var _notes = new TextEditingController();
  var _assignAction = new TextEditingController();
  final data;

  ClientSessionState({this.data});
  String _selectedOption;

  @override
  Widget build(BuildContext context) {
    String _firstName = data.firstName;
    String _lastName = data.lastName;
    String _date = data
        .session.sessionDate; //DateFormat('yMd').format(new DateTime.now());
    String notes = data.session.sessionNotes;

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
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            children: <Widget>[
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
                              Row(children: <Widget>[
                                Text('$_firstName',
                                    style: new TextStyle(
                                        fontSize: 40, color: Colors.blue[400])),
                                Text(' $_lastName'.toUpperCase(),
                                    style: new TextStyle(
                                        fontSize: 40,
                                        color: Colors.blue[400],
                                        fontWeight: FontWeight.bold))
                              ], mainAxisAlignment: MainAxisAlignment.center),
                              SizedBox(
                                height: 40,
                              ),
                              Row(children: <Widget>[
                                Text("Date: ",
                                    style: new TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[400],
                                        fontWeight: FontWeight.bold)),
                                Text("$_date",
                                    style: new TextStyle(
                                        fontSize: 18, color: Colors.grey[400]))
                              ]),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  padding: EdgeInsets.all(5),
                                  height: 75,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromRGBO(
                                                255, 255, 255, .5),
                                            blurRadius: 20.0,
                                            offset: Offset(0, 10))
                                      ]),
                                  child: Column(children: <Widget>[
                                    // TextFields.getTextField(
                                    //     _notes,
                                    //     TextInputType.text,
                                    //     TextInputAction.done,
                                    //     "Notes"),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                          labelText: "Notes"),
                                      initialValue: notes,
                                      style: new TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ])),
                              SizedBox(
                                height: 20,
                              ),
                              DropdownButton<String>(
                                  hint: Text('Assign Status',
                                      style: new TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey[400])),
                                  value: _selectedOption,
                                  items: <String>[
                                    'Completed',
                                    'To Assign New Session',
                                    'Require Care Manager Intervention'
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
                              SizedBox(
                                height: 20,
                              ),
                              MaterialButton(
                                  height: 50,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(22.0)),
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => HomeScreen()),
                                    // );
                                  },
                                  color: Colors.blue[600],
                                  child: Center(
                                      child: Text("Save Details",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20))))
                            ],
                          ))
                    ]))))));
  }
}
