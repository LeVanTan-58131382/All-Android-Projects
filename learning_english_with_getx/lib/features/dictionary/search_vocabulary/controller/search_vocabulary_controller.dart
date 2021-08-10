import 'package:get/get.dart';
import 'package:learning_english_with_getx/core/models/word_model.dart';
import 'package:learning_english_with_getx/features/dictionary/all_vocabulary/controller/all_vocabulary_controller.dart';

class SearchVocabularyController extends GetxController
{

  late AllVocabularyController allVocabularyController;

  RxBool test = false.obs;

  RxList<Word> words = <Word>[].obs;

  RxList<Word> expectedWords = <Word>[].obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    allVocabularyController = Get.find<AllVocabularyController>();

    if(allVocabularyController.words.isEmpty)
      {
        await allVocabularyController.loadWords();
      }

    words = allVocabularyController.words;

  }

  void searchExpectedWords(String key)
  {

    // expectedWords = <Word>[].obs;
    expectedWords.clear();

    words.forEach((element) {
      if(element.word.toLowerCase().contains(key.toLowerCase()) && key.isNotEmpty)
        {
          expectedWords.add(element);
          print(element.word);
        }
    });

    // for (int i = 0; i < words.length; i++) {
    //   if ((words[i].word)
    //       .toLowerCase()
    //       .contains(key.toLowerCase()) &&
    //       key.isNotEmpty) {
    //
    //     expectedWords.add(words[i]);
    //
    //     print("có ${words[i].word}");
    //
    //   }
    // }
  }
}