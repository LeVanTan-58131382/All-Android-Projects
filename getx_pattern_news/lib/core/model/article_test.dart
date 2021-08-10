import 'package:json_annotation/json_annotation.dart';

part 'article_test.g.dart';

@JsonSerializable()
class ArticleTest{

  final String author;
  final String desc;
  final String title;
  final String imageUrl;
  final String url;
  final String content;
  final String publishedAt;

  ArticleTest({
    required this.author,
    required this.desc,
    required this.title,
    required this.imageUrl,
    required this.url,
    required this.content,
    required this.publishedAt
});

  DateTime? get getPublishedAtDate => DateTime.tryParse(publishedAt);

  factory ArticleTest.fromJson(Map<String, dynamic> json) => _$ArticleTestFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleTestToJson(this);
}