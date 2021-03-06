import 'package:learning_english_with_getx/core/models/word_details_model.dart';
import 'package:learning_english_with_getx/core/models/word_model.dart';

abstract class WordRepoAbstract
{
  Future<List<Word>?> getWords();
  Future<List<WordDetails>?> getPersonalWords();
  Future<List<Word>?> getSearchWords(String searchKey);
  Future<Word?> getWordDetails(int id);
}