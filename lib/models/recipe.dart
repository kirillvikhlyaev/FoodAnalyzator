class Recipe {
  final String title;
  final String imgURL;
  final double calories;
  final double totalTime;
  final List<dynamic> dishtype;
  final List<dynamic> cuisineType;
  final List<dynamic> mealType;
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
