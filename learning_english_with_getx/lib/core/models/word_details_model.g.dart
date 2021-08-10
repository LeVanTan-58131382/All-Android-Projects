// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordDetails _$WordDetailsFromJson(Map<String, dynamic> json) {
  return WordDetails(
    id: json['id'] as int,
    word: json['word'] as String,
    pronounce: json['pronounce'] as String,
    mean: json['mean'] as String,
    partOfSpeech: (json['partOfSpeech'] as List<dynamic>)
        .map((e) => PartOfSpeech.fromJson(e as Map<String, dynamic>))
        .toList(),
    listImage:
        (json['listImage'] as List<dynamic>).map((e) => e as String).toList(),
    listExample: (json['listExample'] as List<dynamic>)
        .map((e) => Example.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$WordDetailsToJson(WordDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'pronounce': instance.pronounce,
      'mean': instance.mean,
      'partOfSpeech': instance.partOfSpeech,
      'listImage': instance.listImage,
      'listExample': instance.listExample,
    };
