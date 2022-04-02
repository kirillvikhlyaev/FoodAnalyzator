import 'package:flutter/material.dart';
import 'package:food_analyzer/app_colors/app_colors.dart';

class RecipesFragment extends StatelessWidget {
  const RecipesFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondColor,
      child: ListView(
        //Поменять на ListView.separator, чтобы разделителем являся SizedBox
        children: [
          RecipeItem(),
          SizedBox(height: 10),
          RecipeItem(),
          SizedBox(height: 10),
          RecipeItem(),
          SizedBox(height: 10),
          RecipeItem(),
        ],
      ),
    );
  }
}

class RecipeItem extends StatefulWidget {
  const RecipeItem({Key? key}) : super(key: key);

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
          Placeholder(
            fallbackWidth: double.infinity,
            fallbackHeight: 200,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Name of dish',
            style: TextStyle(
                color: AppColors.secondDarkColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text('Decription...'),
          SizedBox(
            height: 5,
          ),
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
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}

class Recipe {
  final ImageProvider recipeImage;
  final String recipeTitle;
  final String recipeDecription;

  Recipe(this.recipeImage, this.recipeTitle, this.recipeDecription);
}
