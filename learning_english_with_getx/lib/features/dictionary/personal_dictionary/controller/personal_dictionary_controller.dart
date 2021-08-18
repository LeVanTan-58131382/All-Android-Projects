import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_with_getx/core/models/user_topic_model.dart';
import 'package:learning_english_with_getx/services/network/http_service_implement.dart';

class PersonalDictionaryController extends GetxController
{

  late HttpServiceImplement httpServiceImplement;

  List<UserTopic> userTopics = [];

  RxInt indexPage = 1.obs;

  changePage(int index)
  {
    this.indexPage.value = index;
  }

  Future<void> getUserTopic() async
  {
    try{

      final response = await httpServiceImplement.getRequest(
        url: "v1/vocabulary/topic/user/get-topic",);

      if(response.statusCode == 200) {
        // everything ok

        final parsedResponse = jsonDecode(response.body);

        final List<dynamic> listUserTopicParsedResponse = parsedResponse["data"];

        userTopics = listUserTopicParsedResponse.map((item) => UserTopic.fromJson(item)).toList();

        showNotification(typeNoti: true, message: "Lấy chủ đề thành công!");
      } else {
        showNotification(typeNoti: false, message: "Lấy chủ đề không thành công!");
      }
    } catch(e) {
      showNotification(typeNoti: false, message: "Có lỗi xảy ra getUserTopic!");

    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    httpServiceImplement = Get.find<HttpServiceImplement>();

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