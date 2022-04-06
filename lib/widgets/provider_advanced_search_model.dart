import 'package:flutter/material.dart';

class AdvancedSearchModel {}

class AdvancedSearchProvider extends InheritedWidget {
  final AdvancedSearchModel model;
  AdvancedSearchProvider({Key? key, required this.model, required Widget child})
      : super(key: key, child: child);

  static AdvancedSearchProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AdvancedSearchProvider>();
  }

  @override
  bool updateShouldNotify(AdvancedSearchProvider oldWidget) {
    return true;
  }
}
