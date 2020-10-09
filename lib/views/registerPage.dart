import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:team7_app/views/clientList.dart';
import 'package:team7_app/views/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  State createState() => RegistrationPageState();
}

class RegistrationPageState extends State<RegisterPage> {
  String _value;
  final formKey = GlobalKey<FormState>();
  var _username = new TextEditingController();
  var _password = new TextEditingController();
  var _contact = new TextEditingController();
  var _email = new TextEditingController();
  var _note = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        body: Center(
            // onTap: () {
            //   FocusScope.of(context).requestFocus(new FocusNode());
            // },
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
                                  child: Text(
                                      "Please fill in the below details",
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
                                        _username,
                                        TextInputType.text,
                                        TextInputAction.done,
                                        "Name"),
                                    TextFields.getTextField(
                                        _password,
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
                                                child: Text('Caregiver',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    )),
                                                value: 'Caregiver',
                                              ),
                                              DropdownMenuItem<String>(
                                                child: Text('Case Manager',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    )),
                                                value: 'Case Manager',
                                              ),
                                            ],
                                            onChanged: (String value) {
                                              setState(() {
                                                _value = value;
                                              });
                                            },
                                            hint: Text('Select Role',
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
                                        _email,
                                        TextInputType.text,
                                        TextInputAction.done,
                                        "Email"),
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
                                    registerUser(
                                        _username.text,
                                        _password.text,
                                        _contact.text,
                                        _email.text,
                                        _note.text,
                                        _value);
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => ClientList()),
                                    // );
                                  },
                                  color: Colors.blue[600],
                                  child: Center(
                                      child: Text("Submit Registration",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20))))
                            ],
                          ))
                    ]))))));
  }

  static registerUser(String username, String password, String contact,
      String email, String note, String value) {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    if (value == "Case Manager") {
      FirebaseFirestore.instance
          .collection("serviceWorker")
          .doc(email)
          .set({"username": username, "email": email, "note": note});
    } else if (value == "Caregiver") {
      FirebaseFirestore.instance
          .collection("caregiver")
          .doc(email)
          .set({"username": username, "email": email, "note": note});
    } else {
      print('Error value');
    }
  }
}
