import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thesis_app/pages/cart/cart_page.dart';
import 'package:thesis_app/pages/food/popular_list.dart';
import 'package:thesis_app/pages/food/recommended_detail.dart';
import 'package:thesis_app/pages/home/main_page.dart';
import 'package:thesis_app/routes/route_helper.dart';
import 'controllers/popular_product_controller.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;
import 'pages/home/page_body.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MainPage(),
      //initialRoute: RouteHelper.initial,
      //getPages: RouteHelper.routes
    );
  }
}
