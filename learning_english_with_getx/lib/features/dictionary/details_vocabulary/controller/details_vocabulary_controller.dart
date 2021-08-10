import 'package:get/get.dart';
import 'package:learning_english_with_getx/core/models/word_details_model.dart';
import 'package:learning_english_with_getx/core/repositories/word/word_repo_implement.dart';

class DetailsVocabularyController extends GetxController
{
    late int wordId;

    late WordRepoImplement wordRepoImplement;

    RxBool isLoading = false.obs;

    late WordDetails wordDetails;

    @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    dynamic argument = Get.arguments;
    wordId = argument["wordId"];

    print("word id = $wordId");
  }

}