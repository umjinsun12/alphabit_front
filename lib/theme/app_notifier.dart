/*
* File : App Theme Notifier (Listener)
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:alphabit_front/extensions/extensions.dart';
import 'package:alphabit_front/localizations/language.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_theme.dart';

class AppNotifier extends ChangeNotifier {
  AppNotifier() {
    init();
  }

  Future<void> init() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    AppTheme.themeType =
        sharedPreferences.getString("theme_mode").toString().toThemeType;

    await Language.init();
    changeLanguage(Language.currentLanguage, false);
    _changeTheme(AppTheme.themeType);
    notifyListeners();
  }

  void updateTheme(ThemeType themeType) {
    try {
      AppTheme.themeType = themeType;

      AppTheme.theme = AppTheme.getThemeFromThemeMode(AppTheme.themeType);
      AppTheme.customTheme = AppTheme.getCustomAppTheme(AppTheme.themeType);

      _changeTheme(AppTheme.themeType);

      updateInStorage(AppTheme.themeType);

      notifyListeners();
    } catch (e) {}
  }

  Future<void> updateInStorage(ThemeType themeType) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("theme_mode", themeType.toText);
  }

  void changeDirectionality(TextDirection textDirection, [bool notify = true]) {
    AppTheme.textDirection = textDirection;
    FxAppTheme.textDirection = textDirection;

    if (notify) notifyListeners();
  }

  Future<void> changeLanguage(Language language,
      [bool notify = true, bool changeDirection = true]) async {
    if (changeDirection) {
      if (language.supportRTL)
        changeDirectionality(TextDirection.rtl, false);
      else
        changeDirectionality(TextDirection.ltr, false);
    }

    await Language.changeLanguage(language);

    if (notify) notifyListeners();
  }

  void _changeTheme(ThemeType themeType) {
    AppTheme.customTheme = AppTheme.getCustomAppTheme(themeType);
    AppTheme.theme = AppTheme.getThemeFromThemeMode(themeType);

    AppTheme.changeFxTheme(themeType);
  }
}
