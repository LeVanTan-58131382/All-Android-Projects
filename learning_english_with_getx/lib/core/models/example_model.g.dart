// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Example _$ExampleFromJson(Map<String, dynamic> json) {
  return Example(
    exampleEng: json['exampleEng'] as String,
    exampleVie: json['exampleVie'] as String,
  );
}

Map<String, dynamic> _$ExampleToJson(Example instance) => <String, dynamic>{
      'exampleEng': instance.exampleEng,
      'exampleVie': instance.exampleVie,
    };
