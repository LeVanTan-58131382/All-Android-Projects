import 'package:get/get.dart';
import 'package:learning_english_with_getx/features/dictionary/personal_dictionary/controller/personal_dictionary_controller.dart';
import 'package:learning_english_with_getx/services/network/http_service_implement.dart';

class PersonalDictionaryBinding extends Bindings
{
  @override
  void dependencies() {
    // TODO: implement dependencies

    if (!Get.isRegistered<HttpServiceImplement>()) {
      Get.put(HttpServiceImplement());
    }

    if (!Get.isRegistered<PersonalDictionaryController>()) {
      Get.put(PersonalDictionaryController());
    }
  }

}