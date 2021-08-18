import 'dart:convert';

import 'package:get/get.dart';
import 'package:learning_english_with_getx/core/models/word_details_model.dart';
import 'package:learning_english_with_getx/core/models/word_model.dart';
import 'package:learning_english_with_getx/core/repositories/word/word_repo_abstract.dart';
import 'package:learning_english_with_getx/services/network/http_service_implement.dart';

class WordRepoImplement extends WordRepoAbstract
{
  late HttpServiceImplement httpServiceImplement;

  WordRepoImplement()
  {
    httpServiceImplement = Get.find<HttpServiceImplement>();
    // httpServiceImplement.init();
  }

  @override
  Future<List<Word>?> getWords() async {
    // TODO: implement getWords
    List<Word> listWord = [];

    try{

      final response = await httpServiceImplement.getRequest(
          url: "v1/get-all-word");

      if(response.statusCode == 200) {

        final parsedResponse = jsonDecode(response.body);

        final List<dynamic> listWordParsedResponse = parsedResponse["data"];

        listWord = listWordParsedResponse.map((item) => Word.fromJson(item)).toList();

        return listWord;
      } else {

      }
    } catch(e) {

    }
    return null;
  }

  @override
  Future<List<WordDetails>?> getPersonalWords() async {
    // TODO: implement getWords
    List<WordDetails> listWord = [];

    try{

      final response = await httpServiceImplement.postRequest(
          url: "v1/vocabulary/personal-word/get",
        data: jsonEncode({ "getPersonalWord": true })
      );

      if(response.statusCode == 200) {

        final parsedResponse = jsonDecode(response.body);

        final List<dynamic> listWordParsedResponse = parsedResponse["data"];

        listWord = listWordParsedResponse.map((item) => WordDetails.fromJson(item)).toList();

        return listWord;
      } else {

      }
    } catch(e) {

    }
    return null;
  }

  @override
  Future<List<Word>> getSearchWords(String searchKey) {
    // TODO: implement getSearchWords
    throw UnimplementedError();
  }

  @override
  Future<Word?> getWordDetails(int id) async {
    // TODO: implement getWordDetails
    Word word;

    try{

      final response = await httpServiceImplement.getRequest(
          url: "v1/get-word-details/$id");

      if(response.statusCode == 200) {

        final parsedResponse = jsonDecode(response.body);

        final wordParsedResponse = parsedResponse["data"];

        word = wordParsedResponse.map((item) => Word.fromJson(item));

        return word;
      } else {

      }
    } catch(e) {

    }
    return null;
  }

}