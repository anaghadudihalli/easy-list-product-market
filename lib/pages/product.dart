import 'package:flutter/material.dart';
import 'dart:async';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  final String description;
  ProductPage(this.title, this.imageUrl, this.price, this.description);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          print('Back button pressed');
          Navigator.pop(context, false);
          return Future.value(
              false); // making value true here tries to pop page twice. ie. tries to pop
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
                child: Text(
                  title,
                  style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "MG Road, Bangalore",
                    style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
                  ),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    child: Text(
                      '|',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Text(
                    '\₹' + price.toString(),
                    style: TextStyle(fontFamily: 'Oswald'),
                  )
                ],
              ),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 15.0),
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    description,
                    style: TextStyle(fontSize: 15.0, fontFamily: 'Oswald'),
                    textAlign: TextAlign.justify,
                  ))
            ],
          ),
        ));
  }
}
