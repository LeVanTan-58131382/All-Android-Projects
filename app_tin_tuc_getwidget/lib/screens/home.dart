import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:getwidget/getwidget.dart';
import 'animations/animation.dart';
import 'border/border.dart';
import 'bottomsheet/bottomsheet.dart';
import 'intro-screen/introscreen.dart';
import 'radiolisttile/radiolisttile.dart';
import 'sticky_header/sticky_types.dart';
import 'accordian/accordian.dart';
import 'alert/alert.dart';
import 'appbar/app_home.dart';
import 'avatar/avatars.dart';
import 'badges/badges.dart';
import 'button/button_types.dart';
import 'cards/cards.dart';
import 'carousel/carousel.dart';
import 'drawer/drawer.dart';
import 'floating_widget/floating_widget.dart';
import 'images/images.dart';
import 'loader/loaders.dart';
import 'progress_bar/progress_bar.dart';
import 'rating/rating.dart';
import 'searchbar/seachbar.dart';
import 'shimmer/shimmer.dart';
import 'tabs/tab_types.dart';
import 'tiles/tiles_page.dart';
import 'toast/toasts.dart';
import 'toggle/toggles.dart';
import 'typography/typography.dart';
import 'checkbox/checkboxs.dart';
import 'checkboxlisttile/checkbox_list_tile_page.dart';
import 'radiobutton/radio_buttons.dart';
import 'dropdowns/dropdown-types.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List gfComponents = [
    {
      'icon': const IconData(
        0xe904,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Button',
      'route': ButtonTypes()
    },
    {
      'icon': const IconData(
        0xe902,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Badge',
      'route': BadgesPage()
    },
    {
      'icon': const IconData(
        0xe905,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Cards',
      'route': CardPage()
    },
    {
      'icon': const IconData(
        0xe906,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Carousel',
      'route': Carousel()
    },
    {
      'icon': const IconData(
        0xe903,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Avatar',
      'route': Avatar()
    },
    {
      'icon': const IconData(
        0xe90d,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Images',
      'route': Images()
    },
    {
      'icon': const IconData(
        0xe90e,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Tiles',
      'route': TilesPage()
    },
    {
      'icon': const IconData(
        0xe91d,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Tabs',
      'route': TabTypes()
    },
    {
      'icon': const IconData(
        0xe910,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Toggle',
      'route': Toggles()
    },
    {
      'icon': const IconData(
        0xe920,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Toast',
      'route': Toasts()
    },
    {
      'icon': const IconData(
        0xe901,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Alert',
      'route': AlertPage()
    },
    {
      'icon': const IconData(
        0xe900,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Accordion',
      'route': Accordion()
    },
    {
      'icon': const IconData(
        0xe919,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Search Bar',
      'route': SearchbarPage()
    },
    {
      'icon': const IconData(
        0xe91e,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Appbar',
      'route': AppHome()
    },
    {
      'icon': const IconData(
        0xe901,
        fontFamily: 'GFFontIcons2',
      ),
      'title': 'Rating',
      'route': RatingPage()
    },
    {
      'icon': const IconData(
        0xe901,
        fontFamily: 'GFIcons',
      ),
      'title': 'Loaders',
      'route': Loaders()
    },
    {
      'icon': const IconData(
        0xe923,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Typography',
      'route': TypographyPage()
    },
    {
      'icon': const IconData(
        0xe900,
        fontFamily: 'GFFontIcons2',
      ),
      'title': 'Floating Widget',
      'route': FloatingWidgetHome()
    },
    {
      'icon': const IconData(
        0xe900,
        fontFamily: 'GFIcons',
      ),
      'title': 'Progress Bar',
      'route': ProgressBar()
    },
    {
      'icon': const IconData(
        0xe900,
        fontFamily: 'GFFontIcons2',
      ),
      'title': 'Shimmer',
      'route': ShimmerPage()
    },
    {
      'icon': const IconData(
        0xe906,
        fontFamily: 'GFIconsnew',
      ),
      'title': 'CheckBox',
      'route': CheckBoxPage()
    },
    {
      'icon': const IconData(
        0xe905,
        fontFamily: 'GFIconsnew',
      ),
      'title': 'CheckboxListTile',
      'route': CheckBoxListTilePage()
    },
    {
      'icon': const IconData(
        0xe908,
        fontFamily: 'GFIconsnew',
      ),
      'title': 'RadioButton',
      'route': RadioButtonPage()
    },
    {
      'icon': const IconData(
        0xe909,
        fontFamily: 'GFIconsnew',
      ),
      'title': 'RadioListTile',
      'route': RadioListTilePage()
    },
    {
      'icon': const IconData(
        0xe900,
        fontFamily: 'GFIconsnew',
      ),
      'title': 'Border',
      'route': BorderPage()
    },
    {
      'icon': const IconData(
        0xe901,
        fontFamily: 'GFIconsnew',
      ),
      'title': 'BottomSheet',
      'route': BottomSheetPage()
    },
    {
      'icon': const IconData(
        0xe907,
        fontFamily: 'GFIconsnew',
      ),
      'title': 'Animation',
      'route': AnimationPage()
    },
    {
      'icon': const IconData(
        0xe901,
        fontFamily: 'GFIconsneww',
      ),
      'title': 'IntroScreen',
      'route': Introscreen()
    },
    {
      'icon': const IconData(
        0xe907,
        fontFamily: 'GFIconsneww',
      ),
      'title': 'StickyHeader',
      'route': StickyTypes()
    },
    {
      'icon': const IconData(
        0xe900,
        fontFamily: 'GFIconsneww',
      ),
      'title': 'DropDown',
      'route': DropDown()
    },
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: DrawerPage(),
        appBar: AppBar(
          backgroundColor: GFColors.DARK,
          title: Image.asset(
            'lib/assets/icons/gflogo.png',
            width: 150,
          ),
          centerTitle: true,
        ),
        body: ListView(
          physics: const ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(
                  left: 15, bottom: 20, top: 20, right: 15),
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: gfComponents.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemBuilder: (BuildContext context, int index) =>
                      GestureDetector(
                          onTap: () {},
                          child: buildSquareTile(
                              gfComponents[index]['title'],
                              gfComponents[index]['icon'],
                              gfComponents[index]['route']))),
            ),
            // Container(
            //   height: 160,
            //   margin: const EdgeInsets.only(left: 15, bottom: 20, right: 15),
            //   child: buildSquareTile(
            //       'RadioButton',
            //       const IconData(
            //         0xe900,
            //         fontFamily: 'GFIcons',
            //       ),
            //       RadioButtonPage()),
            // )
          ],
        ),
      );

  Widget buildSquareTile(String title, IconData icon, Widget route) => InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => route),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF333333),
            borderRadius: const BorderRadius.all(Radius.circular(7)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.61),
                  blurRadius: 6,
                  spreadRadius: 0),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                icon,
                color: GFColors.SUCCESS,
                size: 30,
              ),
//            Icon((icon),),
              Text(
                title,
                style: const TextStyle(color: GFColors.WHITE, fontSize: 20),
              )
            ],
          ),
        ),
      );
}
