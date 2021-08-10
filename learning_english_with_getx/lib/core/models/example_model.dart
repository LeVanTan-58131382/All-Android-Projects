import 'package:json_annotation/json_annotation.dart';

part 'example_model.g.dart';

@JsonSerializable()
class Example
{
  final String exampleEng;
  final String exampleVie;

  Example({
    required this.exampleEng,
    required this.exampleVie});

  factory Example.fromJson(Map<String, dynamic> json) => _$ExampleFromJson(json);
  Map<String, dynamic> toJson() => _$ExampleToJson(this);
}

// TODO: run "flutter pub run build_runner build" to build example_model.g.dart