import 'package:get/get.dart';

import '../data/repository/user_repo.dart';
import '../models/response_model.dart';
import '../models/signup_body_model.dart';
import '../models/user_model.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;
  UserController({required this.userRepo});

  bool _isLoading = false;
  late UserModel _userModel;

  bool get isLoading => _isLoading;
  UserModel get userModel => _userModel;

  Future<ResponseModel> getUserInfo() async {
    /*_isLoading = true;
    update();*/
    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    print("test" + response.body.toString());
    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body);
      _isLoading = true;
      responseModel = ResponseModel(true, "Successfully!");
    } else {
      print("Did not get");
      responseModel = ResponseModel(false, response.statusText!);
    }
    //_isLoading = false;
    update();
    return responseModel;
  }
}
