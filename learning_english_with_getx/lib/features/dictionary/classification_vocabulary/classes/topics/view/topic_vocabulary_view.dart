import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:learning_english_with_getx/core/constants/app_contants.dart';
import 'package:learning_english_with_getx/core/constants/app_style_constants.dart';
import 'package:learning_english_with_getx/features/dictionary/classification_vocabulary/classes/topics/controller/topic_vocabulary_controller.dart';

class TopicVocabularyView extends StatelessWidget {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: AppStyles.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppStyles.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // IconButton(
            //     icon: SvgPicture.asset("assets/images/burger_icon.svg"),
            //     onPressed: () {}),
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
      body: getBody(),
      // body: buildTopicList(),
    );
  }

  Widget getBody() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 40),
      child: ListView(children: <Widget>[
        Text(
          "Từ vựng theo chủ đề",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Tra cứu từ vựng theo chủ đề",
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 40,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Chọn chủ đề ...",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              "See All",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: AppStyles.primary),
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Container(
            height: 250,
            child: buildTopicList()),


        // Container(
        //   height: 250,
        //     child: Expanded(child: buildTopicList(),)),

        SizedBox(
          height: 30,
        ),

        Container(
            height: 50,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: AppStyles.kDefaultPadding),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 35.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: AppStyles.kDefaultPadding * 0.4),
                      margin: EdgeInsets.only(
                          right: AppStyles.kDefaultPadding * 0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.view_quilt_rounded),
                        ],
                      ),
                    ),
                  ),
                ),

                Expanded(child: buildWordCategories()),
              ],
            )),

        // AnimatedOpacity(
        //   duration: const Duration(milliseconds: 200),
        //   opacity: closeTopContainer?0:1,
        //   child: AnimatedContainer(
        //       duration: const Duration(milliseconds: 200),
        //       width: size.width,
        //       alignment: Alignment.topCenter,
        //       height: closeTopContainer?0:categoryHeight,
        //       child: categoriesScroller),
        // ),

        SizedBox(
          height: 50,
        ),
      ]),
    );
  }

  buildTopicList() {
    return Row(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: AppConstants.banners.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  Get.toNamed("${AppConstants.banners[index]["url_name"]}");
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppConstants.banners[index]["color_theme"],
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 25, right: 18, left: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                AppConstants.banners[index]['title'],
                                style: TextStyle(
                                    color: AppStyles.whiteGrey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                AppConstants.banners[index]['sort_description'],
                                style: TextStyle(
                                    fontSize: 14,
                                    color: AppStyles.black.withOpacity(0.6)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                              width: (MediaQuery.of(context).size.width - 100) / 2,
                              height: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          AppConstants.banners[index]['img']),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]
    );
  }

  Widget buildWordCategories() {
    return Padding(
      padding: EdgeInsets.only(top: AppStyles.kDefaultPadding),
      child: SizedBox(
        height: 35,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: AppConstants.banners.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  this.selectedIndex = index;
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppStyles.backgroundColorDark,
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppStyles.kDefaultPadding * 0.8),
                  margin:
                      EdgeInsets.only(right: AppStyles.kDefaultPadding * 0.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.directions_run, color: AppStyles.white,),
                      SizedBox(width: 5),
                      Text(
                        AppConstants.banners[index]["title"],
                        style: TextStyle(
                            fontSize: 16,
                            color: AppStyles.white,
                            fontWeight: selectedIndex == index
                                ? FontWeight.bold
                                : FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget buildWordItemCategories(int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("${AppConstants.banners[index]["url_name"]}");
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          decoration: BoxDecoration(
            color: AppConstants.banners[index]["color_theme"],
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 25, right: 18, left: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      AppConstants.banners[index]['title'],
                      style: TextStyle(
                          color: AppStyles.whiteGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      AppConstants.banners[index]['sort_description'],
                      style: TextStyle(
                          fontSize: 14,
                          color: AppStyles.black.withOpacity(0.6)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                    width: (MediaQuery.of(context).size.width - 100) / 2,
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage(AppConstants.banners[index]['img']),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(5))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
