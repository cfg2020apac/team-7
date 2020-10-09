import 'package:flutter/material.dart';
import 'package:team7_app/views/clientList.dart';
import 'package:team7_app/views/text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddClientForm extends StatefulWidget {
  State createState() => RegistrationPageState();
}

class RegistrationPageState extends State<AddClientForm> {
  String _value;
  final formKey = GlobalKey<FormState>();
  var _name = new TextEditingController();
  var _dob = new TextEditingController();
  var _contact = new TextEditingController();
  var _occupation = new TextEditingController();
  var _salary = new TextEditingController();
  var _homeliness = new TextEditingController();
  var _address = new TextEditingController();
  var _issue = new TextEditingController();
  var _note = new TextEditingController();

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
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                          child: Container(
                              child: Center(
                                  child: Text("Add details for the New Case",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.blue[400]))))),
                      Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.all(5),
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
                                    TextFields.getTextField(
                                        _name,
                                        TextInputType.text,
                                        TextInputAction.done,
                                        "Name"),
                                    TextFields.getTextField(
                                        _dob,
                                        TextInputType.number,
                                        TextInputAction.done,
                                        "Date of Birth"),
                                    Container(
                                        padding: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[100])),
                                        ),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: DropdownButton<String>(
                                            items: [
                                              DropdownMenuItem<String>(
                                                child: Text('Male',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    )),
                                                value: 'Male',
                                              ),
                                              DropdownMenuItem<String>(
                                                child: Text('Female',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    )),
                                                value: 'Female',
                                              ),
                                              DropdownMenuItem<String>(
                                                child: Text('Others',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    )),
                                                value: 'Others',
                                              ),
                                            ],
                                            onChanged: (String value) {
                                              setState(() {
                                                _value = value;
                                              });
                                            },
                                            hint: Text('Select Gender',
                                                style: TextStyle(
                                                    color: Colors.grey[400])),
                                            value: _value,
                                          ),
                                        )),
                                    TextFields.getTextField(
                                        _contact,
                                        TextInputType.text,
                                        TextInputAction.done,
                                        "Contact Number"),
                                    TextFields.getTextField(
                                        _occupation,
                                        TextInputType.text,
                                        TextInputAction.done,
                                        "Occupation"),
                                    TextFields.getTextField(
                                        _salary,
                                        TextInputType.text,
                                        TextInputAction.done,
                                        "Monthly Salary"),
                                    TextFields.getTextField(
                                        _address,
                                        TextInputType.text,
                                        TextInputAction.done,
                                        "Current/Recent Address"),
                                    TextFields.getTextField(
                                        _homeliness,
                                        TextInputType.text,
                                        TextInputAction.done,
                                        "Reason for Homeliness"),
                                    TextFields.getTextField(
                                        _issue,
                                        TextInputType.text,
                                        TextInputAction.done,
                                        "Main Presenting Issue"),
                                    TextFields.getTextField(
                                        _note,
                                        TextInputType.text,
                                        TextInputAction.done,
                                        "Additional Notes"),
                                  ])),
                              SizedBox(
                                height: 20,
                              ),
                              MaterialButton(
                                  height: 50,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(22.0)),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ClientList()),
                                    );
                                  },
                                  color: Colors.blue[600],
                                  child: Center(
                                      child: Text("Submit New Client Case",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20))))
                            ],
                          ))
                    ]))))));
  }
}
