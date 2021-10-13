import 'package:flutter/material.dart';
import 'package:productos_app/src/models/products.dart';

class ItemCard extends StatelessWidget {
 final Product? product;
  final VoidCallback ? press;
  const ItemCard({
    Key? key, this.product, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(children: [
         Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    product!.title,
                    style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold
                    ,fontSize: 15
                    ),
                  ),
                ),
        Expanded(
          
          child: Container(
              height: 180,
              width: 300,
              decoration: BoxDecoration(
                  color: product!.color,
                  borderRadius: BorderRadius.circular(16)),
              child: Image(image: AssetImage(product!.image,))
              
              ),
        )
            ,
             
      ]),
    );
  }
}