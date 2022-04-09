import 'package:flutter/material.dart';
import 'package:food_analyzer/api_handler/recipe_api_handler.dart';
import 'package:food_analyzer/models/recipe.dart';

class RecipeWidgetModel extends ChangeNotifier {
  final apiClient = RecipeApiClient();
  var _recipies = <Recipe>[];

  String _cuisineTypeValue = 'All';
  String _dishTypeValue = 'All';
  String _mealTypeValue = 'All';

  set cuisineTypeValue(String value) => _cuisineTypeValue = value;
  set dishTypeValue(String value) => _dishTypeValue = value;
  set mealTypeValue(String value) => _mealTypeValue = value;

  List<Recipe> get recipies => _recipies;

  // Future<void> reloadRecipies() async {
  //   final recipiess = await apiClient.getRecipies();
  //   _recipies = recipiess;
  //   notifyListeners();
  // }

  Future<void> searchByKey(String key) async {
    String cuisineType;
    String dishType;
    String mealType;

    if (_cuisineTypeValue == 'All') {
      cuisineType = '';
    } else {
      cuisineType = '&cuisineType=' + _cuisineTypeValue.replaceAll(' ', '%20');
    }
    if (_dishTypeValue == 'All') {
      dishType = '';
    } else {
      dishType = '&dishType=' + _dishTypeValue.replaceAll(' ', '%20');
    }
    if (_mealTypeValue == 'All') {
      mealType = '';
    } else {
      mealType = '&mealType=' + _mealTypeValue.replaceAll(' ', '%20');
    }

    final recipiess =
        await apiClient.getRecipiesByKey(key, cuisineType, mealType, dishType);
    _recipies = recipiess;
    notifyListeners();
  }
}

class RecipeModelProvider extends InheritedNotifier {
  final RecipeWidgetModel model;
  const RecipeModelProvider(
      {Key? key, required this.child, required this.model})
      : super(key: key, notifier: model, child: child);

  final Widget child;

  static RecipeModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RecipeModelProvider>();
  }

  static RecipeModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<RecipeModelProvider>()
        ?.widget;
    return widget is RecipeModelProvider ? widget : null;
  }
}
