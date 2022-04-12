import 'package:flutter/material.dart';

class ProviderNotifier<Model extends ChangeNotifier> extends InheritedNotifier {
  final Model model;
  const ProviderNotifier({Key? key, required this.model, required Widget child})
      : super(key: key, notifier: model, child: child);

  static Model? watch<Model extends ChangeNotifier>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ProviderNotifier<Model>>()
        ?.model;
  }

  static Model? read<Model extends ChangeNotifier>(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ProviderNotifier<Model>>()
        ?.widget;
    return widget is ProviderNotifier<Model> ? widget.model : null;
  }
}

class SimpleProvider<Model> extends InheritedWidget {
  final Model model;
  const SimpleProvider({Key? key, required this.model, required Widget child})
      : super(key: key, child: child);

  static Model? watch<Model>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SimpleProvider<Model>>()
        ?.model;
  }

  static Model? read<Model>(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<SimpleProvider<Model>>()
        ?.widget;
    return widget is SimpleProvider<Model> ? widget.model : null;
  }

  @override
  bool updateShouldNotify(SimpleProvider oldWidget) {
    return model != oldWidget.model;
  }
}
