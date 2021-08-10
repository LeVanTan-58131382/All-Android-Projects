import 'package:get/get.dart';
import 'package:getx_pattern_news/core/repository/news_repo.dart';
import 'package:getx_pattern_news/core/repository/news_repo_impl.dart';
import 'package:getx_pattern_news/core/model/article.dart';

class NewsHeadlineController extends GetxController{
  late NewsRepo _newsRepo;

  NewsHeadlineController(){
    _newsRepo = Get.find<NewsRepoImpl>();
    loadNewsLine();
  }

  RxBool isLoading = false.obs;

  late RxList<Article> articles;

  loadNewsLine() async{

    showLoading();

    final result = await _newsRepo.getNewsHeadline();

    hideLoading();

    if(result!= null){
      articles = result.obs;
    }else{
      print("No data recieved");
    }
  }

  showLoading(){
    isLoading.toggle();
  }

  hideLoading(){
    isLoading.toggle();
  }
}