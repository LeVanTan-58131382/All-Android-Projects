import 'package:get/get.dart';
import 'package:learning_english_with_getx/features/dictionary/details_vocabulary/controller/details_vocabulary_controller.dart';

class DetailsVocabularyBinding extends Bindings
{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(DetailsVocabularyController());
  }

}