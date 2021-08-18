// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_topic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTopic _$UserTopicFromJson(Map<String, dynamic> json) {
  return UserTopic(
    id: json['id'] as int,
    name: json['name'] as String,
    markupDefault: json['markup_default'] as int,
  );
}

Map<String, dynamic> _$UserTopicToJson(UserTopic instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'markup_default': instance.markupDefault,
    };
