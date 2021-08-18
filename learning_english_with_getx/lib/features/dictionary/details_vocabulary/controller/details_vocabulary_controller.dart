import 'package:get/get.dart';
import 'package:learning_english_with_getx/core/database/personal_vocabulary_images_db.dart';
import 'package:learning_english_with_getx/core/models/image_model.dart';
import 'package:learning_english_with_getx/core/models/word_details_model.dart';
import 'package:learning_english_with_getx/core/repositories/word/word_repo_implement.dart';
import 'package:learning_english_with_getx/features/dictionary/personal_dictionary/personal_vocabulary/controller/personal_vocabulary_controller.dart';

class DetailsVocabularyController extends GetxController
{
    late int wordId;

    RxBool isLoading = false.obs;

    late WordDetails wordDetails;

    // chi tiết của personal word
    late PersonalVocabularyController personalVocabularyController;

    RxList<Image> listImageFromDatabase = <Image>[].obs;

    @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();

    dynamic argument = Get.arguments;
    wordId = argument["wordId"];

    personalVocabularyController = Get.find<PersonalVocabularyController>();

    // personalVocabularyController.onInit();

    personalVocabularyController.words.forEach((element) {
      if(element.id == wordId)
        {
          wordDetails = element;
        }
    });

    await loadImageFromDatabase(wordId);

  }

    Future loadImageFromDatabase(int wordId) async {

      listImageFromDatabase.value = await PersonalVocabularyDatabase.instance.readImagesByCondition(wordId);

      listImageFromDatabase.forEach((element) {
        print(element.image);
      });
    }
}