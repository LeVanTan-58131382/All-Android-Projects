import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:learning_english_with_getx/core/constants/app_contants.dart';
import 'package:learning_english_with_getx/core/constants/app_style_constants.dart';
import 'package:learning_english_with_getx/ui/widget_components/drawer.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColorDark2,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppStyles.backgroundColorDark,
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
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: AppStyles.white),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Bạn đang tra cứu từ gì?",
            style: TextStyle(fontSize: 18, color: AppStyles.white),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
                color: AppStyles.backgroundColor_E_LightBlue, borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: TextField(
                  controller: _searchController,
                  cursorColor: AppStyles.black,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Nhập từ cần tra cứu",
                      hintStyle: TextStyle(color: AppStyles.black.withOpacity(0.4)),
                      prefixIcon: Icon(
                        LineIcons.search,
                        color: AppStyles.backgroundColor_E_DeepBlue.withOpacity(0.8),
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
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: AppStyles.white),
              ),
              Text(
                "See All",
                style: TextStyle(
                    fontSize: 17, fontWeight: FontWeight.bold, color: AppStyles.primary),
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
      itemCount: AppConstants.banners.length,
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
        Get.toNamed("${AppConstants.banners[index]["url_name"]}");
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          decoration: BoxDecoration(
            color: AppConstants.banners[index]["color_theme"],
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
                      AppConstants.banners[index]['title'],
                      style: TextStyle(
                          color: AppStyles.whiteGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      AppConstants.banners[index]['sort_description'],
                      style: TextStyle(
                          fontSize: 14, color: AppStyles.black.withOpacity(0.6)),
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
                            image: AssetImage(AppConstants.banners[index]['img']),
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