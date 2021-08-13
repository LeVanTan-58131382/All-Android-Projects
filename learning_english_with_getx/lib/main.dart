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
import 'features/dictionary/personal_dictionary/binding/personal_dictionary_binding.dart';
import 'features/dictionary/personal_dictionary/create_vocabulary/binding/create_vocabulary_binding.dart';
import 'features/dictionary/personal_dictionary/create_vocabulary/view/create_vocabulary_view.dart';
import 'features/dictionary/personal_dictionary/edit_vocabulary/binding/edit_vocabulary_binding.dart';
import 'features/dictionary/personal_dictionary/edit_vocabulary/view/edit_vocabulary_view.dart';
import 'features/dictionary/personal_dictionary/personal_vocabulary/binding/personal_vocabulary_binding.dart';
import 'features/dictionary/personal_dictionary/personal_vocabulary/view/personal_vocabulary_view.dart';
import 'features/dictionary/personal_dictionary/view/personal_dictionary_view.dart';
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
          textTheme: GoogleFonts.rubikTextTheme(Theme.of(context).textTheme)
      ),

      getPages: [
        // first at all
        // GetPage(name: "/root", page: () => RootPage(), bindings: [AuthBinding(), AllVocabularyBinding()]),
        GetPage(name: "/root", page: () => RootPage(), bindings: [ AuthBinding(), SearchVocabularyBinding()]),

        GetPage(name: "/auth", page: () => AuthView(), binding: AuthBinding()),

        GetPage(name: "/all_word", page: () => AllVocabularyView(), binding: AllVocabularyBinding()),

        GetPage(name: "/detail_word", page: () => DetailsVocabularyView(), binding: DetailsVocabularyBinding()),

        GetPage(name: "/search_word", page: () => SearchVocabularyView(), binding: SearchVocabularyBinding()),


        GetPage(name: "/topic", page: () => TopicVocabularyView(), binding: TopicVocabularyBinding()),

        GetPage(name: "/personal_dictionary", page: () => PersonalDictionaryView(), binding: PersonalDictionaryBinding()),

        GetPage(name: "/create_word", page: () => CreateVocabularyView(), binding: CreateVocabularyBinding()),

        GetPage(name: "/personal_vocabulary", page: () => PersonalVocabularyView(), binding: PersonalVocabularyBinding()),

        GetPage(name: "/edit_vocabulary", page: () => EditVocabularyView(), binding: EditVocabularyBinding()),


      ],
      initialRoute: "/root",

      // initialRoute: "/create_word",
      // initialRoute: "/topic",
      // initialRoute: "/personal_dictionary",
    );
  }
}

