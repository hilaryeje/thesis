import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:thesis_app/pages/food/popular_list.dart';
import 'package:thesis_app/pages/home/main_page.dart';
import 'package:thesis_app/pages/splash/splash_page.dart';

import '../pages/cart/cart_page.dart';
import '../pages/food/recommended_detail.dart';
import '../pages/home/home_page.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularList = "/popular-list";
  static const String recommendedDetails = "/recommended-details";
  static const String cartPage = "/cart-page";

  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getPopularList(int pageId, String page) =>
      '$popularList?pageId=$pageId&page=$page';
  static String getRecommendedDetails(int pageId, String page) =>
      '$recommendedDetails?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
        name: popularList,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return PopularList(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedDetails,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters["page"];
          return RecommendedDetails(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.fadeIn)
  ];
}
