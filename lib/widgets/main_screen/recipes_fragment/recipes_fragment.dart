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
  final ApiModel = RecipeWidgetModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondColor,
      child: RecipeModelProvider(
        model: ApiModel,
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

  bool isFilteredSearchVisible = false;
  IconData filteredIcon = Icons.arrow_downward;

  @override
  State<RecipeInfo> createState() => _RecipeInfoState();
}

class _RecipeInfoState extends State<RecipeInfo> {
  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();

    void OnAdvancedSearchTap() {
      widget.isFilteredSearchVisible = !widget.isFilteredSearchVisible;
      if (!widget.isFilteredSearchVisible)
        widget.filteredIcon = Icons.arrow_downward;
      else
        widget.filteredIcon = Icons.arrow_upward;
      print(widget.isFilteredSearchVisible);
      setState(() {});
    }

    void onSearchTap() {
      widget.isFilteredSearchVisible = false;
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
          Visibility(
            visible: widget.isFilteredSearchVisible,
            child: _AdvansedSearchField(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                onPressed: OnAdvancedSearchTap,
                child: Row(children: [
                  const Text('Filtered search',
                      style: TextStyle(color: AppColors.mainColor)),
                  const SizedBox(width: 10),
                  Icon(widget.filteredIcon, color: AppColors.mainColor),
                ]),
              ),
              const SizedBox(width: 10),
              OutlinedButton(
                  onPressed: onSearchTap,
                  child: const Text('Search',
                      style: TextStyle(color: AppColors.mainColor))),
            ],
          ),
        ],
      ),
    );
  }
}

class _AdvansedSearchField extends StatefulWidget {
  const _AdvansedSearchField({Key? key}) : super(key: key);

  @override
  State<_AdvansedSearchField> createState() => __AdvansedSearchFieldState();
}

class __AdvansedSearchFieldState extends State<_AdvansedSearchField> {
  String cuisineTypeValue = 'All';
  String dishTypeValue = 'All';
  String mealTypeValue = 'All';

  List<String> cuisineTypes = [
    'All',
    'American',
    'Asian',
    'British',
    'Caribbean',
    'Central Europe',
    'Chinese',
    'Eastern Europe',
    'French',
    'Indian',
    'Italian',
    'Japanese',
    'Kosher',
    'Mediterranean',
    'Mexican',
    'Middle Eastern',
    'Nordic',
    'South American',
    'South East Asian'
  ];
  List<String> dishTypes = [
    'All',
    'Biscuits and cookies',
    'Bread',
    'Cereals',
    'Condiments and sauces',
    'Desserts',
    'Drinks',
    'Main course',
    'Pancake',
    'Preps',
    'Preserve',
    'Salad',
    'Sandwiches',
    'Side dish',
    'Soup',
    'Starter',
    'Sweets'
  ];
  List<String> mealTypes = [
    'All',
    'Breakfast',
    'Dinner',
    'Lunch',
    'Snack',
    'Teatime'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Cuisin type:',
                  style: TextStyle(
                      color: AppColors.secondDarkColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              DropdownButton<String>(
                value: cuisineTypeValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(
                  color: AppColors.secondDarkColor,
                  fontSize: 16,
                ),
                underline: Container(
                  height: 2,
                  color: AppColors.appBarColor,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    cuisineTypeValue = newValue!;
                    RecipeModelProvider.read(context)?.model.cuisineTypeValue =
                        cuisineTypeValue;
                  });
                },
                items:
                    cuisineTypes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Dish type:',
                  style: TextStyle(
                      color: AppColors.secondDarkColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              DropdownButton<String>(
                value: dishTypeValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(
                  color: AppColors.secondDarkColor,
                  fontSize: 16,
                ),
                underline: Container(
                  height: 2,
                  color: AppColors.appBarColor,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dishTypeValue = newValue!;
                    RecipeModelProvider.read(context)?.model.dishTypeValue =
                        dishTypeValue;
                  });
                },
                items: dishTypes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Meal type:',
                  style: TextStyle(
                      color: AppColors.secondDarkColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              DropdownButton<String>(
                value: mealTypeValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(
                  color: AppColors.secondDarkColor,
                  fontSize: 16,
                ),
                underline: Container(
                  height: 2,
                  color: AppColors.appBarColor,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    mealTypeValue = newValue!;
                    RecipeModelProvider.read(context)?.model.mealTypeValue =
                        mealTypeValue;
                  });
                },
                items: mealTypes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
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
        return RecipiesRowWidget(index: index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 20);
      },
    );
    // return Container();
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
                Text(recipe.dishtype.join(", "),
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
