import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_with_getx/core/constants/app_style_constants.dart';
import 'package:learning_english_with_getx/features/auth/view/auth_view.dart';
import 'package:learning_english_with_getx/features/dictionary/search_vocabulary/view/search_vocabulary_view.dart';
import 'package:learning_english_with_getx/ui/screens/home/home.dart';
import 'package:learning_english_with_getx/ui/screens/root/controller/root_controller.dart';

class RootPage extends StatelessWidget {

  List<Widget> basePages = [
    HomePage(),
    SearchVocabularyView(),
    HomePage(),
    AuthView(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RootController>();

    return Obx(() {
      return Scaffold(
        backgroundColor: AppStyles.white,
        body: basePages.elementAt(controller.selectedIndex.value),
        bottomNavigationBar: bottomNavBar(controller),
        extendBody: true,
      );
    });
  }

  Widget bottomNavBar(RootController controller) {
    return Container(
      height: 70.0,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppStyles.backgroundColorDark,
          borderRadius: BorderRadius.circular(25)),
      padding:
          EdgeInsets.symmetric(horizontal: AppStyles.kDefaultPadding * 1.5),
      margin: EdgeInsets.only(
          left: AppStyles.kDefaultPadding,
          right: AppStyles.kDefaultPadding,
          bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                color: controller.selectedIndex.value == 0
                    ? AppStyles.white
                    : AppStyles.backgroundColor_B_Green,
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: IconButton(
              color: controller.selectedIndex.value == 0
                  ? AppStyles.backgroundColor_B_Blue
                  : AppStyles.white,
              iconSize: 30.0,
              icon: const Icon(Icons.home),
              tooltip: "Trang chủ",
              onPressed: () {
                controller.changeSelectedIndex(0);
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: controller.selectedIndex.value == 1
                    ? AppStyles.white
                    : AppStyles.backgroundColor_B_Green,
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: IconButton(
              color: controller.selectedIndex.value == 1
                  ? AppStyles.backgroundColor_B_Blue
                  : AppStyles.white,
              iconSize: 30.0,
              icon: const Icon(Icons.search),
              tooltip: "Tìm kiếm",
              onPressed: () {
                controller.changeSelectedIndex(1);
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: controller.selectedIndex.value == 2
                    ? AppStyles.white
                    : AppStyles.backgroundColor_B_Green,
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: IconButton(
              color: controller.selectedIndex.value == 2
                  ? AppStyles.backgroundColor_B_Blue
                  : AppStyles.white,
              iconSize: 30.0,
              icon: const Icon(Icons.notifications),
              tooltip: "Thông báo",
              onPressed: () {
                controller.changeSelectedIndex(2);
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: controller.selectedIndex.value == 3
                    ? AppStyles.white
                    : AppStyles.backgroundColor_B_Green,
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: IconButton(
              color: controller.selectedIndex.value == 3
                  ? AppStyles.backgroundColor_B_Blue
                  : AppStyles.white,
              iconSize: 30.0,
              icon: const Icon(Icons.person),
              tooltip: "Tài khoản",
              onPressed: () {
                controller.changeSelectedIndex(3);
              },
            ),
          ),
        ],
      ),
    );
  }
}
