import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_english_with_getx/core/constants/app_style_constants.dart';
import 'package:learning_english_with_getx/features/dictionary/personal_dictionary/personal_vocabulary/controller/personal_vocabulary_controller.dart';
import 'package:learning_english_with_getx/ui/widget_components/chip_word_type.dart';

class PersonalVocabularyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PersonalVocabularyController>();

    return Obx(() {
      return Scaffold(
        backgroundColor: AppStyles.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppStyles.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/profile_avatar_1.png",
                        ),
                        fit: BoxFit.fill),
                  )),
            ],
          ),
        ),

        body: buildBody(controller, context),
        // body: buildTopicList(),
      );
    });
  }

  Widget buildBody(
      PersonalVocabularyController controller, BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 0),
        child: Column(children: [
          buildMenu(),
          SizedBox(
            height: 10,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ElasticInLeft(
                child: Text('${controller.selectedFilterValue}',
                    style: TextStyle(
                      // fontFamily: 'Montserrat',
                        color: AppStyles.backgroundColorDark,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0)),
              ),
              SizedBox(width: 10.0),
              ElasticInRight(
                child: DropdownButton(
                  hint: Text(
                    'Chọn',
                  ),
                  onChanged: (newValue) {
                    controller.onChangeFilterValue(newValue.toString());
                  },
                  value: controller.selectedFilterValue.value,
                  items: controller.filterValues.map((selectedType) {
                    return DropdownMenuItem(
                      child: ElasticIn(
                        child: new Text(
                          selectedType,
                        ),
                      ),
                      value: selectedType,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 10,
          ),

          controller.isLoading.value == false ? buildListPersonalWord(controller) : BounceInUp(child: SpinKitCircle(color: Colors.red)),
        ]));
  }

  Container buildMenu() {
    return Container(
        height: 60,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: AppStyles.kDefaultPadding),
              child: GestureDetector(
                onTap: () {},
                child: buildIconMenu(),
              ),
            ),
            Expanded(child: buildFunctionCategories()),
          ],
        ));
  }

  Container buildIconMenu() {
    return Container(
      height: 50.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppStyles.primary,
      ),
      padding:
          EdgeInsets.symmetric(horizontal: AppStyles.kDefaultPadding * 0.4),
      margin: EdgeInsets.only(right: AppStyles.kDefaultPadding * 0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.view_quilt_rounded),
        ],
      ),
    );
  }

  Widget buildFunctionCategories() {
    return Padding(
      padding: EdgeInsets.only(top: AppStyles.kDefaultPadding),
      child: SizedBox(
        height: 35,
        child: ListView(scrollDirection: Axis.horizontal, children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppStyles.backgroundColorDark,
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: AppStyles.kDefaultPadding * 0.8),
              margin: EdgeInsets.only(right: AppStyles.kDefaultPadding * 0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.list_outlined,
                    color: AppStyles.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Danh sách từ vựng",
                    style: TextStyle(
                        fontSize: 16,
                        color: AppStyles.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed("/create_word");
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppStyles.backgroundColorDark,
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: AppStyles.kDefaultPadding * 0.8),
              margin: EdgeInsets.only(right: AppStyles.kDefaultPadding * 0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.create_outlined,
                    color: AppStyles.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Tạo từ vựng",
                    style: TextStyle(
                        fontSize: 16,
                        color: AppStyles.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppStyles.backgroundColorDark,
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: AppStyles.kDefaultPadding * 0.8),
              margin: EdgeInsets.only(right: AppStyles.kDefaultPadding * 0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.menu_book_outlined,
                    color: AppStyles.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Ôn từ vựng",
                    style: TextStyle(
                        fontSize: 16,
                        color: AppStyles.white,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget buildListPersonalWord(PersonalVocabularyController controller) {
    return Expanded(
      child: ListView.builder(
          controller: controller.scrollController,
          // itemCount: controller.realShowWords.length + 1,
          itemCount: controller.realShowWords.length,
          itemBuilder: (BuildContext context, int index) {
            if (controller.isLoading.isTrue) {
              // return SpinKitCircle( color: Colors.green,);
              print("đang load dữ liệu");
            }
            return buildWordItem(controller, index);
          }),
    );
  }

  Widget buildWordItem(PersonalVocabularyController controller, int index) {

    return FadeInLeftBig(
      child: Column(
          children: [
        InkWell(
          onLongPress: () {
            Get.defaultDialog(
                title: '${controller.realShowWords[index].word}',
                content: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElasticInLeft(
                      child: TextButton(
                        onPressed: () {
                          // controller.getPersonalWordDetails(index);

                          Get.back();
                          Get.toNamed("/detail_word",
                              arguments: {"wordId": controller.realShowWords[index].id});
                        },
                        child: Center(
                          child: Text(
                            'Chi tiết',
                            style:
                            GoogleFonts.nunito(
                              fontSize: 14,
                              color: AppStyles
                                  .backgroundColorDark,
                              fontWeight:
                              FontWeight.w700,
                            ),
                          ),
                        ),
                        style: ButtonStyle(
                            overlayColor:
                            MaterialStateProperty.all(
                                AppStyles
                                    .lightGreen),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                    50.0),
                                side: BorderSide(
                                    color: AppStyles
                                        .backgroundColorDark)))),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    ElasticInDown(
                      child: TextButton(
                        onPressed: () {
                          controller.editPersonalWord(index);
                        },
                        child: Center(
                          child: Text(
                            'Cập nhật',
                            style:
                            GoogleFonts.nunito(
                              fontSize: 14,
                              color: AppStyles
                                  .backgroundColorDark,
                              fontWeight:
                              FontWeight.w700,
                            ),
                          ),
                        ),
                        style: ButtonStyle(
                            overlayColor:
                            MaterialStateProperty.all(
                                AppStyles
                                    .lightBlue),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                    50.0),
                                side: BorderSide(
                                    color: AppStyles
                                        .backgroundColorDark)))),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    ElasticInRight(
                      child: TextButton(
                        onPressed: () {
                          controller.deletePersonalWord(index);
                        },
                        child: Center(
                          child: Text(
                            'Xóa',
                            style:
                            GoogleFonts.nunito(
                              fontSize: 14,
                              color: AppStyles
                                  .backgroundColorDark,
                              fontWeight:
                              FontWeight.w700,
                            ),
                          ),
                        ),
                        style: ButtonStyle(
                            overlayColor:
                            MaterialStateProperty.all(
                                AppStyles
                                    .lightRed),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                    50.0),
                                side: BorderSide(
                                    color: AppStyles
                                        .backgroundColorDark)))),
                      ),
                    )
                  ],
                ),
                radius: 10.0);
          },
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      // controller.words[index].word,
                      controller.realShowWords[index].word.length > 15 ? controller.realShowWords[index].word.substring(0, 15)+'...' : controller.realShowWords[index].word,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      // controller.words[index].pronounce,
                      controller.realShowWords[index].pronounce,
                      style: TextStyle(
                        fontSize: 15,
                        color: AppStyles.black.withOpacity(0.5),
                      ),
                    ),

                    SizedBox(
                      height: 5,
                    ),

                    Row(
                      children: buildListChipWordType(controller, index, false),
                    ),
                    // Divider(),
                  ])
            ]),

            Center(
              child: Container(
                height: 40,
                width: 50,
                child: Center(
                  child: TextButton(
                    onPressed: () {

                      Get.toNamed("/detail_word",
                          arguments: {"wordId": controller.realShowWords[index].id});

                      print("id của từ: ${controller.realShowWords[index].id}");
                    },

                    child: FlipInX(
                      child: Icon(Icons.arrow_forward_ios_outlined, color: Colors.blueGrey,),
                    ),

                    style: ButtonStyle(
                        overlayColor:
                        MaterialStateProperty.all(AppStyles.backgroundColor_D_Cyan),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(color: Colors.blueGrey)))),
                  ),
                ),
              ),
            ),
          ]),
        ),
        SizedBox(
          height: 5,
        ),
        Divider(),
      ]),
    );
  }

  List<Widget> buildListChipWordType(
      PersonalVocabularyController controller, int index, bool detail) {
    List<Widget> listChipWordType = [];

    bool isNoun = false;
    bool isVerb = false;
    bool isAdjective = false;
    bool isAdverb = false;
    bool isPreposition = false;
    bool isPronoun = false;
    bool isConjunction = false;
    bool isInterjection = false;

    controller.realShowWords[index].partOfSpeech.forEach((element) {
      element.name == "noun"
          ? isNoun = true
          : element.name == "verb"
              ? isVerb = true
              : element.name == "adjective"
                  ? isAdjective = true
                  : element.name == "adverb"
                      ? isAdverb = true
                      : element.name == "preposition"
                          ? isPreposition = true
                          : element.name == "pronoun"
                              ? isPronoun = true
                              : element.name == "conjunction"
                                  ? isConjunction = true
                                  : element.name == "interjection"
                                      ? isInterjection = true
                                      : isNoun = false;
    });

    if (isNoun == true) {
      detail == false
          ? listChipWordType.add(chipWordType(type: "n", width: 40, height: 25))
          : listChipWordType
              .add(chipWordType(type: "danh từ", width: 100, height: 25));
    }
    if (isVerb == true) {
      detail == false
          ? listChipWordType.add(chipWordType(type: "v", width: 40, height: 25))
          : listChipWordType
              .add(chipWordType(type: "động từ", width: 100, height: 25));
    }
    if (isAdjective == true) {
      detail == false
          ? listChipWordType
              .add(chipWordType(type: "adj", width: 40, height: 25))
          : listChipWordType
              .add(chipWordType(type: "tính từ", width: 100, height: 25));
    }
    if (isAdverb == true) {
      detail == false
          ? listChipWordType
              .add(chipWordType(type: "adv", width: 40, height: 25))
          : listChipWordType
              .add(chipWordType(type: "trạng từ", width: 100, height: 25));
    }
    if (isPreposition == true) {
      detail == false
          ? listChipWordType
              .add(chipWordType(type: "pre", width: 40, height: 25))
          : listChipWordType
              .add(chipWordType(type: "giới từ", width: 100, height: 25));
    }

    return listChipWordType;
  }
}
