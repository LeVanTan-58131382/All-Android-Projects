import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

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
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(),
            _createDrawerItem(
              icon: Icons.home,
              text: 'Trang chủ',
              onTap: () {},),
            Divider(),
            _createDrawerItem(
                icon: Icons.account_circle,
                text: 'Tài khoản',
                onTap: () =>
                {

                }),
            Divider(),
            _createDrawerItem(
              icon: Icons.screen_search_desktop,
              text: 'Từ điển của tôi',
              onTap: () {
                Get.toNamed("/create_word");
              },),
            Divider(),
            _createDrawerItem(
              icon: Icons.favorite_border,
              text: 'Yêu thích',
              onTap: () {},),
            Divider(),
            _createDrawerItem(
              icon: Icons.settings,
              text: 'Cài đặt',
              onTap: () {},),
            Divider(),
          ],
        )
    );
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
              bottom: 15.0,
              left: 16.0,
              child: Text("Từ Điển Mini",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
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
            child: Text(text, style: TextStyle(fontWeight: FontWeight.bold),),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
