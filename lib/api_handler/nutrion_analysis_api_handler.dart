import 'dart:convert';
import 'dart:io';

import 'package:food_analyzer/models/ingredient.dart';

class NutrionsApiHandler {
  final client = HttpClient();

  Future<Ingredient> getNutrionAnalysis(String ingredient) async {
    //APIs keys field
    final url = Uri.parse(
        'https://api.edamam.com/api/nutrition-data?app_id=$APPID&app_key=$APPKEY&nutrition-type=logging&ingr=$ingredient');
    final request = await client.getUrl(url);
    final response = await request.close();
    final jsonStrings = await response.transform(utf8.decoder).toList();

    final jsonString = jsonStrings.join();
    final json = jsonDecode(jsonString) as Map<String, dynamic>;

    final recipe = Ingredient(
        name: ingredient,
        calories: json['calories'],
        totalWeight: json['totalWeight'] as double);

    return recipe;
  }
}
