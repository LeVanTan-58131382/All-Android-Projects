import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/NavItem.dart';
import 'screens/home/home_recipe_screen.dart';
import 'screens/profile/profile_recipe_screen.dart';

class MyRecipeApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavItems(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Recipe App',
        theme: ThemeData(
          // backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          // We apply this to our appBarTheme because most of our appBar have this style
          appBarTheme: AppBarTheme(color: Colors.white, elevation: 0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: HomeRecipeScreen(),
        home: ProfileRecipeScreen(),
      ),
    );
  }
}