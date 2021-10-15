import 'package:flutter/material.dart';
import 'package:productos_app/src/models/clients.dart';
import 'package:productos_app/src/models/products.dart';

class Request {
  final String title, description, producto, cliente, image;
  final int id;
  final Color? color;

  Request(
      {required this.description,
      required this.title,
      required this.producto,
      required this.cliente,
      required this.image,
      required this.id,
      this.color});
}

List<Request> request = [
  Request(
      id: 1,
      title: 'Procesada',
      producto: products[0].title,
      description: 'Podria mejorar.',
      cliente: clients[0].name,
      image: products[0].image,
      color: Colors.green),
  Request(
      id: 2,
      title: 'Procesada',
      producto: products[1].title,
      description: 'Satisfecho.',
      cliente: clients[1].name,
      image: products[1].image,
      color: Colors.green),
  Request(
      id: 3,
      title: 'En proceso',
      producto: products[2].title,
      description: 'Pendiente de envio.',
      image: products[2].image,
      cliente: clients[2].name,
      color: Colors.red),
  Request(
      id: 4,
      title: 'Procesada',
      producto: products[3].title,
      description: 'Satisfecho.',
      cliente: clients[3].name,
      image: products[3].image,
      color: Colors.green),
];
