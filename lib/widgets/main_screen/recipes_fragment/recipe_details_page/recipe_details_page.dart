import 'package:flutter/material.dart';
import 'package:food_analyzer/app_colors/app_colors.dart';
import 'package:food_analyzer/models/recipe.dart';

class RecipeDetails extends StatefulWidget {
  final Recipe recipeObject;
  const RecipeDetails({Key? key, required this.recipeObject}) : super(key: key);

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: Text(
            'Recipe details #${widget.recipeObject.id}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: RecipeInfo(recipe: widget.recipeObject),
        ),
      ),
    );
  }
}

class RecipeInfo extends StatelessWidget {
  final Recipe recipe;
  const RecipeInfo({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(recipe.title,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.secondDarkColor)),
        Image(image: recipe.image),
        Text(
          recipe.description,
          style: const TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
