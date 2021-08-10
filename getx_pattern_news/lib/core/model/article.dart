import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article{

  Article({
    required this.author,
    required this.desc,
    required this.title,
    required this.imageUrl,
    required this.url,
    required this.content,
    required this.publishedAt,

});

  final String author;
  final String desc;
  final String title;
  final String imageUrl;
  final String url;
  final String content;
  final String publishedAt;

  DateTime? get getPublishedAtDate => DateTime.tryParse(publishedAt);

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}