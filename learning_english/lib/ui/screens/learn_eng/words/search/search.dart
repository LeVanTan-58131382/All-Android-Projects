import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:learning_english/configs/colors.dart';
import 'package:learning_english/configs/constants.dart';
import 'package:learning_english/core/database/word_database.dart';
import 'package:learning_english/core/services/word_service.dart';
import 'package:learning_english/models/word.dart';
import 'package:learning_english/ui/screens/learn_eng/words/components/chip_word_type.dart';
import 'package:line_icons/line_icons.dart';

import '../../data_json.dart';

class SearchPage extends StatefulWidget {
  static const String routeName = '/search';

  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {

  late WordService wordService;
  late List<Word> words;

  getAllWord() async {
    wordService = new WordService();
    wordService.init();
    await wordService.getAllWordFromServer();
    print(wordService.words);
    await equal();
  }

  equal() async{
    words = await WordDatabase.instance.readWords();
    print(words);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getAllWord();

  }

  TextEditingController _searchController = TextEditingController();

  // List<dynamic> mainDataList = listWords;

  // List<Widget> intermediateList = [];

  // Copy Main List into New List.
  // List<dynamic> newDataList = List.from(listWords);
  List<Word> newDataList = [];

  onItemChanged(String value) {
    setState(() {
      if (_searchController.text.isEmpty) {
        print("chưa nhập từ");
        newDataList = [];
      } else {
        newDataList = [];
        for (int i = 0; i < words.length; i++) {
          if ((words[i].word)
                  .toLowerCase()
                  .contains(value.toLowerCase()) &&
              value.isNotEmpty) {
            newDataList.add(listWords[i]);
            print("có ${words[i].word}");
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: kDefaultPadding * 1.5,
              right: kDefaultPadding * 1.5,
              top: 10.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextField(
                      controller: _searchController,
                      cursorColor: AppColors.black,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Nhập từ cần tra cứu",
                          hintStyle: TextStyle(
                              color: AppColors.black.withOpacity(0.4)),
                          prefixIcon: Icon(
                            LineIcons.search,
                            color: AppColors.black.withOpacity(0.8),
                          )),
                      onChanged: onItemChanged,
                    ),
                  ),
                ),
              ),
              Expanded(
                // child: ListView(
                //   padding: EdgeInsets.all(12.0),
                //   children: newDataList.map((data) {
                //     return ListTile(
                //       title: Text(data),
                //       subtitle: Row(
                //
                //       ),
                //       onTap: ()=> print(data),);
                //   }).toList(),
                // ),
                child: Column(children: [
                  newDataList.isNotEmpty
                      ? StaggeredGridView.countBuilder(
                          padding: EdgeInsets.all(0),
                          crossAxisCount: 1,
                          itemCount: newDataList.length,
                          crossAxisSpacing: 10,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          mainAxisSpacing: 0,
                          itemBuilder: (context, index) {
                            // return ListTile(
                            //     title: Text(newDataList[index]["word"], style: TextStyle(fontSize: 18.0),),
                            //     subtitle: Row(
                            //         children: [
                            //           chipWordType(type: "n", width: 40, height: 20),
                            //         ],
                            //     ),
                            // );
                            return Padding(
                              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: Container(
                                padding: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  border: Border.all(color: AppColors.grey, width: 1.0,)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(newDataList[index].word, style: TextStyle(fontSize: 18.0),),
                                    SizedBox(height: 5.0,),
                                    Row(
                                      children: [
                                        chipWordType(type: "n", width: 40, height: 20),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                        )
                      : Container(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
