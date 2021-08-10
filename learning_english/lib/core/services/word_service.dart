import 'package:learning_english/core/database/word_database.dart';
import 'package:learning_english/core/network.dart';
import 'package:learning_english/models/word.dart';

class WordService {
  List<Word> words = [];
  late String apiUrlToGetAllWord;

  late NetworkHelper networkHelper;

  Future<void> init() async{
    networkHelper = new NetworkHelper();
    apiUrlToGetAllWord = "v1/get-all-word";
  }

  Future<dynamic> getAllWordFromServer() async {
    var dataResponse = await networkHelper.getToServer(apiUrl: apiUrlToGetAllWord);

    if( dataResponse["error_code"] == 0) {
      // statusCode == 422 , xay ra loi validate
      // dataResponse["data"].map((word) => words.add(Word.fromJson(word)));
      List<dynamic> list = dataResponse["data"];

      words = list.map((word) => Word.fromJson(word)).toList();

      words.forEach((element) {addWord(element);});
    }
  }

  Future addWord(Word word) async {
    await WordDatabase.instance.create(word);
  }

  // Future addWord(int? id, String word, String pronounce, String mean, List partOfSpeech) async {
  //   final _word = Word(
  //     id: id,
  //     word: word,
  //     pronounce: pronounce,
  //     mean: mean,
  //     partOfSpeech: partOfSpeech,
  //   );
  //
  //   await WordDatabase.instance.create(_word);
  // }
}