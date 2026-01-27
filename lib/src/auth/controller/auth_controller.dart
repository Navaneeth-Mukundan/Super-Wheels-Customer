import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  bool obscureText = true;
  bool verifyOtp = false;

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void isObscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }

  void updateIndex(int newIndex) {
    _selectedIndex = newIndex;
    notifyListeners();
  }
}
