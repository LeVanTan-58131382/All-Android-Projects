import 'package:flutter/material.dart';
import 'package:learning_english/models/word.dart';

// TODO: de tam day
const kPrimaryColor = Color(0xFF4F4F4F);
const kBackgroundColor = Color(0xFF333333);
const kRedColor = Color(0xFFEB5757);
const kDefaultPadding = 20.0;

class DetailsPage extends StatefulWidget {
  final Word word;
  final List<Widget> listWordType;

  DetailsPage({required this.word, required this.listWordType});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFF7A9BEE),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text("Chi tiết"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
            color: Colors.white,
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0, bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Hero(
                        tag: widget.word.id.toString(),
                        child: Text(widget.word.word,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                              color: Colors.white,
                            ))),
                    SizedBox(height: 10.0,),
                    Row(
                      children: widget.listWordType,
                    ),
                    SizedBox(height: 10.0,),
                    Text(widget.word.pronounce, style: TextStyle(fontSize: 14.0, color: Colors.white),),
                    SizedBox(height: 10.0,),
                    Text(widget.word.mean, style: TextStyle(fontSize: 25.0, color: Colors.white),),
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
                  color: Colors.white),
              child: SingleChildScrollView(
                // padding: EdgeInsets.fromLTRB(
                //     kDefaultPadding, 0.0, kDefaultPadding, kDefaultPadding),
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Container(
                  alignment: Alignment.topCenter,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: DefaultTabController(
                    length: 4,
                    child: Scaffold(
                      backgroundColor: Colors.white,
                      appBar: AppBar(
                        backgroundColor: Colors.white,
                        // shape: ContinuousRectangleBorder(
                        //   borderRadius: const BorderRadius.all(Radius.circular(40.0))
                        // ),
                        shape: ContinuousRectangleBorder(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(40.0),
                                topLeft: Radius.circular(40.0))),
                        automaticallyImplyLeading: false,
                        flexibleSpace: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TabBar(
                              isScrollable: true,
                              labelColor: Colors.teal,
                              tabs: [
                                // Tab(icon: Icon(Icons.flight)),
                                // Tab(icon: Icon(Icons.directions_transit)),
                                // Tab(icon: Icon(Icons.directions_car)),
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
                          ListView(
                            children: <Widget>[
                              Container(
                                height: 350,
                                color: Colors.amber[600],
                                child: const Center(child: Text('Entry A')),
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
                          Icon(Icons.directions_transit, size: 350),
                          Icon(Icons.directions_car, size: 350),
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
