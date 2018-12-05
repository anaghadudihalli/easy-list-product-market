import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductManagerState();
  }
}

// _classname indicates that the Class won't be used outside this file. 
class _ProductManagerState extends State<ProductManager> {
  List<String> _products = ['Food Tester'];
  @override
  Widget build(BuildContext context) {
    return Column(children: [Container(
      margin: EdgeInsets.all(10.0),
      child: RaisedButton(
        onPressed: () {
          setState(() {
            _products.add('Advanced Food Tester');
            print(_products);
          });
        },
        child: Text('Add Product'),
      ),
    ),
    Products(_products)
    ],);
  }
}
