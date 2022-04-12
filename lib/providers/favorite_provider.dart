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
