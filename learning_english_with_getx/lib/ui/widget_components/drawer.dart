import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_english_with_getx/core/constants/app_style_constants.dart';
import 'package:learning_english_with_getx/features/auth/controller/auth_controller.dart';
import 'package:learning_english_with_getx/ui/screens/root/controller/root_controller.dart';
import '../screens/root/view/root.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawer createState() => new _AppDrawer();
}

class _AppDrawer extends State<AppDrawer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final rootController = Get.find<RootController>();

    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        _createHeader(),

        ElasticInRight(
          child: _createDrawerItem(
            icon: Icons.home,
            text: 'Trang chủ',
            onTap: () {},
          ),
        ),
        Divider(),
        ElasticInLeft(
          child: _createDrawerItem(
            icon: Icons.account_circle,
            text: 'Tài khoản',
            onTap: () async {
              await authController.checkLogged() == true
                  ? print("Đã đăng nhập")
                  : print("Chưa đăng nhập");

              if (await authController.checkLogged() == true) {
                Get.toNamed("/me");
              } else {

                rootController.changeSelectedIndex(3);
                authController.changeTargetPage("/me");
              }
            },
          ),
        ),
        Divider(),
        ElasticInRight(
          child: _createDrawerItem(
            icon: Icons.screen_search_desktop,
            text: 'Từ điển của tôi',
            onTap: () async {
              await authController.checkLogged() == true
                  ? print("Đã đăng nhập")
                  : print("Chưa đăng nhập");

              if (await authController.checkLogged() == true) {
                Get.toNamed("/personal_dictionary");
              } else {

                rootController.changeSelectedIndex(3);
                authController.changeTargetPage("/personal_dictionary");
              }
            },
          ),
        ),
        Divider(),
        ElasticInLeft(
          child: _createDrawerItem(
            icon: Icons.favorite_border,
            text: 'Yêu thích',
            onTap: () {},
          ),
        ),
        Divider(),
        ElasticInRight(
          child: _createDrawerItem(
            icon: Icons.settings,
            text: 'Cài đặt',
            onTap: () {},
          ),
        ),
        Divider(),
      ],
    ));
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            // color: Colors.blue,
            image: DecorationImage(
          image: AssetImage("assets/images/drawer.png"),
          fit: BoxFit.fill,
        )),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 20.0,
              left: 16.0,
              child: Text("Từ Điển Mini",
                  // style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 20.0,
                  //     fontWeight: FontWeight.w500)
                style: GoogleFonts.nunito(
                  fontSize: 22,
                  color: AppStyles.white,
                  fontWeight: FontWeight.w600,
                  // fontStyle: FontStyle.italic,
                ),
              )
          ),
        ]));
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              // style: TextStyle(
              //     fontSize: 16,
              //     color: AppStyles.backgroundColorDark,
              //     fontWeight: FontWeight.w300,
              //
              // ),
              style: GoogleFonts.nunito(
                fontSize: 16,
                color: AppStyles.backgroundColorDark,
                fontWeight: FontWeight.w700,
                // fontStyle: FontStyle.italic,
              ),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
