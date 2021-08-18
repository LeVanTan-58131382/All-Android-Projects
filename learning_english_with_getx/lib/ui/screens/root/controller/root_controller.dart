import 'package:get/get.dart';

class RootController extends GetxController
{

  RxInt selectedIndex = 0.obs;

  void changeSelectedIndex(int index)
  {
    this.selectedIndex.value = index;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}