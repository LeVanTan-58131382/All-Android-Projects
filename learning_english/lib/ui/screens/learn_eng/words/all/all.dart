import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:learning_english/configs/colors.dart';
import 'package:learning_english/core/services/word_service.dart';
import 'package:learning_english/models/word.dart';
import 'package:learning_english/ui/screens/learn_eng/words/components/chip_word_type.dart';
import '../../data_json.dart';
import 'details.dart';

class AllWordPage extends StatefulWidget {
  final String imgDetail;
  final String title;

  const AllWordPage({required this.imgDetail, required this.title});

  @override
  _AllWordPageState createState() => _AllWordPageState();
}

class _AllWordPageState extends State<AllWordPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {},
                ),
                Container(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.filter_list),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.menu),
                          color: Colors.white,
                          onPressed: () {},
                        )
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Tất cả từ vựng',
                    style: TextStyle(
                        // fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height - 300.0,
                        child: ListView(children: [
                          buildListWordItems(),
                        ]))),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildListWordItems() {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.all(0),
      crossAxisCount: 1,
      itemCount: course_content.length,
      crossAxisSpacing: 10,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      mainAxisSpacing: 0,
      itemBuilder: (context, index) {
        return buildWordItem(index);
      },
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
    );
  }

  Widget buildWordItem(int index) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailsPage(word: _mapWordFromDatabase(index), listWordType: buildListChipWordType(index, true),)));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    listWords[index]['word'],
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    listWords[index]['pronounce'],
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              Container(
                width: 45,
                height: 45,
                child: Center(
                  child: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),

          Row(
            children: buildListChipWordType(index, false),
          ),

            Divider(),
        ]
        ),
      ),
    );
  }

  // TODO: mot bien dang "word" de truyen den trang "details"
  Word _mapWordFromDatabase(int index)
  {
    return new Word(
      id: listWords[index]["id"],
      word: listWords[index]["word"],
      pronounce: listWords[index]["pronounce"],
      mean: listWords[index]["means"],
      partOfSpeech: listWords[index]["partOfSpeech"],
    );
  }

  List<Widget> buildListChipWordType(int index, bool detail)
  {
    List<Widget> listChipWordType = [];
  //   "nouns": 0,
  // "pronouns": 0,
  // "adjectives": 0,
  // "verbs": 1,
  //   "adverbs": 0,
  //   "prepositions": 0,
  // "conjunctions": 0,
  // "interjections": 0,

    // if(listWords[index]["nouns"] == true)
    // {
    //   detail == false ? listChipWordType.add(chipWordType(type: "n", width: 40, height: 25)) : listChipWordType.add(chipWordType(type: "danh từ", width: 100, height: 25));
    // }
    // if(listWords[index]["verbs"] == true)
    // {
    //   detail == false ? listChipWordType.add(chipWordType(type: "v", width: 40, height: 25)) : listChipWordType.add(chipWordType(type: "động từ", width: 100, height: 25));
    // }
    // if(listWords[index]["adjectives"] == true)
    // {
    //   detail == false ? listChipWordType.add(chipWordType(type: "adj", width: 40, height: 25)) : listChipWordType.add(chipWordType(type: "tính từ", width: 100, height: 25));
    // }
    // if(listWords[index]["adverbs"] == true)
    // {
    //   detail == false ? listChipWordType.add(chipWordType(type: "adv", width: 40, height: 25)) : listChipWordType.add(chipWordType(type: "trạng từ", width: 100, height: 25));
    // }
    // if(listWords[index]["prepositions"] == true)
    // {
    //   detail == false ? listChipWordType.add(chipWordType(type: "pre", width: 40, height: 25)) : listChipWordType.add(chipWordType(type: "giới từ", width: 100, height: 25));
    // }

    return listChipWordType;
    //return  Row(children: listChipWordType);
  }
}
