import 'package:flutter/material.dart';
import 'package:food_analyzer/app_colors/app_colors.dart';
import 'package:food_analyzer/widgets/main_screen/calculating_fragment/calculating_fragment.dart';
import 'package:food_analyzer/widgets/main_screen/profile_fragment/profile_fragment.dart';
import 'package:food_analyzer/widgets/main_screen/recipes_fragment/recipes_fragment.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    RecipesFragment(),
    const CalculatingFragment(),
    const ProfileFragment(),
  ];
  String screenName = 'Main';

  void _OnItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedIndex == 0) {
      screenName = 'Recipes';
    } else if (_selectedIndex == 1) {
      screenName = 'Calculating';
    } else {
      screenName = 'Profile';
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: Text(
            screenName,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                icon: const Icon(Icons.logout_outlined)),
          ],
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.local_pizza), label: 'Recipes'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate), label: 'Calculating'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.mainColor,
          onTap: _OnItemTapped,
        ),
        backgroundColor: AppColors.bgColor);
  }
}
