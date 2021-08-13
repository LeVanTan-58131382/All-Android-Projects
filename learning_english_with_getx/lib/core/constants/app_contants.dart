import 'app_style_constants.dart';

class AppConstants {
  static const baseApiUrl = "http://192.168.1.6:8000/api/";

  // titles


  // text form fields


  // notification messages


  // errors


  // successes

  static const List banners = [
    {
      "id": "true",
      "title" : "Tất cả",
      "sort_description" : "3000 từ",
      "url_name" : "all_word",
      "img" : "assets/images/all_word.png",
      "img_detail" : "assets/images/all_word.png",
      "color_theme" : AppStyles.GreenTeal
    },
    {
      "id": "2",
      "title" : "Chủ đề",
      "sort_description" : "8 chủ đề",
      "url_name" : "topic",
      "img" : "assets/images/themes_word.png",
      "img_detail" : "assets/images/themes_word.png",
      "color_theme" : AppStyles.backgroundColorBrow
    },
    {
      "id": "3",
      "title" : "Từ loại",
      "sort_description" : "8 Từ loại",
      "url_name" : "all_word",
      "img" : "assets/images/word_types.png",
      "img_detail" : "assets/images/word_types.png",
      "color_theme" : AppStyles.backgroundColor_B_Green
    },
    {
      "id": "4",
      "title" : "Gia đình từ",
      "sort_description" : "500 gia đình từ",
      "url_name" : "all_word",
      "img" : "assets/images/word_family.png",
      "img_detail" : "assets/images/word_family.png",
      "color_theme" : AppStyles.red
    },
  ];

}