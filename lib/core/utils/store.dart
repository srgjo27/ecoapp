import 'package:flutter/material.dart';

import '../../../core/constants/ic_string.dart';

final List<Map<String, dynamic>> categories = [
  {
    'icon': IcString.vagetables,
    'label': 'Vegetables',
    'color': Colors.green[100],
  },
  {
    'icon': IcString.fruits,
    'label': 'Fruits',
    'color': Colors.red[100],
  },
  {
    'icon': IcString.beverages,
    'label': 'Beverages',
    'color': Colors.yellow[100],
  },
  {
    'icon': IcString.grocery,
    'label': 'Grocery',
    'color': Colors.purple[100],
  },
  {
    'icon': IcString.edibleOil,
    'label': 'Edible oil',
    'color': Colors.blue[100],
  },
];

class Product {
  final String name;
  final double price;
  final String weight;
  final String image;
  final bool isNew;
  final int discount;
  final bool isWishlist;

  Product({
    required this.name,
    required this.price,
    required this.weight,
    required this.image,
    required this.isNew,
    required this.discount,
    required this.isWishlist,
  });
}

final List<Product> products = [
  Product(
    name: "Fresh Peach",
    price: 8.00,
    weight: "dozen",
    image: IcString.freshPeach,
    isNew: false,
    discount: 0,
    isWishlist: false,
  ),
  Product(
    name: "Avocado",
    price: 7.00,
    weight: "2.0 lbs",
    image: IcString.avocado,
    isNew: true,
    discount: 0,
    isWishlist: false,
  ),
  Product(
    name: "Pineapple",
    price: 9.90,
    weight: "150 lbs",
    image: IcString.pineapple,
    isNew: false,
    discount: 0,
    isWishlist: true,
  ),
  Product(
    name: "Black Grapes",
    price: 7.05,
    weight: "5.0 lbs",
    image: IcString.grapes,
    isNew: false,
    discount: 18,
    isWishlist: false,
  ),
  Product(
    name: "Pomegranate",
    price: 2.09,
    weight: "150 lbs",
    image: "",
    isNew: true,
    discount: 0,
    isWishlist: false,
  ),
  Product(
    name: "Fresh Broccoli",
    price: 3.00,
    weight: "1 kg",
    image: "",
    isNew: false,
    discount: 0,
    isWishlist: true,
  ),
];

final List<String> images = [
  '',
  '',
  '',
];
