import 'package:flutter/material.dart';
import 'package:food_analyzer/models/recipe.dart';
import 'package:food_analyzer/widgets/auth/auth_screen.dart';
import 'package:food_analyzer/widgets/main_screen/main_screen.dart';
import 'package:food_analyzer/widgets/main_screen/profile_fragment/calculating_history_page/calculating_history_page.dart';
import 'package:food_analyzer/widgets/main_screen/profile_fragment/favorite_list_page/favorite_list_page.dart';
import 'package:food_analyzer/widgets/main_screen/profile_fragment/settings_page/settings_page.dart';
import 'package:food_analyzer/widgets/main_screen/recipes_fragment/recipe_details_page/recipe_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodAnalyzator',
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthScreen(),
        '/main_screen': (context) => const MainScreen(),
        '/main_screen/recipe_details': (context) {
          final recipeObject =
              ModalRoute.of(context)!.settings.arguments as Recipe;
          return RecipeDetails(recipeObject: recipeObject);
        },
        '/main_screen/favorite_list': (context) => const FavoriteList(),
        '/main_screen/calculating_history': (context) =>
            const CalculatingHistory(),
        '/main_screen/settings': (context) => const Settings(),
      },
    );
  }
}
