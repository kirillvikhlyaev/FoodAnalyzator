import 'package:flutter/material.dart';
import 'package:food_analyzer/app_colors/app_colors.dart';
import 'package:food_analyzer/models/recipe.dart';

class RecipesFragment extends StatelessWidget {
  final List<Recipe> recipeData = [
    Recipe(
        id: 1,
        title: 'Sea food',
        description: 'Dietary recipe for delicious fish',
        image: const NetworkImage(
            'https://cdn.pixabay.com/photo/2014/11/05/15/57/salmon-518032_960_720.jpg')),
    Recipe(
        id: 2,
        title: 'Salad',
        description: 'Top 8 Salad Ingredients',
        image: const NetworkImage(
            'https://cdn.pixabay.com/photo/2017/09/16/19/21/salad-2756467_960_720.jpg')),
    Recipe(
        id: 3,
        title: 'Italian pizza',
        description:
            'This article describes how Italians prepare their pizza for real',
        image: const NetworkImage(
            'https://cdn.pixabay.com/photo/2017/12/10/14/47/pizza-3010062_960_720.jpg')),
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
  _onReadMoreButtonTap() {
    final recipeObject = widget.recipe;
    Navigator.of(context)
        .pushNamed('/main_screen/recipe_details', arguments: recipeObject);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgColor,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: widget.recipe.image),
          const SizedBox(height: 10),
          Text(
            widget.recipe.title,
            style: const TextStyle(
                color: AppColors.secondDarkColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          Text(widget.recipe.description),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: _onReadMoreButtonTap,
                child: const Text(
                  'Read more',
                  style: TextStyle(color: AppColors.mainColor, fontSize: 16),
                ),
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                        AppColors.overlayButtonColor)),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 5)
        ],
      ),
    );
  }
}
