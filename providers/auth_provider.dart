import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuth = false;

  bool get isAuth => _isAuth;

  void login(String email, String password) {
    if (email.contains('@') && password.length >= 6) {
      _isAuth = true;
      notifyListeners();
    }
  }

  void logout() {
    _isAuth = false;
    notifyListeners();
  }
}
