import 'package:flutter/material.dart';
import 'package:food_analyzer/app_colors/app_colors.dart';
import 'package:food_analyzer/models/featuresdata.dart';
import 'package:food_analyzer/navigation/main_navigation.dart';
import 'package:food_analyzer/providers/calculating_history_save_provider.dart';
import 'package:food_analyzer/providers/favorite_show_provider.dart';
import 'package:food_analyzer/providers/inherited_provider_helper/inherited_helpers.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.mainColor,
            title: const Text(
              'Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            centerTitle: true),
        body: Container(
          color: AppColors.bgColor,
          child: SettingsList(),
        ));
  }
}

class SettingsList extends StatefulWidget {
  SettingsList({Key? key}) : super(key: key);

  @override
  State<SettingsList> createState() => _SettingsListState();
}

class _SettingsListState extends State<SettingsList> {
  final _favModel = ShowFavoriteListModel();
  final _calcModel = SaveToHistoryModel();
  final List<FeatureData> data = [
    FeatureData(
        id: 1,
        icon: Icons.delete_forever,
        nameOfFeature: 'Clear calculating history'),
    FeatureData(
        id: 2,
        icon: Icons.delete_forever,
        nameOfFeature: 'Delete favorite recipies'),
    FeatureData(id: 3, icon: Icons.logout, nameOfFeature: 'Log out')
  ];

  @override
  Widget build(BuildContext context) {
    final List<SettingsItem> settingsItems =
        data.map((FeatureData item) => SettingsItem(data: item)).toList();
    return SimpleProvider(
      model: _calcModel,
      child: ProviderNotifier(
        model: _favModel,
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return SettingsItem(data: data[index]);
          },
          itemCount: settingsItems.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        ),
      ),
    );
  }
}

class SettingsItem extends StatefulWidget {
  final FeatureData data;
  SettingsItem({Key? key, required this.data}) : super(key: key);

  @override
  State<SettingsItem> createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  @override
  Widget build(BuildContext context) {
    void _OnFeatureTap() {
      switch (widget.data.id) {
        case 1:
          SimpleProvider.read<SaveToHistoryModel>(context)?.clearCalcHistory();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('History cleared'),
              duration: Duration(seconds: 1)));
          break;
        case 2:
          ProviderNotifier.watch<ShowFavoriteListModel>(context)
              ?.clearRecipeList();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                'Favorite list cleared',
              ),
              duration: Duration(seconds: 1)));
          break;
        case 3:
          Navigator.of(context).pushNamed(MainNavigationRouteNames.auth);
          break;
      }
    }

    return InkWell(
      onTap: _OnFeatureTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Icon(widget.data.icon,
                    size: 25, color: AppColors.secondDarkColor),
                const SizedBox(width: 10),
                Text(widget.data.nameOfFeature, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
