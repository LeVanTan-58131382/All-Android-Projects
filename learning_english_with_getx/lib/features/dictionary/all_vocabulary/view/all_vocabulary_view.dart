import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:learning_english_with_getx/core/constants/app_style_constants.dart';
import 'package:learning_english_with_getx/features/dictionary/all_vocabulary/controller/all_vocabulary_controller.dart';
import 'package:learning_english_with_getx/ui/widget_components/chip_word_type.dart';

class AllVocabularyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AllVocabularyController>();
    return Obx(() {
      return Scaffold(
          backgroundColor: Color(0xFF21BFBD),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppStyles.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Danh sách"),
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
          body: ListView(
            children: <Widget>[
              SizedBox(height: 25.0),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElasticInLeft(
                      child: Text('${controller.selectedFilterValue}',
                          style: TextStyle(
                              // fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0)),
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
              ),
              SizedBox(height: 40.0),
              Container(
                height: MediaQuery.of(context).size.height - 185.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0)),
                ),
                child: ListView(
                  primary: false,
                  padding: EdgeInsets.only(left: 25.0, right: 20.0),
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 45.0),
                        child: Container(
                            height: MediaQuery.of(context).size.height - 300.0,
                            child: controller.isLoading.isTrue
                                ? Center(
                                    child: SpinKitCircle(color: Colors.green))
                                : ListView.builder(
                                    controller: controller.scrollController,
                                    itemCount: controller.realShowWords.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (controller.isLoading.isTrue) {
                                        // return SpinKitCircle( color: Colors.green,);
                                        print("đang load dữ liệu");
                                      }

                                      if (index ==
                                              controller.realShowWords.length -
                                                  1 &&
                                          controller
                                              .isMoreDataAvailable.isTrue) {
                                        print(
                                            "$index -- ${controller.realShowWords.length - 1} -- ${controller.isMoreDataAvailable.value}");
                                        return Center(
                                            child: JelloIn(
                                              child: SpinKitCircle(
                                                  color: Colors.green),
                                            ));
                                      }

                                      return FadeInRight(
                                          delay: Duration(milliseconds: 200),
                                          child: buildWordItem(controller, index));
                                    }))),
                  ],
                ),
              )
            ],
          ));
    });
  }

  Widget buildListWordItems(AllVocabularyController controller) {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.all(0),
      crossAxisCount: 1,
      itemCount: controller.words.length,
      crossAxisSpacing: 10,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      mainAxisSpacing: 0,
      itemBuilder: (context, index) {
        return buildWordItem(controller, index);
      },
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
    );
  }

  Widget buildWordItem(AllVocabularyController controller, int index) {

    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(children: [
          InkWell(
            onTap: () {

            },
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                  ),
                  // Divider(),
                ]),
          )
        ]),

        Center(
          child: Container(
            height: 40,
            width: 50,
            child: Center(
              child: TextButton(
                onPressed: () {

                  Get.toNamed("/detail_word",
                      arguments: {"wordId": controller.words[index].id});

                },

                child: FlipInX(
                  delay: Duration(milliseconds: 300),
                    child: Icon(Icons.arrow_forward_ios_outlined, color: AppStyles.backgroundColorDark,),
                  ),

                style: ButtonStyle(
                    overlayColor:
                    MaterialStateProperty.all(AppStyles.backgroundColor_D_Cyan),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(color: AppStyles.backgroundColor_D_Cyan.withOpacity(0.5))))),
              ),
            ),
          ),
        ),

        // Center(
        //   child: InkWell(
        //     highlightColor: Colors.lightBlue,
        //     child: Container(
        //       color: Colors.lightBlue,
        //       height: 50,
        //         width: 50,
        //         child: Icon(Icons.arrow_forward_ios_outlined)),
        //     onTap: () {
        //       Get.toNamed("/detail_word",
        //           arguments: {"wordId": controller.words[index].id});
        //     },
        //   ),
        // ),

      ]),
      SizedBox(
        height: 5,
      ),
      Divider(),
    ]);
  }

  List<Widget> buildListChipWordType(
      AllVocabularyController controller, int index, bool detail) {
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
