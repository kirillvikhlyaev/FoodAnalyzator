import 'package:flutter/material.dart';
import 'package:food_analyzer/app_colors/app_colors.dart';
import 'package:food_analyzer/navigation/main_navigation.dart';
import 'package:food_analyzer/providers/favorite_show_provider.dart';
import 'package:food_analyzer/providers/inherited_provider_helper/inherited_helpers.dart';

class FavoriteList extends StatefulWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  State<FavoriteList> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  @override
  Widget build(BuildContext context) {
    final _model = ShowFavoriteListModel();
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.mainColor,
            title: const Text(
              'Favorite list',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            centerTitle: true),
        body: Container(
          color: AppColors.secondColor,
          child:
              ProviderNotifier(model: _model, child: const FavoriteListBody()),
        ));
  }
}

class FavoriteListBody extends StatefulWidget {
  const FavoriteListBody({Key? key}) : super(key: key);

  @override
  State<FavoriteListBody> createState() => _FavoriteListBodyState();
}

class _FavoriteListBodyState extends State<FavoriteListBody> {
  @override
  Widget build(BuildContext context) {
    final recipiesCount = ProviderNotifier.watch<ShowFavoriteListModel>(context)
            ?.favoriteList
            .length ??
        0;
    return ListView.separated(
        reverse: true,
        itemBuilder: (BuildContext context, int index) {
          return RecipiesRowWidget(index: index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 20);
        },
        itemCount: recipiesCount);
  }
}

class RecipiesRowWidget extends StatefulWidget {
  final int index;
  const RecipiesRowWidget({Key? key, required this.index}) : super(key: key);

  @override
  State<RecipiesRowWidget> createState() => _RecipiesRowWidgetState();
}

class _RecipiesRowWidgetState extends State<RecipiesRowWidget> {
  @override
  Widget build(BuildContext context) {
    final recipeList = ProviderNotifier.watch<ShowFavoriteListModel>(context)
        ?.favoriteList
        .toList();
    final recipe = recipeList![widget.index];

    void _onReadMoreButtonTap() {
      final recipeObject = recipe;
      Navigator.of(context).pushNamed(
          MainNavigationRouteNames.favoriteRecipeDetails,
          arguments: recipeObject);
    }

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Image(image: NetworkImage(recipe.imgURL)),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.title,
                  style: const TextStyle(
                      color: AppColors.secondDarkColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(recipe.dishtype.join(', '),
                    style: const TextStyle(
                        color: AppColors.secondColor, fontSize: 16)),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('${recipe.calories.round()} calories'),
                    Container(
                        height: 20, width: 1, color: AppColors.secondDarkColor),
                    Text('${recipe.totalTime.round()} minutes'),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () =>
                    ProviderNotifier.watch<ShowFavoriteListModel>(context)
                        ?.deleteRecipe(widget.index),
                child: const Text('Delete',
                    style: TextStyle(
                        color: Color.fromARGB(255, 204, 48, 0),
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                        const Color.fromARGB(50, 204, 48, 0))),
              ),
              const SizedBox(width: 10),
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
