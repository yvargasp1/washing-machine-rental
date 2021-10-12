import 'package:flutter/material.dart';

class Product {
  final String? image, title, description;
  final int? price, size, id;
  final Color? color;

  Product(
      {this.image,
      this.title,
      this.description,
      this.price,
      this.size,
      this.id,
      this.color});
}

List<Product> products = [
  Product(id: 1,title: 'Lava 1',price: 10,size: 12,description: 'aa',image: 'assets/screenpage.png',color: Colors.black),
  Product(id: 2,title: 'Lava 2',price: 10,size: 12,description: 'aa',image: 'assets/screenpage.png',color: Colors.green),

  
  ];


