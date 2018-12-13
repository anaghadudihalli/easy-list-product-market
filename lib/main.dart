import 'package:flutter/material.dart';

import './pages/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // Static properties(deepOrange) are properties of a class that can be accessed without instantiating the class
          primarySwatch: Colors.deepOrange,
          brightness: Brightness.light,
          accentColor: Colors.deepPurple),
      home: AuthPage()
    );
  }
}
