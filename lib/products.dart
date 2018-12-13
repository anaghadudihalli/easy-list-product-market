import 'package:flutter/material.dart';

import 'pages/product.dart';

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

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/food.jpg'),
          Text(products[index]),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ProductPage())),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] Build');
    // Usig ListView doesn't work under a widget
    // Wrap ListView with Container
    // ListView is useful only when we know the number of items or when the items are not dynamically added.
    return products.length > 0
        ? ListView.builder(
            itemBuilder: _buildProductItem,
            itemCount: products.length,
          )
        : Container();
  }
}
