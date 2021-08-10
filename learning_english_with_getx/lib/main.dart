import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_english_with_getx/core/constants/app_style_constants.dart';

import 'features/auth/binding/auth_binding.dart';
import 'features/auth/view/auth_view.dart';
import 'features/dictionary/all_vocabulary/binding/all_vocabulary_binding.dart';
import 'features/dictionary/all_vocabulary/view/all_vocabulary_view.dart';
import 'features/dictionary/classification_vocabulary/classes/topics/binding/topic_vocabulary_binding.dart';
import 'features/dictionary/classification_vocabulary/classes/topics/view/topic_vocabulary_view.dart';
import 'features/dictionary/details_vocabulary/binding/details_vocabulary_binding.dart';
import 'features/dictionary/details_vocabulary/view/details_vocabulary_view.dart';
import 'features/dictionary/personal_dictionary/create_vocabulary/binding/create_vocabulary_binding.dart';
import 'features/dictionary/personal_dictionary/create_vocabulary/view/create_vocabulary_view.dart';
import 'features/dictionary/search_vocabulary/binding/search_vocabulary_binding.dart';
import 'features/dictionary/search_vocabulary/view/search_vocabulary_view.dart';
import 'features/test/flutter_spinkit.dart';
import 'ui/screens/home/home.dart';
import 'ui/screens/root/root.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppStyles.kPrimaryColor,
        scaffoldBackgroundColor: AppStyles.kBackgroundColor,
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      ),

      getPages: [
        // first at all
        // GetPage(name: "/root", page: () => RootPage(), bindings: [AuthBinding(), AllVocabularyBinding()]),
        GetPage(name: "/root", page: () => RootPage(), binding: AuthBinding()),

        GetPage(name: "/auth", page: () => AuthView(), binding: AuthBinding()),

        GetPage(name: "/all_word", page: () => AllVocabularyView(), binding: AllVocabularyBinding()),

        GetPage(name: "/detail_word", page: () => DetailsVocabularyView(), binding: DetailsVocabularyBinding()),

        GetPage(name: "/search_word", page: () => SearchVocabularyView(), binding: SearchVocabularyBinding()),

        GetPage(name: "/create_word", page: () => CreateVocabularyView(), binding: CreateVocabularyBinding()),

        GetPage(name: "/topic", page: () => TopicVocabularyView(), binding: TopicVocabularyBinding()),



      ],
      // initialRoute: "/root",

      // initialRoute: "/create_word",
      initialRoute: "/topic",
    );
  }
}

