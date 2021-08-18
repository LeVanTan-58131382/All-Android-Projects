import 'package:get/get.dart';
import 'package:learning_english_with_getx/ui/screens/root/controller/root_controller.dart';

class RootBinding extends Bindings
{
  @override
  void dependencies() {
    // TODO: implement dependencies
    if(!Get.isRegistered<RootController>())
    {
      Get.put(RootController());
    }

  }

}