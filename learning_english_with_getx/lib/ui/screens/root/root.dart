import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_with_getx/core/constants/app_style_constants.dart';
import 'package:learning_english_with_getx/features/auth/view/auth_view.dart';
import 'package:learning_english_with_getx/features/dictionary/all_vocabulary/view/all_vocabulary_view.dart';
import 'package:learning_english_with_getx/features/dictionary/search_vocabulary/view/search_vocabulary_view.dart';
import 'package:learning_english_with_getx/ui/screens/home/home.dart';

class RootPage extends StatefulWidget
{
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int selectedIndex = 0;

  List<Widget> pageBases = [
    HomePage(),
    SearchVocabularyView(),
    HomePage(),
    AuthView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.white,
      body: pageBases.elementAt(selectedIndex),
      bottomNavigationBar: bottomNavBar(),
      extendBody: true,
    );
  }

  Widget bottomNavBar() {
    return Container(
      height: 70.0,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppStyles.backgroundColorGreen,
          borderRadius: BorderRadius.circular(25)),
      padding: EdgeInsets.symmetric(horizontal: AppStyles.kDefaultPadding * 1.5),
      margin: EdgeInsets.only(
          left: AppStyles.kDefaultPadding, right: AppStyles.kDefaultPadding, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                color: selectedIndex == 0
                    ? AppStyles.white
                    : AppStyles.backgroundColorGreen,
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: IconButton(
              color: selectedIndex == 0
                  ? AppStyles.red
                  : AppStyles.backgroundColorDark,
              iconSize: 30.0,
              icon: const Icon(Icons.home),
              tooltip: "Trang chủ",
              onPressed: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: selectedIndex == 1
                    ? AppStyles.white
                    : AppStyles.backgroundColorGreen,
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: IconButton(
              color: selectedIndex == 1
                  ? AppStyles.red
                  : AppStyles.backgroundColorDark,
              iconSize: 30.0,
              icon: const Icon(Icons.search),
              tooltip: "Tìm kiếm",
              onPressed: () {
                // setState(() {
                //   selectedIndex = 1;
                //
                // });
                Get.toNamed("/search_word");
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: selectedIndex == 2
                    ? AppStyles.white
                    : AppStyles.backgroundColorGreen,
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: IconButton(
              color: selectedIndex == 2
                  ? AppStyles.red
                  : AppStyles.backgroundColorDark,
              iconSize: 30.0,
              icon: const Icon(Icons.notifications),
              tooltip: "Thông báo",
              onPressed: () {
                setState(() {
                  selectedIndex = 2;
                });
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: selectedIndex == 3
                    ? AppStyles.white
                    : AppStyles.backgroundColorGreen,
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: IconButton(
              color: selectedIndex == 3
                  ? AppStyles.red
                  : AppStyles.backgroundColorDark,
              iconSize: 30.0,
              icon: const Icon(Icons.person),
              tooltip: "Tài khoản",
              onPressed: () {
                setState(() {
                  selectedIndex = 3;
                });
              },
            ),
          ),
        ],
      ),
    );
  }


}