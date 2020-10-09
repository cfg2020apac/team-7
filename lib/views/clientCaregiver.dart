import 'package:flutter/material.dart';

class ClientCaregiver extends StatelessWidget {
  final String id;

  ClientCaregiver(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Constructor — second page"),
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
                height: 54.0,
                padding: EdgeInsets.all(12.0),
                child: Text("Data passed to this page:",
                    style: TextStyle(fontWeight: FontWeight.w700))),
            Text("Text: ${id}"),
          ],
        ),
      ),
    );
  }
}
