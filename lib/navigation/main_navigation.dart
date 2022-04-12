import 'package:flutter/material.dart';
import 'package:food_analyzer/models/recipe.dart';
import 'package:food_analyzer/ui/widgets/auth/auth_screen.dart';
import 'package:food_analyzer/ui/widgets/auth/create_account_screen.dart';
import 'package:food_analyzer/ui/widgets/main_screen/main_screen.dart';
import 'package:food_analyzer/ui/widgets/main_screen/profile_fragment/calculating_history_page/calculating_history_page.dart';
import 'package:food_analyzer/ui/widgets/main_screen/profile_fragment/favorite_list_page/favorite_list_page.dart';
import 'package:food_analyzer/ui/widgets/main_screen/profile_fragment/favorite_list_page/favorite_recipe_details.dart';
import 'package:food_analyzer/ui/widgets/main_screen/profile_fragment/settings_page/settings_page.dart';
import 'package:food_analyzer/ui/widgets/main_screen/recipes_fragment/recipe_details_page/recipe_details_page.dart';

abstract class MainNavigationRouteNames {
  static const auth = '/auth';
  static const mainScreen = '/';
  static const favoriteList = '/main_screen/favorite_list';
  static const calcHistory = '/main_screen/calculating_history';
  static const settings = '/main_screen/settings';
  static const createAccount = '/auth/create_an_account';
  static const favoriteRecipeDetails =
      '/main_screen/favorite_list/favorite_recipe_details';
  static const recipeDetails = '/main_screen/recipe_details';
}

class MainNavigation {
  final initialRoute = MainNavigationRouteNames.auth;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.auth: (context) => const AuthScreen(),
    MainNavigationRouteNames.mainScreen: (context) => const MainScreen(),
    MainNavigationRouteNames.favoriteList: (context) => const FavoriteList(),
    MainNavigationRouteNames.calcHistory: (context) =>
        const CalculatingHistory(),
    MainNavigationRouteNames.settings: (context) => const Settings(),
    MainNavigationRouteNames.createAccount: (context) =>
        const CreateAccountScreen(),
  };
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.recipeDetails:
        final recipeObject = settings.arguments as Recipe;
        return MaterialPageRoute(builder: (context) {
          return RecipeDetails(recipeObject: recipeObject);
        });
      case MainNavigationRouteNames.favoriteRecipeDetails:
        final recipeObject = settings.arguments as Recipe;
        return MaterialPageRoute(builder: (context) {
          return FavoriteRecipeDetailsWidget(recipeObject: recipeObject);
        });
      default:
        const widget = Scaffold(body: Center(child: Text('Navigation error.')));
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
