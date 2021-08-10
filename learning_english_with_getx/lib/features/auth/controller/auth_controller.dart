import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_with_getx/services/localStorage/app_locaStorage_implement.dart';
import 'package:learning_english_with_getx/services/network/http_service_implement.dart';

class AuthController extends GetxController
{
  late HttpServiceImplement httpServiceImplement;
  late AppLocalStorageImplement appLocalStorageImplement;

  RxBool isLogin = false.obs;

  RxBool isLoggingCircleLoading = false.obs;
  RxBool isRegisteringCircleLoading = false.obs;

  RxString email = "".obs;
  RxString name = "".obs;
  RxString password = "".obs;
  RxString passwordConfirmation = "".obs;

  RxString loginApiUrl = "v1/auth/login".obs;
  RxString registerApiUrl = "v1/auth/register".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    httpServiceImplement = Get.find<HttpServiceImplement>();
    httpServiceImplement.init();

    appLocalStorageImplement = Get.find<AppLocalStorageImplement>();
    appLocalStorageImplement.init();

  }

  void toggleIsLogin()
  {
    isLogin.toggle().obs;
  }

  void register() async
  {

    try{
      showRegisterCircleLoading();

      final response = await httpServiceImplement.postRequest(
          url: "v1/auth/register",
          data: jsonEncode({ "name": name.toString(),"email": email.toString(), "password": password.toString(), "password_confirmation": passwordConfirmation.toString()}));

      hideRegisterCircleLoading();

      if(response.statusCode == 200) {
        // everything ok
        showNotification(typeNoti: true, message: "Đăng ký tài khoản thành công!");
      } else if(response.statusCode == 442) {
        // validate from field failed
        showNotification(typeNoti: false, message: "Lỗi validate!");
      } else {
        showNotification(typeNoti: false, message: "Đăng ký không thành công!");
      }
    } catch(e) {
      showNotification(typeNoti: false, message: "Có lỗi xảy ra!");
      hideRegisterCircleLoading();
    }
  }

  void login() async
  {
    try{
      showLoginCircleLoading();

      final response = await httpServiceImplement.postRequest(
          url: "v1/auth/login",
          data: jsonEncode({ "email": email.toString(), "password": password.toString() }));

      hideLoginCircleLoading();

      if(response.statusCode == 200) {
        // everything ok
        await appLocalStorageImplement.saveCurrentValue(value: jsonDecode(response.body)["data"]["token"]);

        showNotification(typeNoti: true, message: "Đăng nhập tài khoản thành công!");
      } else if(response.statusCode == 442) {
        // validate from field failed

        showNotification(typeNoti: false, message: "Lỗi validate!");
      } else if(response.statusCode == 401) {
        // validate from field failed

        showNotification(typeNoti: false, message: "Email hoặc mật khẩu không đúng!");
      } else {

        showNotification(typeNoti: false, message: "Đăng nhập không thành công!");
      }
    } catch(e) {
      showNotification(typeNoti: false, message: "Có lỗi xảy ra!");
      hideLoginCircleLoading();
    }
  }

  void signOut() async {
    try{

    } catch(e) {
      //Get.snackbar("Xảy ra lỗi", "Danh sách lỗi", snackPosition: SnackPosition.BOTTOM);
    }
  }

  showLoginCircleLoading(){
    isLoggingCircleLoading.toggle();
  }

  hideLoginCircleLoading(){
    isLoggingCircleLoading.toggle();
  }

  showRegisterCircleLoading(){
    isRegisteringCircleLoading.toggle();
  }

  hideRegisterCircleLoading(){
    isRegisteringCircleLoading.toggle();
  }

  showNotification({required bool typeNoti, required String message})
  {
    Get.snackbar(
      typeNoti == true ? "Thành công" : "Thất bại",
      "$message!",
      icon: Icon(Icons.notifications, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: typeNoti == true ? Colors.greenAccent : Colors.redAccent,
      borderRadius: 20,
      margin: EdgeInsets.all(15),
      colorText: Colors.black54,
      duration: Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: SnackDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.easeOutBack,);
  }
}