import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_with_getx/core/constants/app_style_constants.dart';
import 'package:learning_english_with_getx/features/auth/controller/auth_controller.dart';

class UserAccountView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final controller = Get.find<AuthController>();

    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppStyles.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Tài khoản"),
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

        body: Stack(
          children: <Widget>[
            ClipPath(
              child: Container(
                  // color: Colors.green.withOpacity(0.8)
                color: Color(0xFF21BFBD),
            ),
              clipper: getClipper(),
            ),
            Positioned(
              width: 350.0,
              top: MediaQuery
                  .of(context)
                  .size
                  .height / 6,
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
                    controller.userNameAccount.value,
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    controller.userEmailAccount.value,
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
                        shadowColor: AppStyles.backgroundColorDark,
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
                                      color: AppStyles.backgroundColor_B_Blue),
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
                                      side: BorderSide(color: AppStyles.backgroundColorDark)))),
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
                        shadowColor: AppStyles.backgroundColorDark,
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
                                      color: AppStyles.backgroundColor_B_Blue),
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
                                      side: BorderSide(color: AppStyles.backgroundColorDark)))),
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
                        shadowColor: AppStyles.backgroundColorDark,
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
                                      color: AppStyles.backgroundColor_B_Blue),
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
                            controller.signOut();
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: AppStyles.backgroundColorDark)))),
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
