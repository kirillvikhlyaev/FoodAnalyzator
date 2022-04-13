import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_analyzer/app_colors/app_colors.dart';
import 'package:food_analyzer/models/featuresdata.dart';
import 'package:food_analyzer/navigation/main_navigation.dart';
import 'package:image_picker/image_picker.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProfileInfo(),
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
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _selectImage() async {
    try {
      final img = await _picker.pickImage(source: ImageSource.gallery);
      if (img == null) return;

      final imgTemp = File(img.path);
      print("Загружено");
      setState(() {
        _image = imgTemp;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Stack(
          children: [
            ClipOval(
              child: CircleAvatar(
                child: _image == null
                    ? const Icon(
                        Icons.person,
                        size: 100,
                        color: AppColors.secondDarkColor,
                      )
                    : Image.file(File(_image!.path)),
                backgroundColor: AppColors.secondColor,
                radius: 60.0,
              ),
            ),
            Positioned(
              top: 70,
              left: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.appBarColor,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(0),
                ),
                clipBehavior: Clip.antiAlias,
                child: Icon(Icons.add_a_photo),
                onPressed: _selectImage,
              ),
            )
          ],
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
