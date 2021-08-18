import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_english_with_getx/core/constants/app_style_constants.dart';
import 'package:learning_english_with_getx/core/models/word_details_model.dart';
import 'package:learning_english_with_getx/core/models/word_model.dart';
import 'package:learning_english_with_getx/core/repositories/word/word_repo_implement.dart';

class PersonalVocabularyController extends GetxController
{
  late WordRepoImplement wordRepoImplement;

  late RxBool isLoading = true.obs;

  late RxList<WordDetails> words = <WordDetails>[].obs;

  // For Pagination
  RxBool isDataProcessing = false.obs;
  late RxList<WordDetails> realShowWords = List<WordDetails>.empty(growable: true).obs;
  RxInt index = 0.obs;
  ScrollController scrollController = ScrollController();
  RxBool isMoreDataAvailable = true.obs;

  RxList<String> filterValues =
      ["Tất cả", "Danh từ", "Động từ", "Tính từ", "Trạng từ", "Giới từ"].obs;
  RxString selectedFilterValue = "Tất cả".obs;

  void onChangeFilterValue(String value) {
    selectedFilterValue.value = value;
  }

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();


    wordRepoImplement = Get.find<WordRepoImplement>();

    if(words.isEmpty)
    {
      await loadWords(); // lấy tất cả dữ liệu
    }

    // phân trang dữ liệu thành những danh sách nhỏ
    getRealShowWords();

    // lắng nghe và thêm dữ liệu vào danh sách hiển thị
    paginateWord();
  }

  loadWords() async {
    // showLoading();

    final result = await wordRepoImplement.getPersonalWords();

    if(result != null)
    {
      words.value = result.obs;

    } else {

      print("Không có từng vựng để hiển thị!");
    }

    // hideLoading();
  }

  showLoading(){
    isLoading.value = !isLoading.value;
  }

  hideLoading(){
    isLoading.value = !isLoading.value;
  }

  // Fetch Data
  void getRealShowWords() {
    try {
        for(int i = 0; i < words.length; i++)
        {
          realShowWords.add(words[i]);

          print("${realShowWords[i].word} : $i");
        }
      hideLoading();
    } catch (e) {
      showNotification("Không có từ vựng để hiển thị!");
      hideLoading();
    }
  }

  // For Pagination
  void paginateWord() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print("reached end");
        getMoreWord();
      }
    });
  }

  void getPersonalWordDetails(int id)
  {
    showNotification("Hiển thị chi tiết từ vựng");
  }

  void editPersonalWord(int id)
  {
    showNotification("Sửa từ vựng");
  }

  void deletePersonalWord(int id)
  {
    showNotification("Xóa từ vựng");
  }

  // Get More data
  void getMoreWord() {
    try {
      if(realShowWords.length < words.length) {

        isMoreDataAvailable(true);

        for(int i = index.value; i < index.value + 20; i++)
        {
          realShowWords.add(words[i]);

          print("${realShowWords[i].word} : $i");
        }

        index.value += 20;

      } else {
        isMoreDataAvailable(false);
        showNotification("Hết dữ liệu để hiển thị!");
      }
    } catch (exception) {
      isMoreDataAvailable(false);
    }
  }

  showNotification(String message)
  {
    Get.snackbar(
      "Thông báo",
      message,
      titleText: Text("Thông báo", style: GoogleFonts.nunito(
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
      backgroundColor: Colors.orangeAccent,
      borderRadius: 20,
      margin: EdgeInsets.all(15),
      colorText: Colors.black54,
      duration: Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: SnackDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.easeOutBack,);
  }
}