import 'package:flutter/material.dart';

class Product {
  final String image, title, description, price, size, id;

  final Color? color;

  Product(
      {required this.image,
      required this.description,
      required this.title,
      required this.price,
      required this.size,
      required this.id,
      this.color});
}

List<Product> products = [
  Product(
      id: '1',
      title: 'WM3700HVA_1',
      price: '200',
      size: '12',
      description: 'Pequeña',
      image: 'assets/washing1.png',
      color: Colors.white),
  Product(
      id: '2',
      title: 'MIDEA',
      price: '200',
      size: '12',
      description: 'Pequeña',
      image: 'assets/MIDEA.png',
      color: Colors.white),
  Product(
      id: '3',
      title: 'LAVATODO',
      price: '400',
      size: '24',
      description: 'Grande',
      image: 'assets/PNG101471.png',
      color: Colors.white),
  Product(
      id: '4',
      title: 'LAVAYA',
      price: '400',
      size: '24',
      description: 'Grande',
      image: 'assets/10.png',
      color: Colors.white),
  Product(
      id: '5',
      title: 'ROPAFULL',
      price: '400',
      size: '24',
      description: 'Grande',
      image: 'assets/5.png',
      color: Colors.white),
  Product(
      id: '6',
      title: 'EXPRESS',
      price: '400',
      size: '24',
      description: 'Grande',
      image: 'assets/7.png',
      color: Colors.white),
];
