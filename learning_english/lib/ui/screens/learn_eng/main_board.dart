import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_english/ui/components/drawer.dart';
import 'package:learning_english/ui/screens/learn_eng/words/all/all.dart';
import 'package:line_icons/line_icons.dart';
import 'data_json.dart';
import '../../../configs/colors.dart';

class LearnEngHomePage extends StatefulWidget {

  static const String routeName = '/home';

  @override
  _LearnEngHomePageState createState() => _LearnEngHomePageState();
}

class _LearnEngHomePageState extends State<LearnEngHomePage> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // IconButton(
            //     icon: SvgPicture.asset("assets/images/burger_icon.svg"),
            //     onPressed: () {}),
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
      body: getBody(),
      drawer: AppDrawer(),
    );
  }

  Widget getBody() {
    return ListView(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 40),
        children: <Widget>[
          Text(
            "Chào bạn,",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Bạn đang tra cứu từ gì?",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
                color: AppColors.grey, borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: TextField(
                  controller: _searchController,
                  cursorColor: AppColors.black,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Nhập từ cần tra cứu",
                      hintStyle: TextStyle(color: AppColors.black.withOpacity(0.4)),
                      prefixIcon: Icon(
                        LineIcons.search,
                        color: AppColors.black.withOpacity(0.8),
                      )),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Từ vựng theo...",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Text(
                "See All",
                style: TextStyle(
                    fontSize: 17, fontWeight: FontWeight.bold, color: AppColors.primary),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          buildWordCategories(),
          SizedBox(
            height: 50,
          ),
        ]);
  }

  Widget buildWordCategories() {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.all(0),
      crossAxisCount: 2,
      itemCount: online_data_one.length,
      crossAxisSpacing: 10,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      mainAxisSpacing: 0,
      itemBuilder: (context, index) {
        return buildWordItemCategories(index);
      },
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
    );
  }

  Widget buildWordItemCategories(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => AllWordPage(
                      imgDetail: online_data_one[index]['img_detail'],
                      title: online_data_one[index]['title'],
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          decoration: BoxDecoration(
            color: online_data_one[index]["color_theme"],
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 25, right: 18, left: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      online_data_one[index]['title'],
                      style: TextStyle(
                          color: AppColors.whiteGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      online_data_one[index]['sort_description'],
                      style: TextStyle(
                          fontSize: 14, color: AppColors.black.withOpacity(0.6)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                    width: (MediaQuery.of(context).size.width - 100) / 2,
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(online_data_one[index]['img']),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(5))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
