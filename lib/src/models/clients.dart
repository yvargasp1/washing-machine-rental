import 'package:flutter/material.dart';

class Client {
  final String image, name, phone, address;
  final int id;

  Client({
    required this.image,
    required this.name,
    required this.phone,
    required this.address,
    required this.id,
  });
}

List<Client> clients = [
  Client(
    id: 1,
    name: 'Carlos',
    phone: '31212313',
    address: 'Tv429-45',
    image: 'assets/person.jpg',
  ),
  Client(
    id: 2,
    name: 'Juan',
    phone: '654654654',
    address: 'cll3-a',
    image: 'assets/washing1.png',
  ),
  Client(
    id: 3,
    name: 'Maria',
    phone: '5644464',
    address: 'tv58-985',
    image: 'assets/washing1.png',
  ),
  Client(
    id: 4,
    name: 'Hector',
    phone: '64554',
    address: 'tv58--985',
    image: 'assets/washing1.png',
  )
];
