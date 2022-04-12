import 'package:flutter/material.dart';
import 'package:food_analyzer/app_colors/app_colors.dart';
import 'package:food_analyzer/providers/calculating_history_save_provider.dart';
import 'package:food_analyzer/providers/inherited_provider_helper/inherited_helpers.dart';

class CalculatingHistory extends StatefulWidget {
  const CalculatingHistory({Key? key}) : super(key: key);

  @override
  State<CalculatingHistory> createState() => _CalculatingHistoryState();
}

class _CalculatingHistoryState extends State<CalculatingHistory> {
  final _model = SaveToHistoryModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.mainColor,
            title: const Text(
              'Calculating history',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            centerTitle: true),
        body: Container(
          color: AppColors.secondColor,
          child: ProviderNotifier(model: _model, child: ListOfHistory()),
        ));
  }
}

class ListOfHistory extends StatefulWidget {
  const ListOfHistory({Key? key}) : super(key: key);

  @override
  State<ListOfHistory> createState() => _ListOfHistoryState();
}

class _ListOfHistoryState extends State<ListOfHistory> {
  @override
  Widget build(BuildContext context) {
    var elementsCount = ProviderNotifier.watch<SaveToHistoryModel>(context)
            ?.calcHistoryList
            .length ??
        0;
    return ListView.separated(
      reverse: false,
      itemBuilder: (BuildContext context, int index) {
        return ItemOfHistory(index: index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(height: 1);
      },
      itemCount: elementsCount,
    );
  }
}

class ItemOfHistory extends StatelessWidget {
  final int index;
  const ItemOfHistory({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void deleteFromHistory(int index) {
      ProviderNotifier.read<SaveToHistoryModel>(context)
          ?.removeFromCalcHistory(index);
    }

    final item = ProviderNotifier.read<SaveToHistoryModel>(context)!
        .calcHistoryList[index];
    return ColoredBox(
      color: Colors.white,
      child: ListTile(
        leading: Text('${index + 1}',
            style: TextStyle(color: AppColors.secondDarkColor, fontSize: 16)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(item.name,
                style: TextStyle(
                    color: AppColors.secondDarkColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            Text('${item.calories} kcal',
                style:
                    TextStyle(color: AppColors.secondDarkColor, fontSize: 16)),
            Text('${item.totalWeight} g',
                style:
                    TextStyle(color: AppColors.secondDarkColor, fontSize: 16)),
          ],
        ),
        trailing: IconButton(
            icon: Icon(Icons.close), onPressed: () => deleteFromHistory(index)),
      ),
    );
  }
}
