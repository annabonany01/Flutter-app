// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

class Product {

    final String title;
    final String id;
    final String image;
    final String description;
    final String price;
    final int type;

    Product({
      required this.title,
      required this.id,
      required this.image,
      required this.description,
      required this.price,
      required this.type,
    });


    factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        title: json["title"],
        id: json["id"],
        image: json["image"],
        description: json["description"],
        price: json["price"],
        type: json["type"],
    );

    Map<String, dynamic> toMap() => {
        "title": title,
        "id": id,
        "image": image,
        "description": description,
        "price": price,
        "type": type,
    };
}
