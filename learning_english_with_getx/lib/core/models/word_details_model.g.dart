// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordDetails _$WordDetailsFromJson(Map<String, dynamic> json) {
  return WordDetails(
    id: json['id'] != null ? json['id'] as int : 0,
    word: json['word'] as String,
    pronounce: json['pronounce'] as String,
    mean: json['mean'] as String,
    partOfSpeech: (json['part_of_speech'] as List<dynamic>)
        .map((e) => PartOfSpeech.fromJson(e as Map<String, dynamic>))
        .toList(),
    // listImage: json['image'] != null ? (json['image'] as List<dynamic>)
    //     .map((e) => Image.fromJson(e as Map<String, dynamic>))
    //     .toList() : [],
    userTopic: UserTopic.fromJson(json["topic"]),
    listExample: (json['example'] as List<dynamic>)
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
      'part_of_speech': instance.partOfSpeech,
      // 'image': instance.listImage,
      'example': instance.listExample,
    };
