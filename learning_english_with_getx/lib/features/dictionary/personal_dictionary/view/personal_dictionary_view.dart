import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_with_getx/core/constants/app_style_constants.dart';
import 'package:learning_english_with_getx/features/dictionary/personal_dictionary/controller/personal_dictionary_controller.dart';

class PersonalDictionaryView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PersonalDictionaryController>();

      return Scaffold(
        backgroundColor: AppStyles.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppStyles.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // IconButton(
              //     icon: Icon(Icons.arrow_back),
              //     onPressed: () {
              //       Get.back();
              //     }),
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
        body: FadeInDown(
            delay: Duration(milliseconds: 300),
            child: getBody(controller)),
        // body: buildTopicList(),
      );
  }

  Widget getBody(PersonalDictionaryController controller) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 40),
      child: ListView(children: <Widget>[
        Text(
          "Từ vựng của tôi",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Tra cứu từ vựng và các tiện ích khác",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
            height: 60,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: AppStyles.kDefaultPadding),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppStyles.primary,
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
                Expanded(child: buildFunctionCategories(controller)),
              ],
            )
        ),
        SizedBox(
          height: 50,
        ),

        BounceInLeft(
          delay: Duration(milliseconds: 350),
          child: Text(
            "bạn có thể...",
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        BounceInRight(
          delay: Duration(milliseconds: 350),
          child: Text(
            "...tự tạo từ vựng cho riêng mình...",
            style: TextStyle(fontSize: 20),
          ),
        ),


        SizedBox(
          height: 20,
        ),
        BounceInLeft(
          delay: Duration(milliseconds: 350),
          child: Text(
            "...tra cứu trên danh sách từ vựng đã tạo...",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppStyles.backgroundColorDark),
          ),
        ),

        SizedBox(
          height: 20,
        ),
        BounceInRight(
          delay: Duration(milliseconds: 350),
          child: Text(
            "...và...",
            style: TextStyle(fontSize: 18,),
          ),
        ),

        SizedBox(
          height: 20,
        ),
        BounceInLeft(
          delay: Duration(milliseconds: 350),
          child: Text(
            "...tự ôn tập, làm bài kiểm tra với các từ vựng đó...",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppStyles.backgroundColorDark),
          ),
        ),

      ]),
    );
  }

  Widget buildFunctionCategories(PersonalDictionaryController controller) {
    return Padding(
      padding: EdgeInsets.only(top: AppStyles.kDefaultPadding),
      child: SizedBox(
        height: 35,
        child: ListView(scrollDirection: Axis.horizontal, children: [
          GestureDetector(
            onTap: () {
              Get.toNamed("/personal_vocabulary");
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
                    Icons.list_outlined,
                    color: AppStyles.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Danh sách từ vựng",
                    style: TextStyle(
                        fontSize: 16,
                        color: AppStyles.white,
                        fontWeight: FontWeight.w300),
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
                        fontWeight: FontWeight.w300),
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
}
