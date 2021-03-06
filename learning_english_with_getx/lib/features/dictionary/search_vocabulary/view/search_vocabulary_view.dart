import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:learning_english_with_getx/core/constants/app_style_constants.dart';
import 'package:learning_english_with_getx/features/dictionary/search_vocabulary/controller/search_vocabulary_controller.dart';
import 'package:learning_english_with_getx/ui/widget_components/chip_word_type.dart';
import 'package:line_icons/line_icons.dart';

class SearchVocabularyView extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchVocabularyController>();
    return Obx(() {
      return Scaffold(
        backgroundColor: AppStyles.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppStyles.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Text("Tra cứu"),

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
        body: GestureDetector(
          onTap: () => Get.focusScope!.unfocus(),
          child: Padding(
            padding: const EdgeInsets.only(
                left: AppStyles.kDefaultPadding * 1.5,
                right: AppStyles.kDefaultPadding * 1.5,
                top: 10.0),
            child: ListView(
                children: <Widget>[
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppStyles.grey,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextField(
                      controller: _searchController,
                      cursorColor: AppStyles.black,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Nhập từ cần tra cứu",
                          hintStyle: TextStyle(
                              color: AppStyles.black.withOpacity(0.4)),
                          prefixIcon: Swing(
                            infinite: true,
                            child: Icon(
                              LineIcons.search,
                              color: AppStyles.black.withOpacity(0.8),
                            ),
                          )),
                      onChanged: (value) {
                        controller.searchExpectedWords(value);
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height - 185.0,
                  child: ListView(children: [
                    controller.expectedWords.isNotEmpty
                        ? StaggeredGridView.countBuilder(
                            padding: EdgeInsets.all(0),
                            crossAxisCount: 1,
                            itemCount: controller.expectedWords.length,
                            crossAxisSpacing: 10,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            mainAxisSpacing: 0,
                            itemBuilder: (context, index) {
                              return FadeInUp(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, bottom: 5.0),
                                  child: InkWell(
                                    radius: 20.0,
                                    onTap: (){
                                      Get.focusScope!.unfocus();
                                      Get.toNamed("/detail_word",
                                          arguments: {"wordId": controller.words[index].id});
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                          border: Border.all(
                                            color: AppStyles.grey,
                                            width: 1.0,
                                          )),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.expectedWords[index].word,
                                            style: TextStyle(fontSize: 18.0),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Row(
                                            children: [
                                              chipWordType(
                                                  type: "n", width: 40, height: 20),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            staggeredTileBuilder: (index) =>
                                StaggeredTile.fit(1),
                          )
                        : Container(),
                  ]
                  ),
                ),
              )
            ]
            ),
          ),
        ),
      );
    });
  }
}
