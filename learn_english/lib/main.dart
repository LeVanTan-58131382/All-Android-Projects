import 'dart:math';
import 'package:flutter/material.dart';
import 'configs/colors.dart';
import 'configs/fonts.dart';
import 'recipe/recipe_main.dart';
import 'routes.dart';
import 'ui/screens/DemoScreenA.dart';
import 'ui/screens/DemoScreenB.dart';
import 'ui/screens/DemoScreenC.dart';
import 'ui/screens/Home.dart';

void main() {
  //runApp(MyApp());
  runApp(MyRecipeApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialApp(
      color: Colors.white,
      title: 'Flutter Pokedex',
      theme: ThemeData(
        fontFamily: AppFonts.circularStd,
        textTheme: theme.textTheme.apply(
          fontFamily: AppFonts.circularStd,
          displayColor: AppColors.black,
        ),
        scaffoldBackgroundColor: AppColors.lightGrey,
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => HomeScreen(),
        AppRoutes.demoScreenA: (context) => DemoScreenA(),
        AppRoutes.demoScreenB: (context) => DemoScreenB(),
        AppRoutes.demoScreenC: (context) => DemoScreenC(),
      }
    );
  }
}
