import 'package:flutter/material.dart';

import '../../routes.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawer createState() => new _AppDrawer();
}

class _AppDrawer extends State<AppDrawer> {
  var dataAfterGetFromLocalStorage;
  var accessToken;

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
            onTap: () => Navigator.pushNamed(context, AppRoutes.home)),
        Divider(),
        _createDrawerItem(
            icon: Icons.home,
            text: 'Demo Screen A',
            onTap: () => Navigator.pushNamed(context, AppRoutes.demoScreenA)),
        Divider(),
        _createDrawerItem(
            icon: Icons.home,
            text: 'Demo Screen B',
            onTap: () => Navigator.pushNamed(context, AppRoutes.demoScreenB)),
        Divider(),
        _createDrawerItem(
            icon: Icons.home,
            text: 'Demo Screen C',
            onTap: () => Navigator.pushNamed(context, AppRoutes.demoScreenC)),
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
          image: AssetImage("assets/images/thumbnail.png"),
          fit: BoxFit.cover,
        )),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Learn English",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
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
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
