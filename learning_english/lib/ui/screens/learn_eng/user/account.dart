import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {

  static const String routeName = '/profile';

  @override
  _MyProfile createState() => new _MyProfile();
}

class _MyProfile extends State<MyProfile> {
  String name = "Le Van Tan";
  String email = "vantan@gmail.com";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          ClipPath(
            child: Container(
                color: Colors.green.withOpacity(0.8)),
            clipper: getClipper(),
          ),
          Positioned(
            width: 350.0,
            top: MediaQuery.of(context).size.height / 5,
            child: Column(
              children: <Widget>[
                Container(
                  width: 150.0,
                  height: 150.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      child: Image.asset(
                        "assets/images/profile_avatar_1.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 70.0),
                Text(
                  this.name,
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                SizedBox(height: 15.0),
                Text(
                  this.email,
                  style: TextStyle(
                      fontSize: 17.0,
                      fontStyle: FontStyle.italic,
                      color: Colors.black54),
                ),
                SizedBox(height: 30.0),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    height: 50.0,
                    width: 200.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.green,
                      elevation: 6.0,
                      child: TextButton(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Text(
                                "Trang chủ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Icon(
                                Icons.home_outlined,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {

                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(color: Colors.green)))),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25.0),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    height: 50.0,
                    width: 200.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.green,
                      elevation: 6.0,
                      child: TextButton(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Text(
                                "Cài đặt",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Icon(
                                Icons.settings_outlined,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {

                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(color: Colors.green)))),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25.0),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    height: 50.0,
                    width: 200.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.green,
                      elevation: 6.0,
                      child: TextButton(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Text(
                                "Đăng xuất",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Icon(
                                Icons.logout_outlined,
                                color: Colors.redAccent,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {

                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(color: Colors.green)))),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      //drawer: AppDrawer(),
    );
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
