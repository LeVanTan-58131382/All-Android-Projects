import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_english/configs/colors.dart';
import 'package:line_icons/line_icons.dart';
import 'ui/components/drawer.dart';
import 'ui/screens/demo/course/pages/course_home.dart';
import 'ui/screens/demo/food/food_home.dart';
import 'ui/screens/demo/home/home.dart';
import 'configs/constants.dart';
import 'ui/screens/learn_eng/auth/login_sign_up.dart';
import 'ui/screens/learn_eng/main_board.dart';
import 'ui/screens/learn_eng/user/account.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutrition App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      ),
      // home: HomeScreen(),
      // home: MyFoodHomePage(),
      // home: CourseHomePage(),
      // home: LearnEngHomePage(),
      home: RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  int selectedIndex = 0;
  List<Widget> pages = [
    LearnEngHomePage(),
    LoginScreen(),
    Center(
      child: Text(
        "Thông báo",
        style: TextStyle(fontSize: 40),
      ),
    ),
    MyProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: getBody(),
      bottomNavigationBar: bottomNavBar(),
      extendBody: true,
    );
  }

  Widget getBody() {
    return pages.elementAt(selectedIndex);
  }

  bottomNavBar() {
    return Container(
      height: 70.0,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.backgroundColorGreen,
          borderRadius: BorderRadius.circular(25)),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
      margin: EdgeInsets.only(
          left: kDefaultPadding, right: kDefaultPadding, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: selectedIndex == 0 ? AppColors.white : AppColors.backgroundColorGreen,
              borderRadius: BorderRadius.all(Radius.circular(5.0))
            ),
            child: IconButton(
              color: selectedIndex == 0 ? AppColors.red : AppColors.backgroundColorDark,
              iconSize: 30.0,
              icon: const Icon(Icons.home),
              tooltip: "Trang chủ",
              onPressed: (){
                setState(() {
                  selectedIndex = 0;
                });
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: selectedIndex == 1 ? AppColors.white : AppColors.backgroundColorGreen,
                borderRadius: BorderRadius.all(Radius.circular(5.0))
            ),
            child: IconButton(
              color: selectedIndex == 1 ? AppColors.red : AppColors.backgroundColorDark,
              iconSize: 30.0,
              icon: const Icon(Icons.search),
              tooltip: "Tìm kiếm",
              onPressed: (){
                setState(() {
                  selectedIndex = 1;
                });
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: selectedIndex == 2 ? AppColors.white : AppColors.backgroundColorGreen,
                borderRadius: BorderRadius.all(Radius.circular(5.0))
            ),
            child: IconButton(
              color: selectedIndex == 2 ? AppColors.red : AppColors.backgroundColorDark,
              iconSize: 30.0,
              icon: const Icon(Icons.notifications),
              tooltip: "Thông báo",
              onPressed: (){
                setState(() {
                  selectedIndex = 2;
                });
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: selectedIndex == 3 ? AppColors.white : AppColors.backgroundColorGreen,
                borderRadius: BorderRadius.all(Radius.circular(5.0))
            ),
            child: IconButton(
              color: selectedIndex == 3 ? AppColors.red : AppColors.backgroundColorDark,
              iconSize: 30.0,
              icon: const Icon(Icons.person),
              tooltip: "Tài khoản",
              onPressed: (){
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

class NavItem extends StatelessWidget {
  const NavItem({required this.tap, required this.icon, required this.title,});

  final String title;
  final Function tap;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    //   onTap: tap,
    //   child: icon,
    // );
    return IconButton(
      iconSize: 20.0,
      icon: const Icon(Icons.volume_up),
      tooltip: title,
      onPressed: tap(),
    );
  }
}
