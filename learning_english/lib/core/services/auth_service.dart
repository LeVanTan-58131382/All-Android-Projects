import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learning_english/core/network.dart';
import 'package:learning_english/core/services/app_services.dart';
import 'package:learning_english/core/storage/auth_storage.dart';
import 'package:provider/provider.dart';

import '../dispatch_listener_event.dart';

class AuthService{

  late NetworkHelper  _networkHelper;
  late String         _apiUrlToLogin;
  late String         _apiUrlToRegister;
  late AuthStorage    _authStorage;

  Future<void> init() async {

      this._networkHelper = new NetworkHelper();
      this._authStorage = new AuthStorage();
      this._apiUrlToLogin = "v1/auth/login";
      this._apiUrlToRegister = "v1/auth/register";

    }

    Future<dynamic> registerToServer( { required Map<String, dynamic> data }) async {
      List<dynamic> listValidationFailed = [];
      String dataToSend = jsonEncode(<String, String> {
        "name" : data["name"],
        "email" : data["email"],
        "password" : data["password"],
        "password_confirmation" : data["password_confirmation"],
      });

      var dataResponse = await this._networkHelper.postToServer(apiUrl: _apiUrlToRegister, data: dataToSend);

      if( dataResponse["error_code"] == 1) {
        // statusCode == 422 , xay ra loi validate

        if(dataResponse["error_message"]["email"] != null)
        {
          listValidationFailed.add(dataResponse["error_message"]["email"]);
        }
        if(dataResponse["error_message"]["password"] != null)
        {
          listValidationFailed.add(dataResponse["error_message"]["password"]);
        }
        if(dataResponse["error_message"]["password_confirmation"] != null)
        {
          listValidationFailed.add(dataResponse["error_message"]["password_confirmation"]);
        }

        DispatchListenerEvent.dispatch(
            "Register_Failed", listValidationFailed);
      }
      if( dataResponse["error_code"] == 0) {
        // statusCode == 200 , moi thu ok

        // luu accessToken
        // authStorage.saveAccessToken(currentToken: dataResponse["data"]["token"]);

        DispatchListenerEvent.dispatch(
            "Register_Successful", "");
      }

      print(dataResponse);
    }

    Future<dynamic> loginToServer( { required Map<String, dynamic> data } ) async {

      String dataToSend = jsonEncode(<String, String> {
        "email" : data["email"],
        "password" : data["password"],
      });

      var dataResponse = await _networkHelper.postToServer(apiUrl: _apiUrlToLogin, data: dataToSend);

      if( dataResponse["error_code"] == 1) {
        // statusCode == 422 , xay ra loi validate

        DispatchListenerEvent.dispatch(
            "Login_Failed", dataResponse["error_message"]);
      }
      if( dataResponse["error_code"] == 0) {
        // statusCode == 200 , moi thu ok

        // luu accessToken
        this._authStorage.saveAccessToken(currentToken: dataResponse["data"]["token"]);

        DispatchListenerEvent.dispatch(
            "Login_Successful", "");
      }

      print(dataResponse);
    }

  // TODO: kiem tra thu ben duoi local stogare co dang luu tru accessToken khong
  checkAccessTokenAtLocalStorage() async{
    String accessToken = await this._authStorage.getCurrentAccessToken();
    if( accessToken.isNotEmpty ) {
      return true;
    }
    return false;
  }
}


