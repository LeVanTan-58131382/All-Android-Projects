// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Word _$WordFromJson(Map<String, dynamic> json) {
  return Word(
    id: json['id'] as int,
    word: json['word'] as String,
    pronounce: json['pronounce'] as String,
    mean: json['mean'] as String,
    partOfSpeech: (json['part_of_speech'] as List<dynamic>)
        .map((e) => PartOfSpeech.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$WordToJson(Word instance) => <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'pronounce': instance.pronounce,
      'mean': instance.mean,
      'part_of_speech': instance.partOfSpeech,
    };
