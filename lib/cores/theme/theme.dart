import 'package:flutter/material.dart';

import 'theme_data.dart';

class AppTheme extends InheritedWidget {
  const AppTheme({
    super.key,
    required this.theme,
    required super.child,
  });

  factory AppTheme.dark({Key? key, required Widget child}) {
    return AppTheme(
      key: key,
      theme: AppThemeData(),
      child: child,
    );
  }

  final AppThemeData theme;

  static AppTheme? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppTheme>();

  @override
  bool updateShouldNotify(AppTheme oldWidget) => theme != oldWidget.theme;
}
