import 'package:flutter/material.dart';
import 'package:productos_app/src/models/products.dart';

class InfoProduct extends StatelessWidget {
  const InfoProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Valor estimado : \n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    )),
                TextSpan(
                  text: '\$${product!.price} / h',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ]))
            ],
          ),
        ),
        RichText(
            text: TextSpan(
          children: [
            TextSpan(
                text: 'Descripcion : \n',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.normal)),
            TextSpan(
              text: '${product!.description}',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            )
          ],
        )),
      ],
    );
  }
}
