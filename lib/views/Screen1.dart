import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[600],
        body: Center(
            child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              Container(
                height: 340,
                child: Column(
                  children: <Widget>[
                    Text('This is Screen 1'),
                  ],
                ),
              ),
            ]),
          ),
        )));
  }
}
