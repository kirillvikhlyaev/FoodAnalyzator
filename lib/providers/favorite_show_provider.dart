import 'package:flutter/cupertino.dart';

import '../models/recipe.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class ShowFavoriteListModel extends ChangeNotifier {
  var _favoriteList = <Recipe>[];

  List<Recipe> get favoriteList => _favoriteList.toList();

  ShowFavoriteListModel() {
    _loadData();
  }

  void deleteRecipe(int index) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(RecipeAdapter());
    }
    final box = await Hive.openBox<Recipe>('favorite_recipies');
    await box.deleteAt(index);
  }

  void clearRecipeList() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(RecipeAdapter());
    }
    final box = await Hive.openBox<Recipe>('favorite_recipies');
    await box.clear();
  }

  void _loadData() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(RecipeAdapter());
    }
    final box = await Hive.openBox<Recipe>('favorite_recipies');

    _favoriteList = box.values.toList();
    notifyListeners();
    box.listenable().addListener(() {
      _favoriteList = box.values.toList();
      notifyListeners();
    });
  }
}
