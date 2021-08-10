import 'package:get/get.dart';
import 'package:getx_pattern_news/feature/search_news/controller/search_news_controller.dart';

class SearchNewsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SearchNewsController());
  }

}