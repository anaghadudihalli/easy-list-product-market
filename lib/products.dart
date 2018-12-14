import 'package:flutter/material.dart';

import 'pages/product.dart';

// Products is a stateless widget since the data is recieved from outside.
class Products extends StatelessWidget {
  // final denotes the values of products will never change. The value is always set from outside. If the value changes,
  // it 'replaces' the old values and calls the build again with the new one but not 'change' it.
  final List<Map<String, String>> products;
  final Function deleteProduct;
  // this.products stores the incoming argument automatically in a property of the same name.
  // Here, the argument is stored in property - products.
  // named arguments - {} both cases
  // positional arguments - optional only in []
  Products(this.products, {this.deleteProduct}) {
    print('[Products Widget] Constructor');
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () => Navigator.pushNamed<bool>(
                            context, '/product/' + index.toString())
                        .then((bool value) {
                      if (value) {
                        deleteProduct(index);
                      }
                      print(value);
                    }),
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
