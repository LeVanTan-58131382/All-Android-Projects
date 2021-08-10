// class Words {
//   final int id;
//   final String word;
//   final String pronounce;
//   final String mean;
//
//   final List partOfSpeech;
//
//   const Words({
//     required this.id,
//     required this.word,
//     required this.pronounce,
//     required this.mean,
//     required this.partOfSpeech
//   });
//
//   factory Words.fromJson(Map<String, dynamic> json) {
//     //print("json: $json");
//
//     return Words(
//       id: json["id"],
//       word: json["word"] as String,
//       pronounce: json["pronounce"] as String,
//       mean: json["mean"] as String,
//       partOfSpeech: json["part_of_speech"],
//     );
//   }
// }
import 'dart:convert';

///
///
final String tableWords = 'words';

class WordFields {
  static final List<String> values = [
    /// Add all fields
    id, word, pronounce, mean, partOfSpeech,
  ];

  static final String id = '_id';
  static final String word = 'word';
  static final String pronounce = 'pronounce';
  static final String mean = 'mean';
  static final String partOfSpeech = 'part_of_speech';
}

class Word {
  final int? id;
  final String word;
  final String pronounce;
  final String mean;

  final String partOfSpeech;

  const Word({
    this.id,
    required this.word,
    required this.pronounce,
    required this.mean,
    required this.partOfSpeech,
  });

  Word copy({
    int? id,
    String? word,
    String? pronounce,
    String? mean,
    String? partOfSpeech,
  }) =>
      Word(
        id: id ?? this.id,
        word: word ?? this.word,
        pronounce: pronounce ?? this.pronounce,
        mean: mean ?? this.mean,
        partOfSpeech: partOfSpeech ?? this.partOfSpeech,

      );

  static Word fromJson(Map<String, Object?> json) =>
      Word(
        id: json[WordFields.id] as int?,
        word: json[WordFields.word] as String,
        pronounce: json[WordFields.pronounce] as String,
        mean: json[WordFields.mean] as String,
        partOfSpeech: jsonEncode(json[WordFields.partOfSpeech]),

      );

  Map<String, Object?> toJson() => {
    WordFields.id: id,
    WordFields.word: word,
    WordFields.pronounce: pronounce,
    WordFields.mean: mean,
    WordFields.partOfSpeech: partOfSpeech,
  };
}

