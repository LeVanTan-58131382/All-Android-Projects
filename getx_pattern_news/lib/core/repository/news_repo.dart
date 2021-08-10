import 'package:getx_pattern_news/core/model/article.dart';

abstract class NewsRepo{
  Future<List<Article>?> getNewsHeadline();
  Future<List<Article>?> getSearchedNews(String query);
}