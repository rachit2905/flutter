// ignore_for_file: unused_import, null_closures

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Item {
  final num id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        color: map["color"],
        image: map["image"]);
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image
      };
}

class CatalogModel {
  static List<Item> products = [];
  static Item getById(int id) =>
      products.firstWhere((element) => element.id == id, orElse: null);
  static Item getByPosition(int position) => products[position];
}
