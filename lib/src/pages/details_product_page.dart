import 'package:flutter/material.dart';

import 'package:productos_app/src/models/products.dart';
import 'package:productos_app/src/pages/edit_product_page.dart';
import 'package:productos_app/src/widgets/widgets.dart';

class DetailsProduct extends StatelessWidget {
  final Product? product;

  const DetailsProduct({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product!.color,
      appBar: buildAppBar(context),
      body: BodyDetailProduct(product: product),
    );
  }
}

AppBar buildAppBar(context) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    ),
    actions: <Widget>[
      Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditProductPage()));
          },
          child: Icon(
            Icons.edit,
            color: Colors.black,
            size: 26.0,
          ),
        ),
      ),
    ],
  );
}
