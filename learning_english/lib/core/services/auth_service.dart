import 'dart:convert';

import 'package:learning_english/core/network.dart';
import 'package:learning_english/core/storage/auth_storage.dart';

import '../dispatch_listener_event.dart';

class AuthService {

  late NetworkHelper networkHelper;
  late String apiUrlToLogin;
  late String apiUrlToRegister;

  late AuthStorage authStorage;

  void init() {
    networkHelper = new NetworkHelper();
    apiUrlToLogin = "v1/auth/login";
    apiUrlToRegister = "v1/auth/register";

    authStorage = new AuthStorage();
  }

  Future<dynamic> registerToServer( { required Map<String, dynamic> data }) async {

    String dataToSend = jsonEncode(<String, String> {
      "name" : data["name"],
      "email" : data["email"],
      "password" : data["password"],
      "password_confirmation" : data["password_confirmation"],
    });
    
    var dataResponse = await networkHelper.postToServer(apiUrl: apiUrlToRegister, data: dataToSend);

    if( dataResponse["error_code"] == 1) {
      // statusCode == 422 , xay ra loi validate

      DispatchListenerEvent.dispatch(
          "Register_Failed", dataResponse["error_message"]);
    }
    if( dataResponse["error_code"] == 0) {
      // statusCode == 200 , moi thu ok

      // luu accessToken
      authStorage.saveAccessToken(currentToken: dataResponse["data"]["token"]);

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
    
    var dataResponse = await networkHelper.postToServer(apiUrl: apiUrlToLogin, data: dataToSend);

    if( dataResponse["error_code"] == 1) {
      // statusCode == 422 , xay ra loi validate

      DispatchListenerEvent.dispatch(
          "Login_Failed", dataResponse["error_message"]);
    }
    if( dataResponse["error_code"] == 0) {
      // statusCode == 200 , moi thu ok

      // luu accessToken
      authStorage.saveAccessToken(currentToken: dataResponse["data"]["token"]);

      DispatchListenerEvent.dispatch(
          "Login_Successful", "");
    }

    print(dataResponse);
  }
}