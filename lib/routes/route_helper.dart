import 'package:get/route_manager.dart';
import 'package:thesis_app/pages/food/popular_list.dart';
import 'package:thesis_app/pages/home/main_page.dart';

import '../pages/food/recommended_detail.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularList = "/popular-list";
  static const String recommendedDetails = "/recommended-details";

  static String getInitial() => '$initial';
  static String getPopularList(int pageId) => '$popularList?pageId=$pageId';
  static String getRecommendedDetails(int pageId) =>
      '$recommendedDetails?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainPage()),
    GetPage(
        name: popularList,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularList(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedDetails,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecommendedDetails(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
  ];
}
