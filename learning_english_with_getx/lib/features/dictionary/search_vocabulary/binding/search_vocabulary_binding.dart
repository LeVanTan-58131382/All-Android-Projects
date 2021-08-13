import 'package:get/get.dart';
import 'package:learning_english_with_getx/core/repositories/word/word_repo_implement.dart';
import 'package:learning_english_with_getx/features/dictionary/all_vocabulary/controller/all_vocabulary_controller.dart';
import 'package:learning_english_with_getx/features/dictionary/search_vocabulary/controller/search_vocabulary_controller.dart';

class SearchVocabularyBinding extends Bindings
{
  @override
  void dependencies() {
    // TODO: implement dependencies

    if(!Get.isRegistered<WordRepoImplement>())
    {
      Get.put(WordRepoImplement());
    }


    if(!Get.isRegistered<AllVocabularyController>())
      {
        Get.put(AllVocabularyController());
      }

    Get.put(SearchVocabularyController());
  }

}