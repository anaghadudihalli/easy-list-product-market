import 'package:flutter/material.dart';

import './product_create.dart';
import './product_list.dart';

class ProductAdminPage extends StatelessWidget {
  final Function addProduct;
  final Function deleteProduct;

  ProductAdminPage(this.addProduct, this.deleteProduct); 
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: Drawer(
              child: Column(
            children: <Widget>[
              AppBar(title: Text('Choose')),
              ListTile(
                title: Text('All Products'),
                onTap: () => Navigator.pushReplacementNamed(
                    context, '/' ),
              ),
            ],
          )),
          appBar: AppBar(
            title: Text('Product Admin'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.create),
                  text: 'Create Product',
                ),
                Tab(
                  icon: Icon(Icons.list),
                  text: 'My Products',
                )
              ],
            ),
          ),
          body: TabBarView(
            //Tab bar pages are embedded within the main scaffold. They don't replace the original one
            children: <Widget>[ProductCreatePage(addProduct), ProductListPage()],
          ),
        ));
  }
}
