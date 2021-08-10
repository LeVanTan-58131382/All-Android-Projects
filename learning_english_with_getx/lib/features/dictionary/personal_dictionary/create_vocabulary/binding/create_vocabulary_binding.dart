import 'package:get/get.dart';
import 'package:learning_english_with_getx/features/dictionary/personal_dictionary/create_vocabulary/controller/create_vocabulary_controller.dart';
import 'package:learning_english_with_getx/services/localStorage/app_locaStorage_implement.dart';
import 'package:learning_english_with_getx/services/network/http_service_implement.dart';

class CreateVocabularyBinding extends Bindings
{
  @override
  void dependencies() {
    // TODO: implement dependencies

    if (!Get.isRegistered<HttpServiceImplement>()) {
      Get.put(HttpServiceImplement());
    }

    if (!Get.isRegistered<AppLocalStorageImplement>()) {
      Get.put(AppLocalStorageImplement());
    }

    Get.put(CreateVocabularyController());

  }
}