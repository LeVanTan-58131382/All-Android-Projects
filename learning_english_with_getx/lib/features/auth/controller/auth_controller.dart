import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_english_with_getx/core/constants/app_style_constants.dart';
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

  RxString userEmailAccount = "".obs;
  RxString userNameAccount = "".obs;

  RxString goToTargetPageRoute = "".obs;

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();

    appLocalStorageImplement = Get.find<AppLocalStorageImplement>();
    appLocalStorageImplement.init();
    String accessToken = await appLocalStorageImplement.getCurrentValue();

    httpServiceImplement = Get.find<HttpServiceImplement>();
    httpServiceImplement.init();
    httpServiceImplement.setAccessToken(accessToken);

  }

  void changeTargetPage(String targetPageRoute)
  {
    this.goToTargetPageRoute.value = targetPageRoute;
  }

  Future<bool> checkLogged() async
  {
     var currentToken = await appLocalStorageImplement.getCurrentValue();
     if(currentToken == "")
       {
         return false;
       }
     return true;
  }

  void toggleIsLogin()
  {
    isLogin.toggle().obs;
  }

  void getUserAccount() async
  {
    try{
      showRegisterCircleLoading();

      final response = await httpServiceImplement.getRequest(
          url: "v1/me",);

      hideRegisterCircleLoading();

      if(response.statusCode == 200) {
        // everything ok

        this.userNameAccount.value = jsonDecode(response.body)["name"];
        this.userEmailAccount.value = jsonDecode(response.body)["email"];

         showNotification(typeNoti: true, message: "Lấy thông tin thành công!");
      } else {
         showNotification(typeNoti: false, message: "Lấy thông tin tài khoản không thành công!");
      }
    } catch(e) {
      showNotification(typeNoti: false, message: "Có lỗi xảy ra getUserAccount!");
      hideRegisterCircleLoading();
    }
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
        showNotification(typeNoti: true, message: "Đăng ký thành công!");
      } else if(response.statusCode == 442) {
        // validate from field failed
        showNotification(typeNoti: false, message: "Lỗi validate!");
      } else {
        showNotification(typeNoti: false, message: "Đăng ký không thành công!");
      }
    } catch(e) {
      showNotification(typeNoti: false, message: "Có lỗi xảy ra register!");
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

        String accessToken = await appLocalStorageImplement.getCurrentValue();

        httpServiceImplement.setAccessToken(accessToken);

        getUserAccount();

        showNotification(typeNoti: true, message: "Đăng nhập thành công!");

        // Chuyển trang nếu có
        if(goToTargetPageRoute.value != "") {
          Future.delayed(const Duration(milliseconds: 1000), () {
            Get.toNamed("${goToTargetPageRoute.value}");
          });
        }

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
      showNotification(typeNoti: false, message: "Có lỗi xảy ra login!");
      hideLoginCircleLoading();
    }
  }

  void signOut() async {
    try{
      // showLoginCircleLoading();

      final response = await httpServiceImplement.postRequest(
          url: "v1/auth/logout",
          data: jsonEncode({ "email": email.toString(), "password": password.toString() }));

      // hideLoginCircleLoading();

      if(response.statusCode == 201) {
        // everything ok
        await appLocalStorageImplement.saveCurrentValue(value: "");

        String accessToken = await appLocalStorageImplement.getCurrentValue();

        httpServiceImplement.setAccessToken(accessToken);

        this.userNameAccount.value = "";
        this.userEmailAccount.value = "";

        showNotification(typeNoti: true, message: "Đăng xuất tài khoản thành công!");

        Future.delayed(const Duration(milliseconds: 1000), () {
          Get.back();
          Get.toNamed("/root/auth");
        });
      } else {

        showNotification(typeNoti: false, message: "Đăng xuất không thành công!");
      }
    } catch(e) {
      showNotification(typeNoti: false, message: "Có lỗi xảy ra signOut!");
      // hideLoginCircleLoading();
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
      "Thông báo",
      message,
      titleText: Text(typeNoti == true ? "Thành công" : "Thất bại", style: GoogleFonts.nunito(
        fontSize: 16,
        color: AppStyles
            .backgroundColorDark,
        fontWeight:
        FontWeight.w700,
      )),
      messageText: Text(message, style: GoogleFonts.nunito(
        fontSize: 14,
        color: AppStyles
            .backgroundColorDark,
        fontWeight:
        FontWeight.w700,
      )),
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