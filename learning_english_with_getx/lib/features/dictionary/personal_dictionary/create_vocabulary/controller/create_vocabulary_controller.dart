import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_english_with_getx/core/constants/app_style_constants.dart';
import 'package:learning_english_with_getx/core/database/personal_vocabulary_images_db.dart';
import 'package:learning_english_with_getx/core/models/image_model.dart' as vocabularyImage;
import 'package:learning_english_with_getx/core/models/user_topic_model.dart';
import 'package:learning_english_with_getx/features/dictionary/personal_dictionary/controller/personal_dictionary_controller.dart';
import 'package:learning_english_with_getx/features/dictionary/personal_dictionary/personal_vocabulary/controller/personal_vocabulary_controller.dart';
import 'package:learning_english_with_getx/services/network/http_service_implement.dart';


class CreateVocabularyController extends GetxController
{

  RxBool isLoadingCreateTopic = false.obs;

  Rx<ScrollController> scrollController = new ScrollController().obs;

  RxBool isNoun = false.obs;
  RxBool isVerb = false.obs;
  RxBool isAdjective = false.obs;
  RxBool isAdverb = false.obs;
  RxBool isPreposition = false.obs;
  RxBool isOtherType = false.obs;

  RxString word = "".obs;
  RxString pronounce = "".obs;
  RxString mean = "".obs;
  Rx<UserTopic> selectedUserTopic = new UserTopic(id: 0, name: "Empty", markupDefault: 0).obs;
  RxList partOfSpeechId = <int>[].obs ;
  RxList listImage = <String>[].obs;
  RxList listExample = <String>[].obs;

  late HttpServiceImplement httpServiceImplement;
  late PersonalDictionaryController personalDictionaryController;
  late PersonalVocabularyController personalVocabularyController;

  RxList<UserTopic> userTopics = <UserTopic>[].obs;

  void checkNoun(bool value)
  {
    this.isNoun.value = value;
    if(value == true)
      {
        partOfSpeechId.add(1);
      } else {
      partOfSpeechId.remove(1);
    }
    print("isNoun = $value");
  }
  void checkVerb(bool value)
  {
    this.isVerb.value = value;
    if(value == true)
    {
      partOfSpeechId.add(2);
    } else {
      partOfSpeechId.remove(2);
    }
    print("isVerb = $value");
  }
  void checkAdjective(bool value)
  {
    this.isAdjective.value = value;
    if(value == true)
    {
      partOfSpeechId.add(3);
    } else {
      partOfSpeechId.remove(3);
    }
    print("isAdjective = $value");
  }
  void checkAdverb(bool value)
  {
    this.isAdverb.value = value;
    if(value == true)
    {
      partOfSpeechId.add(4);
    } else {
      partOfSpeechId.remove(4);
    }
    print("isAdverb = $value");
  }
  void checkPreposition(bool value)
  {
    this.isPreposition.value = value;
    if(value == true)
    {
      partOfSpeechId.add(5);
    } else {
      partOfSpeechId.remove(5);
    }
    print("isPreposition = $value");
  }
  void checkOtherType(bool value)
  {
    this.isOtherType.value = value;
    print("isOtherType = $value");
  }

  // For upload images
  RxList images = <String>[].obs;

  void initUploadImages()
  {
    images.add("photo_upload_button");
  }


  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    httpServiceImplement = Get.find<HttpServiceImplement>();
    // httpServiceImplement.init();

    // personalVocabularyController = Get.find<PersonalVocabularyController>();

    personalDictionaryController = Get.find<PersonalDictionaryController>();

    await personalDictionaryController.getUserTopic();

    userTopics.value = personalDictionaryController.userTopics;

    userTopics.forEach((element) {
      if(element.markupDefault == 1)
        {
          selectedUserTopic.value = element;
        }
    });

        initUploadImages();
  }

  onChangeUserTopic(UserTopic userTopic)
  {
    selectedUserTopic.value = userTopic;
  }

  void createVocabulary() async
  {
    try{
      showCreateCircleLoading();

      final response = await httpServiceImplement.postRequest(
          url: "v1/vocabulary/personal-word/add",
          data: jsonEncode({
            "topic_id": selectedUserTopic.value.id,
            "word": word.toString(),
            "pronounce": pronounce.toString(),
            "mean": mean.toString(),
            "part_of_speech_id": partOfSpeechId.toList(),
            "image": ["Ảnh đại diện từ app", "Ảnh đại diện từ app"],
            "example_description": listExample.toList()
          }));

      hideCreateCircleLoading();

      if(response.statusCode == 200) {
        // everything ok

        var wordId = jsonDecode(response.body)["data"]["id"];

        listImage.forEach((element) async {
          await addImageToDatabase(image: element, wordId: wordId);
        });

        showNotification(typeNoti: true, message: "Tạo từ mới thành công!");
      } else if(response.statusCode == 422) {
        // validate from field failed
        showNotification(typeNoti: false, message: "Lỗi validate!");
      } else {
        showNotification(typeNoti: false, message: "Tạo từ mới không thành công!");
      }
    } catch(e) {
      showNotification(typeNoti: false, message: "Có lỗi xảy ra!");
      hideCreateCircleLoading();
    }
  }

  void createVocabularyWithFile() async
  {
    try{
      showCreateCircleLoading();

      final response = await httpServiceImplement.postRequestWithFile(
          url: "v1/vocabulary/personal-word/add",

        selectedUserTopic: selectedUserTopic.value.id,
        word: word.value,
        pronounce: pronounce.value,
        mean: mean.value,
        partOfSpeechId: partOfSpeechId.toList(),
        listExample: listExample.toList(),
        listImage: listImage.toList(),

      );

      hideCreateCircleLoading();

      if(response.statusCode == 200) {




        showNotification(typeNoti: true, message: "Tạo từ mới thành công!");
      } else if(response.statusCode == 422) {
        // validate from field failed
        showNotification(typeNoti: false, message: "Lỗi validate!");
      } else {
        showNotification(typeNoti: false, message: "Tạo từ mới không thành công!");
      }
    } catch(e) {
      showNotification(typeNoti: false, message: "Có lỗi xảy ra!");
      hideCreateCircleLoading();
    }
  }

  Future<void> createVocabularyWithDio()
  async {
    Dio _dio = new Dio();
    _dio.options.headers['Content-type'] = 'application/json; charset=UTF-8';
    _dio.options.headers["Accept"] = "application/json";
    _dio.options.headers["Authorization"] = "Bearer 5|rD5qM1ZddLqynXKGaB7zSiVgVRq6pSJw2uCta9Cu";

    try {
      final response = await _dio.post(
        "http://192.168.1.6:8000/api/v1/vocabulary/personal-word/add",
        data: jsonEncode({
          "topic_id": selectedUserTopic.value.id,
          "word": word.toString(),
          "pronounce": pronounce.toString(),
          "mean": mean.toString(),
          "part_of_speech_id": partOfSpeechId.toList(),
          "image": listImage.toList(),
          "example_description": listExample.toList()
        }),
      );

      if(response.statusCode == 200) {
        showNotification(typeNoti: true, message: "Tạo từ mới thành công!");
      } else if(response.statusCode == 422) {
        // validate from field failed
        showNotification(typeNoti: false, message: "Lỗi validate!");
      }
    } catch (e) {

    }
  }

  Future addImageToDatabase({ required String image, required int wordId}) async {
    final img = new vocabularyImage.Image(
      image: image,
      wordId: wordId
    );

    await PersonalVocabularyDatabase.instance.create(img);
  }



  void addExample(String example)
  {
    this.listExample.add(example.obs.toString());
  }

  void addTopic(String topicName) async
  {
    try{
      showCreateTopicCircleLoading();

      final response = await httpServiceImplement.postRequest(
          url: "v1/vocabulary/topic/user/add-topic",
          data: jsonEncode({
            "name": topicName,
            "markup_default": 0,
          }));

      hideCreateTopicCircleLoading();

      if(response.statusCode == 200) {
        // everything ok

        // update
        await personalDictionaryController.getUserTopic();

        userTopics.value = personalDictionaryController.userTopics;

        userTopics.forEach((element) {
          if(element.markupDefault == 1)
          {
            selectedUserTopic.value = element;
          }
        });

        showNotification(typeNoti: true, message: "Tạo chủ đề mới thành công!");


      } else if(response.statusCode == 422) {
        // validate from field failed
        showNotification(typeNoti: false, message: "Lỗi validate!");
      } else {
        showNotification(typeNoti: false, message: "Tạo chủ đề mới không thành công!");
      }
    } catch(e) {
      showNotification(typeNoti: false, message: "Có lỗi xảy ra!");
      hideCreateTopicCircleLoading();
    }
  }

  showCreateTopicCircleLoading()
  {
    isLoadingCreateTopic.value = !isLoadingCreateTopic.value;
  }
  hideCreateTopicCircleLoading()
  {
    isLoadingCreateTopic.value = !isLoadingCreateTopic.value;
  }


  // For upload images
  Future onAddImage(int index, ImageSource imageSource) async
  {

    final ImagePicker _picker = ImagePicker();
    
    XFile image = await _picker.pickImage(source: imageSource) as XFile;

    final bytes = File(image.path).readAsBytesSync();

    String img64 = base64Encode(bytes);

    images.removeAt(index);

    images.add(img64);
    listImage.add(img64);

    //listImage.add("Đây là file ảnh");
    images.add("photo_upload_button");

    Get.back();

  }


  showCreateCircleLoading()
  {

  }

  hideCreateCircleLoading()
  {

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
      forwardAnimationCurve: Curves.easeOutBack,
      onTap: (GetBar<Object> o) =>
        scrollController.value.animateTo(
          0.0,
          curve: Curves.easeOutBack,
          duration: const Duration(milliseconds: 300),
        )
    );
  }

}

