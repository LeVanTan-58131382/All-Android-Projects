// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_part_of_speech_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartOfSpeech _$PartOfSpeechFromJson(Map<String, dynamic> json) {
  return PartOfSpeech(
    name: json['name'] as String,
    acronym: json['acronym'] as String,
  );
}

Map<String, dynamic> _$PartOfSpeechToJson(PartOfSpeech instance) =>
    <String, dynamic>{
      'name': instance.name,
      'acronym': instance.acronym,
    };
