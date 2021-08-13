import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_with_getx/core/models/word_model.dart';
import 'package:learning_english_with_getx/core/repositories/word/word_repo_implement.dart';

class PersonalVocabularyController extends GetxController
{
  late WordRepoImplement wordRepoImplement;

  RxBool isLoading = false.obs;

  late RxList<Word> words = <Word>[].obs;

  // For Pagination
  RxBool isDataProcessing = false.obs;
  late RxList<Word> realShowWords = List<Word>.empty(growable: true).obs;
  RxInt index = 0.obs;
  ScrollController scrollController = ScrollController();
  RxBool isMoreDataAvailable = true.obs;

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

    final result = await wordRepoImplement.getWords();

    if(result != null)
    {
      words = result.obs;

    } else {

      print("Không có từng vựng để hiển thị!");
    }

    // hideLoading();
  }

  showLoading(){
    isLoading.toggle();
  }

  hideLoading(){
    isLoading.toggle();
  }

  // Fetch Data
  void getRealShowWords() {
    showLoading();
    try {
      if(words.length > 20)
      {
        index.value += 20;

        for(int i = 0; i < index.value; i++)
        {
          realShowWords.add(words[i]);

          print("${realShowWords[i].word} : $i");
        }

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