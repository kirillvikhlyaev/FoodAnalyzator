import 'package:flutter/cupertino.dart';

class Recipe {
  final int id;
  final String title;
  final String description;
  final NetworkImage image;

  Recipe(
      {required this.id,
      required this.title,
      required this.description,
      required this.image});
}
