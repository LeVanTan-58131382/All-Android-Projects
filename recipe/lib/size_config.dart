import 'package:flutter/widgets.dart';

class SizeConfig {

  // Đặt mặc định các thông số như vậy, sau khi init thì các thông số sẽ được cập nhật theo thiết bị
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
    // Trên iPhone 11, gần như defaultSize = 10
    // Vì vậy, nếu kích thước màn hình tăng hoặc giảm thì defaultSize của chúng tôi cũng thay đổi
    defaultSize = orientation == Orientation.landscape
        ? screenHeight * 0.024
        : screenWidth * 0.024;
  }
}
