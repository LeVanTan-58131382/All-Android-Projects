import 'package:flutter/widgets.dart';

class SizeConfig {

  // Dat mac dinh cac thong so nhu vay, sau khi init thi cac thong so se duoc cap nhat lai theo thiet bi
  static MediaQueryData _mediaQueryData = new MediaQueryData();
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double defaultSize = 0.0;
  static Orientation orientation = Orientation.portrait;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
    // Tren Iphone 11 gan nhu defaultSize = 10
    // Vi vay, neu kich thuoc man hinh tang hoac giam thi defaultSize cua chung ta cung se thay doi
    defaultSize = orientation == Orientation.landscape
        ? screenHeight * 0.024
        : screenWidth * 0.024;
  }
}
