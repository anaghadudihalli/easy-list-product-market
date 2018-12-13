import 'package:flutter/material.dart';
import 'dart:async';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  ProductPage(this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          print('Back button pressed');
          Navigator.pop(context, false);
          return Future.value(false); // making value true here tries to pop page twice. ie. tries to pop
          // root page too. As a result, the app crashes. keep it false.
        },
        child: Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(imageUrl),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Details!'),
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Text('DELETE'),
                onPressed: () => Navigator.pop(context, true),
                color: Theme.of(context).accentColor,
              )),
        ],
      ),
    ));
  }
}
