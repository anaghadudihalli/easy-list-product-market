import 'package:flutter/material.dart';

import './products.dart';
import './product_control.dart';

class ProductManager extends StatefulWidget {
  // Even though ProductManager is a Stateful widget it needs to immutable as the changing of data happens in
  // ProductManagerState and not in this class
  // startingProduct is recieved from outside and is updated only when build() is called in the parent component.
  final String startingProduct;

  // this.startingProduct stores only the first element in the list.
  // To make this a named argument add '{}' around the argument.
  ProductManager({this.startingProduct = 'Sweets Tester'}) {
    print('[ProductManager Widget] Constructor');
  }
  @override
  State<StatefulWidget> createState() {
    print('[ProductManager Widget] createState()');
    return _ProductManagerState();
  }
}

// _classname indicates that the Class won't be used outside this file.
class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];
  final age = 22;

  @override
  // initState() is run always when State object is initialized.
  void initState() {
    print('[ProductManager Widget] initState()');
    super
        .initState(); // this is recommended to have it in the beginning of initState()
    // super always refers to the base class you're extending i.e. 'State'. It always calls initstate() in the base class
    // to make sure it's always called even though it's overridden.
    // widget is used to access properties of ProductManager
    // no need to have a setState() since initState() is run before build(), so need to re-render.
    _products.add(widget.startingProduct);
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    print('[ProductManager State] didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  void _addProduct(String product) {
    setState(() {
      _products.add(product); // Add edits the existing list and doesn't assign a new one.
      // Lists and objects are reference types. It only stores reference to objects.
      // final prevent assigning a new value, editing is allowed.
      // age = 23; // can't be done as age is final
      age.round(); // functions are allowed.
      // If we want the values to never be changed, use 'const'
      // const age = 22;
      // age.round(); -> throws the error.
    });
  }

  @override
  Widget build(BuildContext context) {
    print('[ProductManager State] Build');
    return Column(
      children: [
        Container(margin: EdgeInsets.all(10.0), child: ProductControl(_addProduct)),
        Products(_products)
      ],
    );
  }
}
