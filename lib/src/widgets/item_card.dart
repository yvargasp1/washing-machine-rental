import 'dart:io';

import 'package:flutter/material.dart';
import 'package:productos_app/src/models/products.dart';
import 'package:productos_app/src/models/products2.dart';

class ItemCard extends StatelessWidget {
  final Product2 product;
  final VoidCallback? press;
  const ItemCard({Key? key, required this.product, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(children: [
        Icon(Icons.access_alarm, color: Colors.white),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            product.title,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        Expanded(
            child: Container(
          height: 180,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: getImage(product.image),
        )),
      ]),
    );
  }

  Widget getImage(String? image) {
    if (image == null) {
      return Image(image: AssetImage('assets/no-image.png'), fit: BoxFit.cover);
    }
    if (image.startsWith('http')) {
      return FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(image),
          fit: BoxFit.cover);
    }

    return Image.file(
      File(image),
      fit: BoxFit.cover,
    );
  }
}
