import 'package:flutter/material.dart';
import 'package:food_analyzer/api_handler/nutrion_analysis_api_handler.dart';
import 'package:food_analyzer/models/ingredient.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class NutrionAnalysisModel extends ChangeNotifier {
  final apiClient = NutrionsApiHandler();
  var ingredient = Ingredient(name: '', calories: 0, totalWeight: 0);

  Future<void> analysisByIngredient(String key, bool save) async {
    ingredient = await NutrionsApiHandler().getNutrionAnalysis(key);

    if (save) {
      if (!Hive.isAdapterRegistered(2)) {
        Hive.registerAdapter(IngredientAdapter());
      }
      final box = await Hive.openBox<Ingredient>('calc_history');
      await box.add(ingredient);
    }

    notifyListeners();
  }

  void addToCalcHistory() async {}
}
