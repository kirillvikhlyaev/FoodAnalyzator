import 'package:flutter/material.dart';
import 'package:food_analyzer/app_colors/app_colors.dart';

class CalculatingHistory extends StatelessWidget {
  const CalculatingHistory({Key? key}) : super(key: key);

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
          color: AppColors.bgColor,
        ));
  }
}
