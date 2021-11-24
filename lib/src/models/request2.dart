import 'dart:convert';

class Request2 {
  Request2({
    required this.title,
    required this.available,
    required this.hour,
    required this.client,
    required this.phone,
    this.id,
    this.image,
    required this.description,
    required this.address,
  });

  String title;
  String? id;
  String? image;
  bool available;
  String description;
  String address;

  String hour;
  String client;
  String phone;

  factory Request2.fromJson(String str) => Request2.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Request2.fromMap(Map<String, dynamic> json) => Request2(
        title: json["title"],
        image: json["image"] == null ? null : json["image"],
        available: json["available"],
        description: json["description"],
        hour: json["hour"],
        phone: json["phone"],
        client: json["client"],
        address: json["address"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "available": available,
        "image": image == null ? null : image,
        "phone": phone,
        "client": client,
        "hour": hour,
        "address": address,
      };

  Request2 copy() => Request2(
        id: this.id,
        title: this.title,
        available: this.available,
        image: this.image,
        description: this.description,
        phone: this.phone,
        client: this.client,
        hour: this.hour,
        address: this.address,
      );
}
