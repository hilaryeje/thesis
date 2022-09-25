import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thesis_app/controllers/cart_controller.dart';
import 'package:thesis_app/pages/auth/sign_in_page.dart';
import 'package:thesis_app/pages/auth/sign_up_page.dart';
import 'package:thesis_app/pages/cart/cart_page.dart';
import 'package:thesis_app/pages/food/popular_list.dart';
import 'package:thesis_app/pages/food/recommended_detail.dart';
import 'package:thesis_app/pages/home/main_page.dart';
import 'package:thesis_app/pages/splash/splash_page.dart';
import 'package:thesis_app/routes/route_helper.dart';
import 'controllers/popular_product_controller.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;
import 'pages/home/page_body.dart';
import 'package:http/http.dart' as http;

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
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: SignInPage(),
          //home: SplashScreen(),
          //initialRoute: RouteHelper.getSplashPage(),
          //getPages: RouteHelper.routes
        );
      });
    });
  }
}
