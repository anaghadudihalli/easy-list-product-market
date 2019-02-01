import 'package:flutter/material.dart';

// Products is a stateless widget since the data is recieved from outside.
class Products extends StatelessWidget {
  // final denotes the values of products will never change. The value is always set from outside. If the value changes,
  // it 'replaces' the old values and calls the build again with the new one but not 'change' it.
  final List<Map<String, dynamic>> products;
  // this.products stores the incoming argument automatically in a property of the same name.
  // Here, the argument is stored in property - products.
  // named arguments - {} both cases
  // positional arguments - optional only in []
  Products(this.products) {
    print('[Products Widget] Constructor');
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    products[index]['title'],
                    style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Oswald'),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text('₹${products[index]['price'].toString()}',
                        style: TextStyle(color: Colors.white)),
                  ) // Text can only output text
                ],
              )),
          DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(4.0)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
                child: Text('MG Road, Bangalore'),
              )),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.info),
                  color: Theme.of(context).accentColor,
                  iconSize: 35.0,
                  onPressed: () => Navigator.pushNamed<bool>(
                      context, '/product/' + index.toString())),
              IconButton(
                color: Colors.red, 
                icon: Icon(Icons.favorite_border),
                iconSize: 35.0,
              ),
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
