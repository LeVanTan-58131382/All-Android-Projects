import 'package:json_annotation/json_annotation.dart';

import 'word_part_of_speech_model.dart';

part 'word_model.g.dart';

@JsonSerializable()
class Word
{
  final int id;
  final String word;
  final String pronounce;
  final String mean;
  final List<PartOfSpeech> partOfSpeech;

  Word({ required this.id,
    required this.word,
    required this.pronounce,
    required this.mean,
    required this.partOfSpeech});

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);
  Map<String, dynamic> toJson() => _$WordToJson(this);
}

// TODO: run "flutter pub run build_runner build" to build word_part_of_speech_model.g.dart