import 'package:flutter/material.dart';
import 'package:food_analyzer/api_handler/nutrion_analysis_api_handler.dart';
import 'package:food_analyzer/app_colors/app_colors.dart';
import 'package:food_analyzer/providers/calculating_history_save_provider.dart';
import 'package:food_analyzer/providers/inherited_provider_helper/inherited_helpers.dart';
import 'package:food_analyzer/providers/nutrion_analysis_provider.dart';

class CalculatingFragment extends StatefulWidget {
  const CalculatingFragment({Key? key}) : super(key: key);

  @override
  State<CalculatingFragment> createState() => _CalculatingFragmentState();
}

class _CalculatingFragmentState extends State<CalculatingFragment> {
  final _model = NutrionAnalysisModel();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ProviderNotifier(
        model: _model,
        child: Column(
          children: const [
            CalculateInfoWidget(),
            CalculateResult(),
            CalculateWidget(),
          ],
        ),
      ),
    );
  }
}

class CalculateResult extends StatefulWidget {
  const CalculateResult({Key? key}) : super(key: key);

  @override
  State<CalculateResult> createState() => _CalculateResultState();
}

class _CalculateResultState extends State<CalculateResult> {
  @override
  Widget build(BuildContext context) {
    final model = ProviderNotifier.watch<NutrionAnalysisModel>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Table(
        border: TableBorder.all(),
        columnWidths: const <int, TableColumnWidth>{
          0: FlexColumnWidth(),
          1: FlexColumnWidth(),
          2: FlexColumnWidth(),
          3: FlexColumnWidth(),
          4: FlexColumnWidth(),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: <TableRow>[
          const TableRow(children: [
            Center(
              child: Text('Quantity',
                  style: TextStyle(
                      color: AppColors.secondDarkColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
            Center(
              child: Text('Unit',
                  style: TextStyle(
                      color: AppColors.secondDarkColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
            Center(
              child: Text('Food',
                  style: TextStyle(
                      color: AppColors.secondDarkColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
            Center(
              child: Text('Calories',
                  style: TextStyle(
                      color: AppColors.secondDarkColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
            Center(
              child: Text('Weight',
                  style: TextStyle(
                      color: AppColors.secondDarkColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            )
          ]),
          TableRow(children: [
            const Center(
              child: Text('1',
                  style: TextStyle(
                      color: AppColors.secondDarkColor, fontSize: 16)),
            ),
            const Center(
              child: Text('whole',
                  style: TextStyle(
                      color: AppColors.secondDarkColor, fontSize: 16)),
            ),
            Center(
              child: Text(model!.ingredient.name,
                  style: const TextStyle(
                      color: AppColors.secondDarkColor, fontSize: 16)),
            ),
            Center(
              child: Text('${model.ingredient.calories} kcal',
                  style: const TextStyle(
                      color: AppColors.secondDarkColor, fontSize: 16)),
            ),
            Center(
              child: Text('${model.ingredient.totalWeight} g',
                  style: const TextStyle(
                      color: AppColors.secondDarkColor, fontSize: 16)),
            )
          ])
        ],
      ),
    );
  }
}

class CalculateInfoWidget extends StatelessWidget {
  const CalculateInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: const Text(
          'On this page you can count the calories in your products, add to the history something that helps to find out how much you consumed that day',
          style: TextStyle(color: AppColors.secondDarkColor, fontSize: 16)),
    );
  }
}

class CalculateWidget extends StatefulWidget {
  const CalculateWidget({Key? key}) : super(key: key);

  @override
  State<CalculateWidget> createState() => _CalculateWidgetState();
}

class _CalculateWidgetState extends State<CalculateWidget> {
  bool isChecked = false;
  final ingredientController = TextEditingController();

  void onCalculateTap() {
    ProviderNotifier.watch<NutrionAnalysisModel>(context)
        ?.analysisByIngredient(ingredientController.text, isChecked);
    ingredientController.text = '';
    if (isChecked) {
      isChecked = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Write the ingredient',
              labelStyle: const TextStyle(color: AppColors.secondColor),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      const BorderSide(width: 0, color: AppColors.secondColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      const BorderSide(width: 0, color: AppColors.secondColor)),
            ),
            controller: ingredientController,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Checkbox(
                  fillColor: MaterialStateProperty.all(AppColors.mainColor),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  }),
              const Text('Add to history?',
                  style: TextStyle(color: AppColors.secondColor, fontSize: 16)),
              const SizedBox(width: 15),
              ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 15)),
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.mainColor),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)))),
                onPressed: onCalculateTap,
                child: const Text(
                  'Calculate',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
