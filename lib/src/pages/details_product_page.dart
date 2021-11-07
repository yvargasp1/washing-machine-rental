import 'package:flutter/material.dart';

import 'package:productos_app/src/models/products.dart';
import 'package:productos_app/src/models/products2.dart';
import 'package:productos_app/src/pages/edit_product_page.dart';
import 'package:productos_app/src/services/services.dart';
import 'package:productos_app/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class DetailsProduct extends StatelessWidget {
  final Product2? product;

  const DetailsProduct({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context, product),
      body: BodyDetailProduct(product: product),
    );
  }
}

AppBar buildAppBar(context, Product2? product) {
  final productService = Provider.of<ProductService>(context);
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
            productService.productSelected = product!.copy();
            final temp = productService.productSelected;
            debugPrint('Copia productos: $temp');

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditProductPage(product: productService.productSelected)));
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
