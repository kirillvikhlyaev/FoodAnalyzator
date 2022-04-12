import 'package:flutter/material.dart';
import 'package:food_analyzer/models/ingredient.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class SaveToHistoryModel extends ChangeNotifier {
  var _calcHistoryList = <Ingredient>[];

  List<Ingredient> get calcHistoryList => _calcHistoryList.toList();

  SaveToHistoryModel() {
    _loadData();
  }

  void _loadData() async {
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(IngredientAdapter());
    }
    final box = await Hive.openBox<Ingredient>('calc_history');
    _calcHistoryList = box.values.toList();
    notifyListeners();
    box.listenable().addListener(() {
      _calcHistoryList = box.values.toList();
      notifyListeners();
    });
  }

  void removeFromCalcHistory(int index) async {
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(IngredientAdapter());
    }
    final box = await Hive.openBox<Ingredient>('calc_history');
    box.deleteAt(index);
  }

  void clearCalcHistory() async {
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(IngredientAdapter());
    }
    final box = await Hive.openBox<Ingredient>('calc_history');
    box.clear();
  }
}
