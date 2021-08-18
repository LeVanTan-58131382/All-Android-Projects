import 'package:json_annotation/json_annotation.dart';

// part 'image_model.g.dart';

@JsonSerializable()
class Image
{
  final int? id;
  final String image;
  final int wordId;

  Image({
    this.id,
    required this.image,
    required this.wordId
  });


  // Thao tác với sqflite database
  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
        image: json['image'] as String,
        wordId: json['word_id'] as int,
      );
  }

  Map<String, Object?> toJson() => {
    "wordId": wordId,
    "image": image,
  };

  Image copy({
    int? id,
    int? wordId,
    String? image,
  }) =>
      Image(
        id: id ?? this.id,
        wordId: wordId ?? this.wordId,
        image: image ?? this.image,
      );
}

// TODO: run "flutter pub run build_runner build" to build example_model.g.dart