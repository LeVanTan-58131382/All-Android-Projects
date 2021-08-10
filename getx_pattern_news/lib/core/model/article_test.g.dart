// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleTest _$ArticleTestFromJson(Map<String, dynamic> json) {
  return ArticleTest(
    author: json['author'] as String,
    desc: json['desc'] as String,
    title: json['title'] as String,
    imageUrl: json['imageUrl'] as String,
    url: json['url'] as String,
    content: json['content'] as String,
    publishedAt: json['publishedAt'] as String,
  );
}

Map<String, dynamic> _$ArticleTestToJson(ArticleTest instance) =>
    <String, dynamic>{
      'author': instance.author,
      'desc': instance.desc,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'url': instance.url,
      'content': instance.content,
      'publishedAt': instance.publishedAt,
    };
