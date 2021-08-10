import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_english_with_getx/services/network/http_service_implement.dart';
import 'package:path/path.dart';

class CreateVocabularyController extends GetxController
{
  // final int id;
  // final String word;
  // final String pronounce;
  // final String mean;
  // final List<PartOfSpeech> partOfSpeech;
  // final List<String> listImage;
  // final List<Example> listExample;

  RxString word = "".obs;
  RxString pronounce = "".obs;
  RxString mean = "".obs;
  RxList artOfSpeechId = <int>[].obs ;
  RxList listImage = <String>[].obs;
  RxList listExample = <String>[].obs;

  late HttpServiceImplement httpServiceImplement;


  // For upload images
  RxList<Object> images = <Object>[].obs;
  final _picker = ImagePicker();
  ImageEmptySlot imageEmptySlot = new ImageEmptySlot(isUploaded: false);

  void initUploadImages()
  {
    images.add(imageEmptySlot);
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    httpServiceImplement = Get.find<HttpServiceImplement>();
    httpServiceImplement.init();

    initUploadImages();
  }

  void createVocabulary() async
  {
    try{
      showCreateCircleLoading();

      final response = await httpServiceImplement.postRequest(
          url: "v1/auth/register",
          data: jsonEncode({
            "word": word.toString(),
            "pronounce": pronounce.toString(),
            "mean": mean.toString(),
            "artOfSpeechId": artOfSpeechId.toList(),
            "listImage": listImage.toList(),
            "listExample": listExample.toList()
          }));

      hideCreateCircleLoading();

      if(response.statusCode == 200) {
        // everything ok
        showNotification(typeNoti: true, message: "Tạo từ mới thành công!");
      } else if(response.statusCode == 442) {
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


  // For upload images
  Future onAddImageClick(int index, ImageSource imageSource) async {
    // setState(() {
    //   _imageFile = ImagePicker.pickImage(source: ImageSource.gallery);
    //   getFileImage(index);
    // });
    final PickedFile? pickedFile = await _picker.getImage(source: imageSource);

    var bytes = await pickedFile!.readAsBytes();
    var bytesEncode = Base64Encoder().convert(bytes);


      ImageUploadModel uploadModel = new ImageUploadModel(
          isUploaded: false,
          uploading: true,
          name: basename(pickedFile.path),
          imageFile: bytesEncode);

      images.removeAt(index);
      images.add(uploadModel);

      images.add(imageEmptySlot);

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

class ImageUploadModel {
  bool isUploaded;
  bool uploading;
  String name;
  String imageFile;

  ImageUploadModel({
    required this.isUploaded,
    required this.uploading,
    required this.name,
    required this.imageFile,
  });
}

class ImageEmptySlot {
  bool isUploaded;

  ImageEmptySlot({required this.isUploaded});
}