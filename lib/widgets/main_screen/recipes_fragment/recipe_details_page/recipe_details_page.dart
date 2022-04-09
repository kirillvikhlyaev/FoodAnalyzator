import 'package:flutter/material.dart';
import 'package:food_analyzer/app_colors/app_colors.dart';
import 'package:food_analyzer/models/recipe.dart';
import 'package:food_analyzer/providers/favorite_provider.dart';
import 'package:food_analyzer/providers/provider_model.dart';

class RecipeDetails extends StatefulWidget {
  final Recipe recipeObject;
  const RecipeDetails({Key? key, required this.recipeObject}) : super(key: key);

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  @override
  Widget build(BuildContext context) {
    final _model = AddToFavoriteListModel();
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
          child: FavoriteListProvider(
              model: _model, child: RecipeInfo(recipe: widget.recipeObject)),
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

        print(widget.recipe.title);
        FavoriteListProvider.watch(context)?.model.addToFavList(widget.recipe);

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
