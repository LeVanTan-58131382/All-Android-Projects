import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
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

    // return Scaffold(
    //   backgroundColor: AppStyles.white,
    //   appBar: AppBar(
    //     elevation: 0,
    //     backgroundColor: AppStyles.black,
    //     title: Row(
    //       mainAxisAlignment: MainAxisAlignment.end,
    //       children: <Widget>[
    //         Container(
    //             width: 50,
    //             height: 50,
    //             decoration: BoxDecoration(
    //               shape: BoxShape.circle,
    //               image: DecorationImage(
    //                   image: AssetImage(
    //                     "assets/images/profile_avatar_1.png",
    //                   ),
    //                   fit: BoxFit.fill),
    //             )),
    //       ],
    //     ),
    //   ),
    //   body: buildBody(controller, context),
    //   // body: buildTopicList(),
    // );
  }

  Widget buildBody(
      PersonalVocabularyController controller, BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
        child: Column(children: [
          buildMenu(),
          SizedBox(
            height: 30,
          ),
          buildListPersonalWord(controller),
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
          itemCount: controller.realShowWords.length,
          itemBuilder: (BuildContext context, int index) {
            if (controller.isLoading.isTrue) {
              // return SpinKitCircle( color: Colors.green,);
              print("đang load dữ liệu");
            }

            if (index == controller.realShowWords.length - 1 &&
                controller.isMoreDataAvailable.isTrue) {
              print(
                  "$index -- ${controller.realShowWords.length - 1} -- ${controller.isMoreDataAvailable.value}");
              return Center(child: SpinKitCircle(color: Colors.green));
            }
            return buildWordItem(controller, index);
          }),
    );
  }

  Widget buildWordItem(PersonalVocabularyController controller, int index) {
    return Column(children: [
      InkWell(
        onLongPress: () {
          Get.defaultDialog(
              title: '${controller.realShowWords[index].word}',
              content: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {


                      controller.getPersonalWordDetails(index);
                    },
                    child: Text(
                      'Chi tiết',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppStyles.green),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.editPersonalWord(index);

                      Get.toNamed("/edit_vocabulary",
                          arguments: {"wordId": controller.words[index].id});
                    },
                    child: Text(
                      'Sửa',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppStyles.yellow),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.deletePersonalWord(index);
                    },
                    child: Text(
                      'Xóa',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppStyles.red),
                    ),
                  )
                ],
              ),
              radius: 10.0);
        },
        child:
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // controller.words[index].word,
                    controller.realShowWords[index].word,
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
                  )
                ]),
          Center(
              child: InkWell(
                child: Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {
                  Get.toNamed("/detail_word",
                      arguments: {"wordId": controller.words[index].id});
                },
              ),
          ),
        ]),
            ),
      ),
      SizedBox(
        height: 5,
      ),
      Divider(),
    ]);

    // return Column(
    //   children: [
    //   InkWell(
    //     onTap: () {
    //       // Navigator.of(context).push(MaterialPageRoute(
    //       //     builder: (context) => DetailsPage(word: _mapWordFromDatabase(index), listWordType: buildListChipWordType(index, true),)));
    //     },
    //     child: Column(
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: <Widget>[
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: <Widget>[
    //                   Text(
    //                     // controller.words[index].word,
    //                     controller.realShowWords[index].word,
    //                     style: TextStyle(
    //                         fontSize: 22,
    //                         fontWeight: FontWeight.bold
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: 5,
    //                   ),
    //                   Text(
    //                     // controller.words[index].pronounce,
    //                     controller.realShowWords[index].pronounce,
    //                     style: TextStyle(
    //                       fontSize: 15,
    //                       color: AppStyles.black.withOpacity(0.5),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               Container(
    //                 width: 100,
    //                 height: 45,
    //                 child: Center(
    //                   child: InkWell(
    //                     child: Icon(Icons.arrow_forward_ios_outlined),
    //                     onTap: (){
    //                       // Get.toNamed("/detail_word", arguments: {"wordId": controller.words[index].id});
    //                       Get.defaultDialog(
    //                           title: '',
    //                           content: Row(
    //                             mainAxisSize: MainAxisSize.min,
    //                             children: [
    //
    //                               ElevatedButton(
    //                                 onPressed: () {
    //
    //                                 },
    //                                 child: Text(
    //                                   'Chi tiết',
    //                                   style: TextStyle(color: Colors.white, fontSize: 16.0),
    //                                 ),
    //                                 style: ButtonStyle(
    //                                   backgroundColor: MaterialStateProperty.all<Color>(
    //                                       AppStyles.green),
    //                                 ),
    //                               ),
    //
    //                               SizedBox(
    //                                 width: 10.0,
    //                               ),
    //
    //                               ElevatedButton(
    //                                 onPressed: () {
    //
    //                                 },
    //                                 child: Text(
    //                                   'Sửa',
    //                                   style: TextStyle(color: Colors.white, fontSize: 16.0),
    //                                 ),
    //                                 style: ButtonStyle(
    //                                   backgroundColor: MaterialStateProperty.all<Color>(
    //                                       AppStyles.yellow),
    //                                 ),
    //                               ),
    //
    //                               SizedBox(
    //                                 width: 10.0,
    //                               ),
    //
    //                               ElevatedButton(
    //                                 onPressed: () {
    //
    //                                 },
    //                                 child: Text(
    //                                   'Xóa',
    //                                   style: TextStyle(color: Colors.white, fontSize: 16.0),
    //                                 ),
    //                                 style: ButtonStyle(
    //                                   backgroundColor: MaterialStateProperty.all<Color>(
    //                                       AppStyles.red),
    //                                 ),
    //                               )
    //                             ],
    //                           ),
    //                           radius: 10.0);
    //                     },
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //           SizedBox(
    //             height: 5,
    //           ),
    //
    //           Row(
    //             children: buildListChipWordType(controller, index, false),
    //           ),
    //           // Divider(),
    //         ]
    //     ),
    //   ),
    //
    //     SizedBox(height: 5,),
    //
    //     Divider(),
    // ]
    // );
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

    // controller.words[index].partOfSpeech.forEach((element)
    // {
    //   element.name == "noun" ? isNoun = true :
    //     element.name == "verb" ? isVerb = true :
    //       element.name == "adjective" ? isAdjective = true :
    //         element.name == "adverb" ? isAdverb = true :
    //           element.name == "preposition" ? isPreposition = true :
    //             element.name == "pronoun" ? isPronoun = true :
    //               element.name == "conjunction" ? isConjunction = true :
    //                 element.name == "interjection" ? isInterjection = true : isNoun = false
    //   ;
    // });
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
