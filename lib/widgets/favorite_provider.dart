import 'package:flutter/material.dart';

import '../models/recipe.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class AddToFavoriteListModel {
  void addToFavList(Recipe recipe) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(RecipeAdapter());
    }
    final box = await Hive.openBox<Recipe>('favorite_recipies');
    await box.add(recipe);
  }
}

class FavoriteListProvider extends InheritedWidget {
  final AddToFavoriteListModel model;
  const FavoriteListProvider(
      {Key? key, required this.model, required Widget child})
      : super(key: key, child: child);

  static FavoriteListProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<FavoriteListProvider>()
        ?.widget;
    return widget is FavoriteListProvider ? widget : null;
  }

  static FavoriteListProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FavoriteListProvider>();
  }

  @override
  bool updateShouldNotify(FavoriteListProvider oldWidget) {
    return true;
  }
}
