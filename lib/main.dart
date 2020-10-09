import 'package:flutter/material.dart';
import 'package:team7_app/views/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Team 7",
        theme: ThemeData(
            textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'Open Sans',
                bodyColor: Colors.white,
                displayColor: Colors.white)),
        home: WelcomeScreen());
  }
}
