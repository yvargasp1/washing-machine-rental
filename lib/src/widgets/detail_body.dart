import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:productos_app/src/models/products.dart';
import 'package:productos_app/src/widgets/subwigets/Item_detail.dart';
import 'package:productos_app/src/widgets/subwigets/item_counter_detail.dart';
import 'package:productos_app/src/widgets/subwigets/item_info_product.dart';

class BodyDetailProduct extends StatelessWidget {
  final Product? product;

  const BodyDetailProduct({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.4),
                  padding: EdgeInsets.only(
                    top: size.height * 0.18,
                    left: 15,
                    right: 12,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      )),
                  child: Column(
                    children: <Widget>[
                      InfoProduct(product: product),
                      SizedBox(
                        height: 30,
                      ),
                      CounterHours(),
                    ],
                  ),
                ),
                ItemTitleImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}
