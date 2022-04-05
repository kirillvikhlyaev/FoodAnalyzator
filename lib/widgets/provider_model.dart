import 'package:flutter/material.dart';
import 'package:food_analyzer/api_handler/api_handler.dart';
import 'package:food_analyzer/models/recipe.dart';

class RecipeWidgetModel extends ChangeNotifier {
  final apiClient = ApiClient();
  var _recipies = <Recipe>[];
  List<Recipe> get recipies => _recipies;

  // Future<void> reloadRecipies() async {
  //   final recipiess = await apiClient.getRecipies();
  //   _recipies = recipiess;
  //   notifyListeners();
  // }

  Future<void> searchByKey(String key) async {
    final recipiess = await apiClient.getRecipiesByKey(key);
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
