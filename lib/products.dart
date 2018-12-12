import 'package:flutter/material.dart';

// Products is a stateless widget since the data is recieved from outside.
class Products extends StatelessWidget {
  // final denotes the values of products will never change. The value is always set from outside. If the value changes,
  // it 'replaces' the old values and calls the build again with the new one but not 'change' it.
  final List<String> products;

  // this.products stores the incoming argument automatically in a property of the same name.
  // Here, the argument is stored in property - products.
  // named arguments - {} both cases
  // positional arguments - optional only in []
  Products([this.products = const []]) {
    print('[Products Widget] Constructor');
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] Build');
    return Column(
      children: products
          .map((element) => Card(
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/food.jpg'),
                    Text(element)
                  ],
                ),
              ))
          .toList(),
    );
  }
}
