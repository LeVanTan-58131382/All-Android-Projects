import 'package:flutter/cupertino.dart';
import 'package:learning_english/ui/screens/learn_eng/auth/login_sign_up.dart';
import 'package:learning_english/ui/screens/learn_eng/main_board.dart';
import 'package:learning_english/ui/screens/learn_eng/user/account.dart';
import 'package:learning_english/ui/screens/learn_eng/words/search/search.dart';

import '../main.dart';

class AppRoutes {
  static const String home = LearnEngHomePage.routeName;
  static const String auth = AuthScreen.routeName;
  static const String profile = MyProfile.routeName;
  static const String root = RootPage.routeName;
  static const String search = SearchPage.routeName;

  // init(BuildContext context) => {
  // //Map<String, Widget Function(BuildContext)>
  //   AppRoutes.home: (context) => LearnEngHomePage(),
  //   AppRoutes.auth: (context) => AuthScreen(),
  //   AppRoutes.profile: (context) => MyProfile(),
  //   AppRoutes.root: (context) => RootPage(),
  // };
}