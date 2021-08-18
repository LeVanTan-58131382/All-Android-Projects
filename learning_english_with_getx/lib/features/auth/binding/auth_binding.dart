import 'package:get/get.dart';
import 'package:learning_english_with_getx/features/auth/controller/auth_controller.dart';
import 'package:learning_english_with_getx/services/localStorage/app_locaStorage_implement.dart';
import 'package:learning_english_with_getx/services/network/http_service_implement.dart';

class AuthBinding extends Bindings
{
  @override
  void dependencies() {

    if(!Get.isRegistered<AppLocalStorageImplement>())
    {
      Get.put(AppLocalStorageImplement());
    }

    if(!Get.isRegistered<HttpServiceImplement>())
    {
      Get.put(HttpServiceImplement());
    }

    if(!Get.isRegistered<AuthController>())
    {
      Get.put(AuthController());
    }

    // Get.put(HttpServiceImplement());
    //
    // Get.put(AppLocalStorageImplement());
    //
    // Get.put(AuthController());
  }

}