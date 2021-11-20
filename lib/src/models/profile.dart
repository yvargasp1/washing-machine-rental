import 'dart:convert';

class Profile {
  Profile({
    required this.name,
    required this.phone,
    required this.email,
    this.id,
    this.image,
    required this.address,
    required this.lastname,
  });

  String lastname;
  String? id;
  String? image;
  String name;
  String phone;
  String email;
  String address;

  factory Profile.fromJson(String str) => Profile.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
        lastname: json["lastname"],
        name: json["name"],
        image: json["image"] == null ? null : json["image"],
        phone: json["phone"],
        address: json["address"],
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "lastname": lastname,
        "name": name,
        "image": image == null ? null : image,
        "phone": phone,
        "address": address,
        "email": email
      };

  Profile copy() => Profile(
      id: this.id,
      lastname: this.lastname,
      name: this.name,
      image: this.image,
      phone: this.phone,
      address: this.address,
      email: this.email);
}
