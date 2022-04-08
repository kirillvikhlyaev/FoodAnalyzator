import 'package:hive/hive.dart';

part 'recipe.g.dart';

@HiveType(typeId: 1)
class Recipe {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String imgURL;
  @HiveField(2)
  final double calories;
  @HiveField(3)
  final double totalTime;
  @HiveField(4)
  final List<dynamic> dishtype;
  @HiveField(5)
  final List<dynamic> cuisineType;
  @HiveField(6)
  final List<dynamic> mealType;
  @HiveField(7)
  final List<dynamic> ingredientLines;

  Recipe(
      {required this.title,
      required this.imgURL,
      required this.calories,
      required this.totalTime,
      required this.dishtype,
      required this.cuisineType,
      required this.mealType,
      required this.ingredientLines});
}
