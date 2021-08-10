import 'package:json_annotation/json_annotation.dart';

part 'word_part_of_speech_model.g.dart';

@JsonSerializable()
class PartOfSpeech
{
  final String name;
  final String acronym;

  PartOfSpeech({ required this.name, required this.acronym });

  factory PartOfSpeech.fromJson(Map<String, dynamic> json) => _$PartOfSpeechFromJson(json);
  Map<String, dynamic> toJson() => _$PartOfSpeechToJson(this);
}

// TODO: run "flutter pub run build_runner build" to build word_part_of_speech_model.g.dart