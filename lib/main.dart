import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './product_manager.dart';

void main() {
  debugPaintSizeEnabled = true; // See how widgets are layed out
  debugPaintBaselinesEnabled = true; // Shows base lines of texts
  debugPaintPointersEnabled = true; // Shows where the tap event is registered
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // Static properties(deepOrange) are properties of a class that can be accessed without instantiating the class
          primarySwatch: Colors.deepOrange,
          brightness: Brightness.light,
          accentColor: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(
          title: Text('EasyList'),
        ),
        body: ProductManager(startingProduct: 'Food Tester'),
      ),
    );
  }
}
