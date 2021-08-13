import 'package:get/get.dart';
import 'package:learning_english_with_getx/features/dictionary/personal_dictionary/controller/personal_dictionary_controller.dart';

class PersonalDictionaryBinding extends Bindings
{
  @override
  void dependencies() {
    // TODO: implement dependencies
    if (!Get.isRegistered<PersonalDictionaryController>()) {
      Get.put(PersonalDictionaryController());
    }
  }

}