import 'package:flutter/material.dart';

// When you are passing data up ( from productcontrol to productmanager), you pass down a reference to a function
// from parent widget (productmanager to productcontrol)

class ProductControl extends StatelessWidget{
  final Function addProduct; // Stores reference to a function
  ProductControl(this.addProduct);
  @override
    Widget build(BuildContext context) {
      return RaisedButton(
            onPressed: () {
              addProduct('Sweets');
            },
            child: Text('Add Product'),
          );
    }
}