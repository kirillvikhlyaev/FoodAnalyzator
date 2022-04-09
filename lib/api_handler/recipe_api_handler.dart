import 'dart:convert';
import 'dart:io';

import 'package:food_analyzer/models/recipe.dart';

class RecipeApiClient {
  final client = HttpClient();

  Future<List<Recipe>> getRecipiesByKey(
      String key, String cuisinType, String mealType, String dishType) async {
    List<Recipe> recList = [];

    const APPID = '6d380312';
    const APPKEY = '87bd4b90aa93c4dc4d12c92ba7f46672';

    final url = Uri.parse(
        'https://api.edamam.com/api/recipes/v2?type=public&q=${key}&app_id=${APPID}&app_key=${APPKEY}' +
            cuisinType +
            mealType +
            dishType);
    final request = await client.getUrl(url);
    final response = await request.close();
    final jsonStrings = await response.transform(utf8.decoder).toList();

    final jsonString = jsonStrings.join();
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    final recipe = JsonData.fromJson(json).hits;

    for (int i = 0; i < recipe.length; i++) {
      // Наполняем список полученными рецептами
      final rec = Recipe(
          title: recipe[i]['recipe']['label'],
          imgURL: recipe[i]['recipe']['image'],
          calories: recipe[i]['recipe']['calories'],
          totalTime: recipe[i]['recipe']['totalTime'],
          dishtype: recipe[i]['recipe']['dishType'] as List<dynamic>,
          cuisineType: recipe[i]['recipe']['cuisineType'] as List<dynamic>,
          mealType: recipe[i]['recipe']['mealType'] as List<dynamic>,
          ingredientLines:
              recipe[i]['recipe']['ingredientLines'] as List<dynamic>);
      recList.add(rec);
    }

    return recList;
  }
}

class JsonData {
  final int from;
  final int to;
  final int count;
  final Map<String, dynamic> links;
  final List<dynamic> hits;

  JsonData(
      {required this.from,
      required this.to,
      required this.count,
      required this.links,
      required this.hits});

  factory JsonData.fromJson(Map<String, dynamic> json) {
    return JsonData(
        from: json['from'] as int,
        to: json['to'] as int,
        count: json['count'] as int,
        links: json['_links'] as Map<String, dynamic>,
        hits: json['hits'] as List<dynamic>);
  }
}
