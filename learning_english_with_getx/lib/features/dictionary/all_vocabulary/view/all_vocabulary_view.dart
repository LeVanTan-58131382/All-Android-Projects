import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:learning_english_with_getx/core/constants/app_style_constants.dart';
import 'package:learning_english_with_getx/features/dictionary/all_vocabulary/controller/all_vocabulary_controller.dart';
import 'package:learning_english_with_getx/ui/widget_components/chip_word_type.dart';

class AllVocabularyView extends StatefulWidget
{
  @override
  AllVocabularyViewState createState() => new AllVocabularyViewState();
}

class AllVocabularyViewState extends State<AllVocabularyView>
{
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AllVocabularyController>();

    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: Obx(() {
        return ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  Container(
                      width: 125.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.filter_list),
                            color: Colors.white,
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.menu),
                            color: Colors.white,
                            onPressed: () {},
                          )
                        ],
                      ))
                ],
              ),
            ),
            SizedBox(height: 25.0),
            Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: Row(
                children: <Widget>[
                  Text('Tất cả từ vựng',
                      style: TextStyle(
                        // fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0)),
                  SizedBox(width: 10.0),
                ],
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height - 185.0,
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
                          height: MediaQuery
                              .of(context)
                              .size
                              .height - 300.0,
                          // child: ListView(children: [
                          //   controller.isLoading.isTrue ? SpinKitCircle(
                          //       color: Colors.green) :
                          //   buildListWordItems(controller),
                          // ]
                          // ),
                        child:
                        ListView.builder(
                          controller: controller.scrollController,
                          itemCount: controller.realShowWords.length,
                          itemBuilder: (BuildContext context, int index) {
                            if(controller.isLoading.isTrue)
                              {
                                // return SpinKitCircle( color: Colors.green,);
                                print("đang load dữ liệu");
                              }

                            if (index == controller.realShowWords.length - 1 &&
                                controller.isMoreDataAvailable.isTrue) {
                              print("$index -- ${controller.realShowWords.length - 1} -- ${controller.isMoreDataAvailable.value}");
                              return Center(child: SpinKitCircle(color: Colors.green));
                            }
                            return buildWordItem(controller, index);
                          }
                        )
                      )
                  ),
                ],
              ),
            )
          ],
        );
      }
      ),
    );
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
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => DetailsPage(word: _mapWordFromDatabase(index), listWordType: buildListChipWordType(index, true),)));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        // controller.words[index].word,
                        controller.realShowWords[index].word,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),
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
                    ],
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    child: Center(
                      child: InkWell(
                          child: Icon(Icons.arrow_forward_ios_outlined),
                        onTap: (){
                            Get.toNamed("/detail_word", arguments: {"wordId": controller.words[index].id});
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),

              Row(
                children: buildListChipWordType(controller, index, false),
              ),

              Divider(),
            ]
        ),
      ),
    );
  }

  List<Widget> buildListChipWordType(AllVocabularyController controller, int index, bool detail)
  {
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
    controller.realShowWords[index].partOfSpeech.forEach((element)
    {
      element.name == "noun" ? isNoun = true :
        element.name == "verb" ? isVerb = true :
          element.name == "adjective" ? isAdjective = true :
            element.name == "adverb" ? isAdverb = true :
              element.name == "preposition" ? isPreposition = true :
                element.name == "pronoun" ? isPronoun = true :
                  element.name == "conjunction" ? isConjunction = true :
                    element.name == "interjection" ? isInterjection = true : isNoun = false
      ;
    });

    if( isNoun == true)
    {
      detail == false ? listChipWordType.add(chipWordType(type: "n", width: 40, height: 25)) : listChipWordType.add(chipWordType(type: "danh từ", width: 100, height: 25));
    }
    if( isVerb == true)
    {
      detail == false ? listChipWordType.add(chipWordType(type: "v", width: 40, height: 25)) : listChipWordType.add(chipWordType(type: "động từ", width: 100, height: 25));
    }
    if( isAdjective == true)
    {
      detail == false ? listChipWordType.add(chipWordType(type: "adj", width: 40, height: 25)) : listChipWordType.add(chipWordType(type: "tính từ", width: 100, height: 25));
    }
    if( isAdverb == true)
    {
      detail == false ? listChipWordType.add(chipWordType(type: "adv", width: 40, height: 25)) : listChipWordType.add(chipWordType(type: "trạng từ", width: 100, height: 25));
    }
    if( isPreposition == true)
    {
      detail == false ? listChipWordType.add(chipWordType(type: "pre", width: 40, height: 25)) : listChipWordType.add(chipWordType(type: "giới từ", width: 100, height: 25));
    }

    return listChipWordType;
  }
}