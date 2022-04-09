import 'package:hive/hive.dart';

part 'ingredient.g.dart';

@HiveType(typeId: 2)
class Ingredient {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int calories;
  @HiveField(2)
  final double totalWeight;

  Ingredient(
      {required this.name, required this.calories, required this.totalWeight});
}
