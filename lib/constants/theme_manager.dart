import 'package:flutter/cupertino.dart';

import 'package:get_storage/get_storage.dart';

class ThemeManager {
  static ThemeManager? _instance;

  ThemeManager._();

  static ThemeManager get instance => _instance ??= ThemeManager._();

  dynamic getLightTheme() {
    return _lightTheme;
  }

  dynamic getDarkTheme() {
    return _darkTheme;
  }

  final CupertinoThemeData _lightTheme = const CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: CupertinoColors.black,
  );

  final CupertinoThemeData _darkTheme = const CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: CupertinoColors.white,
  );
}
