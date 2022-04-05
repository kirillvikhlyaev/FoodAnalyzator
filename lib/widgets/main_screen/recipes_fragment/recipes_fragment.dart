import 'package:flutter/material.dart';
import 'package:food_analyzer/app_colors/app_colors.dart';
import 'package:food_analyzer/models/recipe.dart';
import 'package:food_analyzer/widgets/provider_model.dart';

class RecipesFragment extends StatefulWidget {
  RecipesFragment({Key? key}) : super(key: key);

  @override
  State<RecipesFragment> createState() => _RecipesFragmentState();
}

class _RecipesFragmentState extends State<RecipesFragment> {
  final model = RecipeWidgetModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondColor,
      child: RecipeModelProvider(
        model: model,
        child: Column(
          children: [
            RecipeInfo(),
            const Expanded(child: _RecipiesWidget()),
          ],
        ),
      ),
    );
  }
}

class RecipeInfo extends StatefulWidget {
  RecipeInfo({Key? key}) : super(key: key);

  @override
  State<RecipeInfo> createState() => _RecipeInfoState();
}

class _RecipeInfoState extends State<RecipeInfo> {
  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    void onSearchTap() {
      RecipeModelProvider.read(context)?.model.searchByKey(controller.text);
      setState(() {});
    }

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                labelText: 'Ingredient',
                labelStyle: const TextStyle(color: AppColors.secondColor),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                        width: 0, color: AppColors.secondColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                        width: 0, color: AppColors.secondColor))),
            controller: controller,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                  onPressed: onSearchTap,
                  child: const Text('Search',
                      style: TextStyle(color: AppColors.mainColor))),
              // const SizedBox(width: 20),
              // OutlinedButton(
              //     onPressed: () =>
              //         RecipeModelProvider.read(context)?.model.reloadRecipies(),
              //     child: const Text('SHOW',
              //         style: TextStyle(color: AppColors.mainColor))),
            ],
          ),
        ],
      ),
    );
  }
}

class _RecipiesWidget extends StatelessWidget {
  const _RecipiesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: RecipeModelProvider.watch(context)?.model.recipies.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return RecioiesRowWidget(index: index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 20);
      },
    );
    // return Container();
  }
}

class RecioiesRowWidget extends StatefulWidget {
  final int index;
  const RecioiesRowWidget({Key? key, required this.index}) : super(key: key);

  @override
  State<RecioiesRowWidget> createState() => _RecioiesRowWidgetState();
}

class _RecioiesRowWidgetState extends State<RecioiesRowWidget> {
  @override
  Widget build(BuildContext context) {
    final recipe =
        RecipeModelProvider.read(context)!.model.recipies[widget.index];

    void _onReadMoreButtonTap() {
      final recipeObject = recipe;
      Navigator.of(context)
          .pushNamed('/main_screen/recipe_details', arguments: recipeObject);
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
                Text('${recipe.dishtype.join()}',
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


// -------------------------------------------------------------
// ListView.separated(
//         itemCount: recipeItems.length,
//         itemBuilder: (BuildContext context, int index) {
//           return recipeItems[index];
//         },
//         separatorBuilder: (BuildContext context, int index) {
//           return const SizedBox(height: 15);
//         },
//       ),
// -------------------------------------------------------------
// class RecipeItem extends StatefulWidget {
//   final Recipe recipe;
//   const RecipeItem({Key? key, required this.recipe}) : super(key: key);

//   @override
//   State<RecipeItem> createState() => _RecipeItemState();
// }

// class _RecipeItemState extends State<RecipeItem> {
  // _onReadMoreButtonTap() {
  //   final recipeObject = widget.recipe;
  //   Navigator.of(context)
  //       .pushNamed('/main_screen/recipe_details', arguments: recipeObject);
  // }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: AppColors.bgColor,
//       padding: const EdgeInsets.all(10),
      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Image(image: widget.recipe.image),
      //     const SizedBox(height: 10),
      //     Text(
      //       widget.recipe.title,
      //       style: const TextStyle(
      //           color: AppColors.secondDarkColor,
      //           fontSize: 16,
      //           fontWeight: FontWeight.w600),
      //     ),
      //     const SizedBox(height: 10),
      //     Text(widget.recipe.description),
      //     const SizedBox(height: 5),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.end,
      //       children: [
      //         TextButton(
      //           onPressed: _onReadMoreButtonTap,
      //           child: const Text(
      //             'Read more',
      //             style: TextStyle(color: AppColors.mainColor, fontSize: 16),
      //           ),
      //           style: ButtonStyle(
      //               overlayColor: MaterialStateProperty.all(
      //                   AppColors.overlayButtonColor)),
      //         ),
      //         const SizedBox(width: 10),
      //       ],
      //     ),
      //     const SizedBox(height: 5)
      //   ],
      // ),
//     );
//   }
// }
