import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_with_getx/core/models/word_model.dart';
import 'package:learning_english_with_getx/core/repositories/word/word_repo_implement.dart';

class AllVocabularyController extends GetxController {
  late WordRepoImplement wordRepoImplement;

  RxBool isLoading = false.obs;

  RxList<Word> words = <Word>[].obs;

  // For Pagination
  RxBool isDataProcessing = false.obs;
  late RxList<Word> realShowWords = List<Word>.empty(growable: true).obs;
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
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    showLoading();

    wordRepoImplement = Get.find<WordRepoImplement>();

    // kiểm tra dữ liệu đã được load trước đó hay chưa
    if (words.isEmpty) {
      await loadWords(); // lấy tất cả dữ liệu
    }

    // phân trang dữ liệu thành những danh sách nhỏ
    getRealShowWords();

    // lắng nghe và thêm dữ liệu vào danh sách hiển thị
    paginateWord();
  }

  loadWords() async {
    final result = await wordRepoImplement.getWords();

    if (result != null) {
      words = result.obs;
    } else {
      print("Không có từng vựng để hiển thị!");
    }
  }

  showLoading() {
    isLoading.value = true;
    print("true loading");
  }

  hideLoading() {
    isLoading.value = false;
    print("false loading");
  }

  // Fetch Data
  void getRealShowWords() {
    showLoading();
    try {
      if (words.length > 20) {
        index.value += 20;

        for (int i = 0; i < index.value; i++) {
          realShowWords.add(words[i]);

          print("${realShowWords[i].word} : $i");
        }
        hideLoading();
      }
    } catch (e) {
      showNotification("Không có từ vựng để hiển thị!");
      hideLoading();
    }

    // Future.delayed(const Duration(milliseconds: 1000), () {
    //   hideLoading();
    // });
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

  // Get More data
  void getMoreWord() {
    try {
      if (realShowWords.length < words.length) {
        isMoreDataAvailable(true);

        for (int i = index.value; i < index.value + 20; i++) {
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

  showNotification(String message) {
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
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
