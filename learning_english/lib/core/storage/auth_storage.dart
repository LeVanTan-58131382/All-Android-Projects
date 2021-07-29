import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';

class AuthStorage {
  late String _currentAccessToken;

  final Future<SharedPreferences> _accessToken = SharedPreferences.getInstance();

  // TODO: lay accessToken
  getCurrentAccessToken() async {
    final SharedPreferences accessToken = await _accessToken;
    _currentAccessToken = accessToken.getString("currentToken") ?? "";

    print("currentToken from local storage: $_currentAccessToken");

    return _currentAccessToken;
  }

  // TODO: sau khi login thanh cong thi luu lai accessToken cho auto login
  saveAccessToken({ required String currentToken }) async {
    final SharedPreferences accessToken = await _accessToken;
    accessToken.setString("currentToken", currentToken);
    _currentAccessToken = currentToken;

    print("currentToken after save: $_currentAccessToken");
  }

  // TODO: xoa accessToken sau khi nguoi dung logout
  deleteAccessToken({ required String tokenEmpty }) async {
    final SharedPreferences accessToken = await _accessToken;
    accessToken.setString("currentToken", tokenEmpty);
    _currentAccessToken = tokenEmpty;

    print("currentToken after delete: $_currentAccessToken");
  }
}
