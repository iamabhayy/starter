import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:starter/app/app.locator.dart';

class SettingViewModel extends BaseViewModel {
  final ThemeService theme = locator<ThemeService>();

  themeSwitch(bool isDark, BuildContext ctx) async {
    (isDark)
        ? getThemeManager(ctx).setThemeMode(ThemeMode.dark)
        : getThemeManager(ctx).setThemeMode(ThemeMode.light);
    notifyListeners();
  }

  bool get isDarkModeEnable => theme.isDarkMode;
}
