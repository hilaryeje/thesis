import 'package:get/get.dart';
import 'package:thesis_app/data/api/api_client.dart';

import '../../utils/app_constants.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.PRODUCT_URI);
  }
}
