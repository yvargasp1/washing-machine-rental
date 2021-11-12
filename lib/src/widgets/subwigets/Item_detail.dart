import 'package:flutter/material.dart';
import 'package:productos_app/src/models/products.dart';
import 'package:productos_app/src/models/products2.dart';

class ItemTitleImage extends StatelessWidget {
  const ItemTitleImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product2? product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Modelo lavadora',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          Text(
            product!.title,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Capacidad de prendas : \n",
                      style: TextStyle(color: Colors.black)),
                  TextSpan(
                    text: "\ ${product!.size}",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
              Expanded(
                child: product!.image == null
                    ? Image(
                        image: AssetImage('assets/no-image.png'),
                        fit: BoxFit.cover,
                      )
                    : FadeInImage(
                        placeholder: AssetImage('assets/jar-loading.gif'),
                        image: NetworkImage(product!.image!),
                        fit: BoxFit.cover,
                      ),
              )
            ],
          )
        ],
      ),
    );
  }
}
