import 'package:flutter/material.dart';
import 'package:food_analyzer/app_colors/app_colors.dart';
import 'package:food_analyzer/models/recipe.dart';

class FavoriteRecipeDetailsWidget extends StatefulWidget {
  final Recipe recipeObject;
  const FavoriteRecipeDetailsWidget({Key? key, required this.recipeObject})
      : super(key: key);

  @override
  State<FavoriteRecipeDetailsWidget> createState() =>
      _FavoriteRecipeDetailsWidgetState();
}

class _FavoriteRecipeDetailsWidgetState
    extends State<FavoriteRecipeDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: Text(
            widget.recipeObject.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: _RecipeInfo(recipe: widget.recipeObject)),
      ),
    );
  }
}

class _RecipeInfo extends StatefulWidget {
  final Recipe recipe;
  bool isFavorite = false;
  _RecipeInfo({Key? key, required this.recipe}) : super(key: key);

  @override
  State<_RecipeInfo> createState() => _RecipeInfoState();
}

class _RecipeInfoState extends State<_RecipeInfo> {
  IconData favIcon = Icons.favorite_outline;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: NetworkImage(widget.recipe.imgURL, scale: 0.5)),
        const SizedBox(height: 15),
        const Text('Information: ',
            style: TextStyle(
                color: AppColors.secondDarkColor,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: 'Cusine: ',
                    style: TextStyle(
                        color: AppColors.secondDarkColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16)),
                TextSpan(
                    text: widget.recipe.cuisineType.join(", "),
                    style: const TextStyle(
                        color: AppColors.secondDarkColor, fontSize: 16)),
              ])),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: 'Meal type: ',
                    style: TextStyle(
                        color: AppColors.secondDarkColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16)),
                TextSpan(
                    text: widget.recipe.mealType.join(", "),
                    style: const TextStyle(
                        color: AppColors.secondDarkColor, fontSize: 16)),
              ])),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: 'Dish type: ',
                    style: TextStyle(
                        color: AppColors.secondDarkColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16)),
                TextSpan(
                    text: widget.recipe.dishtype.join(", "),
                    style: const TextStyle(
                        color: AppColors.secondDarkColor, fontSize: 16)),
              ])),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: 'Total time: ',
                    style: TextStyle(
                        color: AppColors.secondDarkColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16)),
                TextSpan(
                    text: '${widget.recipe.totalTime.round()} minutes',
                    style: const TextStyle(
                        color: AppColors.secondDarkColor, fontSize: 16)),
              ])),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: 'Calories: ',
                    style: TextStyle(
                        color: AppColors.secondDarkColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16)),
                TextSpan(
                    text: '${widget.recipe.calories.round()} ccal',
                    style: const TextStyle(
                        color: AppColors.secondDarkColor, fontSize: 16)),
              ])),
            ],
          ),
        ),
        const SizedBox(height: 15),
        const Divider(),
        const SizedBox(height: 15),
        const Text('Ingedients: ',
            style: TextStyle(
                color: AppColors.secondDarkColor,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 15),
        Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '- ' + widget.recipe.ingredientLines.join(';\n- '),
                  style: const TextStyle(
                      fontSize: 16, color: AppColors.secondDarkColor),
                ),
              ],
            )),
      ],
    );
  }
}
