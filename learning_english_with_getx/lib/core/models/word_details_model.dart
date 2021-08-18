import 'package:json_annotation/json_annotation.dart';
import 'package:learning_english_with_getx/core/models/user_topic_model.dart';

import 'example_model.dart';
import 'image_model.dart';
import 'word_part_of_speech_model.dart';

part 'word_details_model.g.dart';

@JsonSerializable()
class WordDetails
{
  final int id;
  final String word;
  final String pronounce;
  final String mean;
  final List<PartOfSpeech> partOfSpeech;
  final UserTopic userTopic;
  final List<Example> listExample;
  // final List<Image> listImage;


  WordDetails({ required this.id,
    required this.word,
    required this.pronounce,
    required this.mean,
    required this.partOfSpeech,
    required this.userTopic,
    required this.listExample,
    // required this.listImage,
  });

  factory WordDetails.fromJson(Map<String, dynamic> json) => _$WordDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$WordDetailsToJson(this);
}

// TODO: run "flutter pub run build_runner build" to build word_details_model.g.dart