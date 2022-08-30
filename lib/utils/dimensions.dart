import 'package:get/get.dart';

class Dimensions {
  //current height of iphone 13 is 844.0
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //844 divided by 320
  static double pageView = screenHeight / 2.64;
  //844 divided by 220
  static double pageViewContainer = screenHeight / 3.84;
  //844 divided by 120
  static double pageViewTextContainer = screenHeight / 7.03;

  //dynamic height padding and margin
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.76;

  //dynmaic width padding and margin
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;

  //font size
  static double font16 = screenHeight / 52.75;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;

  //radius
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  //icon size
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize16 = screenHeight / 52.75;

  //list view size
  static double listViewImgSize = screenWidth / 3.75;
  static double listViewTextContSize = screenWidth / 4.5;

  //popular list
  static double popularListSize = screenHeight / 2.41;

  //bottom height
  static double bottomHeightBar = screenHeight / 7.03;

  //splash screen dimensions
  static double splashImg = screenHeight / 3.38;
}
