import 'package:get/get.dart';
import 'package:learning_english_with_getx/features/dictionary/classification_vocabulary/classes/topics/controller/topic_vocabulary_controller.dart';

class TopicVocabularyBinding extends Bindings
{
  @override
  void dependencies() {

    if (!Get.isRegistered<TopicVocabularyController>()) {
      Get.put(TopicVocabularyController());
    }

  }

}