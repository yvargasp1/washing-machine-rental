import 'dart:convert';

class Product2 {
  Product2({
    required this.available,
    required this.description,
    this.id,
    required this.image,
    required this.price,
    required this.size,
    required this.title,
  });

  bool available;
  String description;
  String? id;
  String image;
  String price;
  String size;
  String title;

  factory Product2.fromJson(String str) => Product2.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product2.fromMap(Map<String, dynamic> json) => Product2(
        available: json["available"],
        description: json["description"],
        id: json["id"],
        image: json["image"],
        price: json["price"],
        size: json["size"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "description": description,
        "id": id,
        "image": image,
        "price": price,
        "size": size,
        "title": title,
      };

  Product2 copy() => Product2(
      available: this.available,
      description: this.description,
      image: this.image,
      price: this.price,
      size: this.size,
      title: this.title);
}
