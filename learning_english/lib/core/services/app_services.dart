import 'package:flutter/material.dart';
import 'package:learning_english/core/services/auth_service.dart';

class AppServices with ChangeNotifier {
  late bool loginStatus;

  setLoginStatus(bool value) {
    this.loginStatus = value;
    notifyListeners();
  }

  bool getLoginStatus() {
    return this.loginStatus;
  }

  checkLoginStatus() async {
    AuthService authService = new AuthService();
    authService.init();
    setLoginStatus(authService.checkAccessTokenAtLocalStorage());
  }

}