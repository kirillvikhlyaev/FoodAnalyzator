import 'package:flutter/material.dart';
import 'package:food_analyzer/app_colors/app_colors.dart';
import 'package:food_analyzer/models/featuresdata.dart';
import 'package:food_analyzer/navigation/main_navigation.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ProfileInfo(),
        UserFeatureList(),
      ],
    );
  }
}

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        SizedBox(height: 20),
        CircleAvatar(
          child: Icon(
            Icons.person,
            size: 100,
            color: AppColors.secondDarkColor,
          ),
          backgroundColor: AppColors.secondColor,
          radius: 60.0,
        ),
        SizedBox(height: 10),
        Text('Username',
            style: TextStyle(
                color: AppColors.secondDarkColor,
                fontSize: 20,
                fontWeight: FontWeight.w700)),
        SizedBox(height: 20)
      ],
    );
  }
}

class UserFeatureList extends StatefulWidget {
  final List<FeatureData> data = [
    FeatureData(
        id: 1, icon: Icons.history, nameOfFeature: 'Calculating history'),
    FeatureData(
        id: 2,
        icon: Icons.favorite_border_outlined,
        nameOfFeature: 'Favorite recipes'),
    FeatureData(id: 3, icon: Icons.settings, nameOfFeature: 'Settings')
  ];

  UserFeatureList({Key? key}) : super(key: key);
  @override
  State<UserFeatureList> createState() => _UserFeatureListState();
}

class _UserFeatureListState extends State<UserFeatureList> {
  @override
  Widget build(BuildContext context) {
    final List<UserFeatureListItem> userFeatureListItems = widget.data
        .map((FeatureData item) => UserFeatureListItem(data: item))
        .toList();
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: userFeatureListItems,
      ),
    );
  }
}

class UserFeatureListItem extends StatefulWidget {
  final FeatureData data;
  const UserFeatureListItem({Key? key, required this.data}) : super(key: key);

  @override
  State<UserFeatureListItem> createState() => _UserFeatureListItemState();
}

class _UserFeatureListItemState extends State<UserFeatureListItem> {
  @override
  Widget build(BuildContext context) {
    void _OnFeatureTap() {
      switch (widget.data.id) {
        case 1:
          Navigator.of(context).pushNamed(MainNavigationRouteNames.calcHistory);
          break;
        case 2:
          Navigator.of(context)
              .pushNamed(MainNavigationRouteNames.favoriteList);
          break;
        case 3:
          Navigator.of(context).pushNamed(MainNavigationRouteNames.settings);
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
                    size: 20, color: AppColors.secondDarkColor),
                const SizedBox(width: 10),
                Text(widget.data.nameOfFeature),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios,
                    size: 15, color: AppColors.secondDarkColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*

  Вариант: Под юзернеймом сделать календарную рулетку и 
          нижу нее добавить окно с отобращением калирий,
          возможно, вес

*/
