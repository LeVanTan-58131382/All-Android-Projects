import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_english_with_getx/core/constants/app_style_constants.dart';
import 'package:learning_english_with_getx/features/dictionary/details_vocabulary/controller/details_vocabulary_controller.dart';

class DetailsVocabularyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DetailsVocabularyController>();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFF7A9BEE),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppStyles.black,
        title: Text("Chi tiết"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.favorite,
                  color: AppStyles.white,
                  size: 35,
                )),
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
                color: Color(0xFF21BFBD),
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                            tag: "widget.word.id.toString()",
                            child: Text("School",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30.0,
                                  color: AppStyles.backgroundColor_C_DeepGreen,
                                ))),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                            //children: widget.listWordType,
                            ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "/Sờ cun/",
                          style: TextStyle(fontSize: 18.0, color: AppStyles.backgroundColor_B_Grey),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Trường học Trường học Trường học Trường học Trường học Trường học Trường học Trường học ",
                          style: TextStyle(fontSize: 25.0, color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ]),
                )),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: size.height * 0.25),
              padding: EdgeInsets.only(top: 20.0),
              height: size.height * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                  color: AppStyles.white),
              child: SingleChildScrollView(
                // padding: EdgeInsets.fromLTRB(
                //     kDefaultPadding, 0.0, kDefaultPadding, kDefaultPadding),
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Container(
                  alignment: Alignment.topCenter,
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40.0))),
                  child: DefaultTabController(
                    length: 4,
                    child: Scaffold(
                      backgroundColor: Colors.white,
                      appBar: AppBar(
                        backgroundColor: AppStyles.backgroundColorDark,
                        shape: ContinuousRectangleBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(40.0))
                        ),

                        automaticallyImplyLeading: false,
                        flexibleSpace: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TabBar(
                              isScrollable: true,
                              labelColor: AppStyles.white,
                              tabs: [
                                Tab(
                                  text: "Nghĩa",
                                ),
                                Tab(
                                  text: "Phát âm",
                                ),
                                Tab(
                                  text: "Ví dụ",
                                ),
                                Tab(
                                  text: "Ảnh",
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      body: TabBarView(
                        children: [
                          // Tab "Nghĩa"
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(15.0),
                                  alignment: Alignment.topLeft,
                                  height: 350,
                                  color: Colors.amber[600],
                                  child: Text('Entry A'),
                                ),
                                Container(
                                  height: 350,
                                  color: Colors.amber[500],
                                  child: const Center(child: Text('Entry B')),
                                ),
                                Container(
                                  height: 350,
                                  color: Colors.amber[100],
                                  child: const Center(child: Text('Entry C')),
                                ),
                              ],
                            ),
                          ),

                          // Tab "Phát âm"
                          Icon(Icons.directions_transit, size: 350),

                          // Tab "Ví dụ"
                          Icon(Icons.directions_car, size: 350),

                          // Tab "Ảnh"
                          Icon(Icons.directions_car, size: 350),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
