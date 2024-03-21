import 'package:flutter/material.dart';

class IsDarkMode with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void themeDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
  
}
