import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_analyzer/app_colors/app_colors.dart';

class RecipesFragment extends StatelessWidget {
  final List<Recipe> recipeData = [
    Recipe(
        recipeImage: const NetworkImage(
            'https://cdn.pixabay.com/photo/2014/11/05/15/57/salmon-518032_960_720.jpg'),
        recipeTitle: 'Sea food',
        recipeDecription: 'Dietary recipe for delicious fish'),
    Recipe(
        recipeImage: const NetworkImage(
            'https://cdn.pixabay.com/photo/2017/09/16/19/21/salad-2756467_960_720.jpg'),
        recipeTitle: 'Salad',
        recipeDecription: 'Top 8 Salad Ingredients'),
    Recipe(
        recipeImage: const NetworkImage(
            'https://cdn.pixabay.com/photo/2017/12/10/14/47/pizza-3010062_960_720.jpg'),
        recipeTitle: 'Italian pizza',
        recipeDecription:
            'This article describes how Italians prepare their pizza for real'),
  ];

  RecipesFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<RecipeItem> recipeItems =
        recipeData.map((Recipe e) => RecipeItem(recipe: e)).toList();

    return Container(
      color: AppColors.secondColor,
      child: ListView.separated(
        itemCount: recipeItems.length,
        itemBuilder: (BuildContext context, int index) {
          return recipeItems[index];
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 15);
        },
      ),
    );
  }
}

class RecipeItem extends StatefulWidget {
  final Recipe recipe;
  const RecipeItem({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeItem> createState() => _RecipeItemState();
}

class _RecipeItemState extends State<RecipeItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgColor,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: widget.recipe.recipeImage),
          SizedBox(height: 10),
          Text(
            widget.recipe.recipeTitle,
            style: TextStyle(
                color: AppColors.secondDarkColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10),
          Text(widget.recipe.recipeDecription),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Read more',
                    style: TextStyle(color: AppColors.mainColor, fontSize: 16),
                  )),
              SizedBox(width: 10),
            ],
          ),
          SizedBox(height: 5)
        ],
      ),
    );
  }
}

class Recipe {
  final NetworkImage recipeImage;
  final String recipeTitle;
  final String recipeDecription;

  Recipe(
      {required this.recipeImage,
      required this.recipeTitle,
      required this.recipeDecription});
}
