import 'package:flutter/material.dart';
List<String>imageLogoUrl = [
 'data:image/jpeg;base64,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' ];
var kHSize10 = const SizedBox(height: 10,);
var kHSize20 = const SizedBox(height: 20,);
var kHSize30 = const SizedBox(height: 30,);
var kVSize10 = const SizedBox(width: 10,);
var kVSize20 = const SizedBox(width: 20,);
var kVSize30 = const SizedBox(width: 30,);
const List<Color> shoeColors = [
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.deepPurple,
  Colors.indigo,
  Colors.blue,
  Colors.lightBlue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.lightGreen,
  Colors.lime,
  Colors.yellow,
  Colors.amber,
  Colors.orange,
  Colors.deepOrange,
  Colors.brown,
  Colors.grey,
  Colors.black,
  Colors.white,
];
const List<String> colorNames = [
  "red",
  "pink",
  "purple",
  "deep purple",
  "indigo",
  "blue",
  "light blue",
  "cyan",
  "teal",
  "green",
  "light green",
  "lime",
  "yellow",
  "amber",
  "orange",
  "deep orange",
  "brown",
  "grey",
  "black",
  "white",
  ""
];
List<String> shoCategory = [
  'Sneakers',
  'Ballet Flats',
  'Boat Shoes',
  'Brogue Shoes',
  'Sandals',
  'Boots',
  'Loafers',
  'Pumps',
  'Oxfords',
  'Espadrilles',
];
List<String>shoeSize = ['6', '7', '8', '9', '10', '11', '12',];
List<String> footwearBrands = [
  "Nike",
  "Adidas",
  "Puma",
  "Under Armour",
  "New Balance",
  "Asics",
  "Skechers",
  "Timberland",
  "Converse",
  "Vans",
];

 void showMySnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }