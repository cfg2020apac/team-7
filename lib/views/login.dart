/**
 * This class implements the one-time registration of the user when they launch
 * the application for the first time and input details which include Height,
 * Weight and Age.
 *
 * @author Jay Gupta
 */
import 'package:flutter/material.dart';
import 'package:team7_app/components/firebase/getField.dart';
import 'package:team7_app/views/registerPage.dart';
import 'package:team7_app/views/text_field.dart';
import 'package:team7_app/views/clientList.dart';

class LoginForm extends StatefulWidget {
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  var _username = new TextEditingController();
  var _password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        body: Center(
            // GestureDetector(
            //     onTap: () {
            //       FocusScope.of(context).requestFocus(new FocusNode());
            //     },
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
                                  child: Text("Login Here!",
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
                                        "Username"),
                                    TextFields.getTextField(
                                        _password,
                                        TextInputType.number,
                                        TextInputAction.done,
                                        "Password"),
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
                                      child: Text("Login",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20)))),
                              SizedBox(height: 10),
                              MaterialButton(
                                  height: 50,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(22.0)),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RegisterPage()),
                                    );
                                  },
                                  color: Colors.blue[600],
                                  child: Center(
                                      child: Text("Register",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20)))),
                            ],
                          ))
                    ]))))));
  }
}
