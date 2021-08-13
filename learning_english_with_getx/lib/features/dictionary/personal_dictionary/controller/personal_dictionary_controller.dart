import 'package:get/get.dart';

class PersonalDictionaryController extends GetxController
{

  RxInt indexPage = 1.obs;

  changePage(int index)
  {
    this.indexPage.value = index;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}