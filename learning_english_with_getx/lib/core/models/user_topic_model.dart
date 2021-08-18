import 'package:json_annotation/json_annotation.dart';

import 'word_part_of_speech_model.dart';

part 'user_topic_model.g.dart';

@JsonSerializable()
class UserTopic
{
  final int id;
  final String name;
  final int markupDefault;


  UserTopic({ required this.id,
    required this.name,
    required this.markupDefault,
});

  factory UserTopic.fromJson(Map<String, dynamic> json) => _$UserTopicFromJson(json);
  Map<String, dynamic> toJson() => _$UserTopicToJson(this);
}

// TODO: run "flutter pub run build_runner build" to build word_part_of_speech_model.g.dart