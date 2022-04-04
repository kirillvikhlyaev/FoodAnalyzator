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
            widget.recipeObject.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: RecipeInfo(recipe: widget.recipeObject),
        ),
      ),
    );
  }
}

class RecipeInfo extends StatefulWidget {
  final Recipe recipe;
  bool isFavorite = false;
  RecipeInfo({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeInfo> createState() => _RecipeInfoState();
}

class _RecipeInfoState extends State<RecipeInfo> {
  IconData favIcon = Icons.favorite_outline;
  @override
  Widget build(BuildContext context) {
    void onFavTapToggle() {
      widget.isFavorite = !widget.isFavorite;

      if (widget.isFavorite) {
        favIcon = Icons.favorite;

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Add to your favorite list!'),
          action: SnackBarAction(
            label: 'SHOW',
            onPressed: () {
              Navigator.of(context).pushNamed('/main_screen/favorite_list');
            },
          ),
        ));
      } else {
        favIcon = Icons.favorite_outline;
      }

      setState(() {});
    }

    return Column(
      children: [
        Image(image: widget.recipe.image),
        const SizedBox(height: 15),
        Text(
          widget.recipe.description,
          style: const TextStyle(fontSize: 16),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: onFavTapToggle,
                icon: Icon(favIcon),
                color: AppColors.secondDarkColor)
          ],
        )
      ],
    );
  }
}
