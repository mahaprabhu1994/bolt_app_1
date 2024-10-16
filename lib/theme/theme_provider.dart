import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _themeData;
  late SharedPreferences prefs;

  ThemeProvider() {
    _themeData = ThemeData.light();
    _loadFromPrefs();
  }

  ThemeData get themeData => _themeData;

  void toggleTheme() {
    _themeData =
        _themeData == ThemeData.light() ? ThemeData.dark() : ThemeData.light();
    _saveToPrefs();
    notifyListeners();
  }

  _loadFromPrefs() async {
    prefs = await SharedPreferences.getInstance();
    bool isDark = prefs.getBool('isDark') ?? false;
    _themeData = isDark ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }

  _saveToPrefs() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', _themeData == ThemeData.dark());
  }
}
