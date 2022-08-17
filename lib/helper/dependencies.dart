import 'package:get/get.dart';
import 'package:thesis_app/controllers/popular_product_controller.dart';
import 'package:thesis_app/data/api/api_client.dart';
import 'package:thesis_app/data/repository/popular_product_repo.dart';
import 'package:thesis_app/utils/app_constants.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
