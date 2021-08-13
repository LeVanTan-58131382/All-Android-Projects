import 'package:get/get.dart';
import 'package:learning_english_with_getx/core/repositories/word/word_repo_implement.dart';
import 'package:learning_english_with_getx/features/dictionary/personal_dictionary/personal_vocabulary/controller/personal_vocabulary_controller.dart';

class PersonalVocabularyBinding extends Bindings
{
  @override
  void dependencies() {

    if(!Get.isRegistered<WordRepoImplement>())
    {
      Get.put(WordRepoImplement());
    }

    if (!Get.isRegistered<PersonalVocabularyController>()) {
      Get.put(PersonalVocabularyController());
    }
  }

}