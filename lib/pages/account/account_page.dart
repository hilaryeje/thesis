import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thesis_app/controllers/auth_controller.dart';
import 'package:thesis_app/controllers/cart_controller.dart';
import 'package:thesis_app/controllers/user_controller.dart';
import 'package:thesis_app/widgets/account_widget.dart';
import 'package:thesis_app/widgets/app_icon.dart';
import 'package:thesis_app/widgets/big_text.dart';

import '../../base/custom_loader.dart';
import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
      print("Successfully logged in");
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: BigText(text: "Profile", size: 24, color: Colors.white),
        ),
        body: GetBuilder<UserController>(
          builder: (userController) {
            return _userLoggedIn
                ? (userController.isLoading
                    ? Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(top: Dimensions.height20),
                        child: Column(
                          children: [
                            //profile icon
                            AppIcon(
                                icon: Icons.person,
                                backgroundColor: AppColors.mainColor,
                                iconColor: Colors.white,
                                iconSize:
                                    Dimensions.height45 + Dimensions.height30,
                                size: Dimensions.height15 * 10),
                            SizedBox(height: Dimensions.height30),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    //name
                                    AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.person,
                                          backgroundColor: AppColors.mainColor,
                                          iconColor: Colors.white,
                                          iconSize: Dimensions.height10 * 5 / 2,
                                          size: Dimensions.height10 * 5,
                                        ),
                                        bigText: BigText(
                                          text: userController.userModel.name,
                                        )),
                                    SizedBox(
                                      height: Dimensions.height20,
                                    ),
                                    //phone
                                    AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.phone,
                                          backgroundColor:
                                              AppColors.yellowColor,
                                          iconColor: Colors.white,
                                          iconSize: Dimensions.height10 * 5 / 2,
                                          size: Dimensions.height10 * 5,
                                        ),
                                        bigText: BigText(
                                          text: userController.userModel.phone,
                                        )),
                                    SizedBox(
                                      height: Dimensions.height20,
                                    ),
                                    //email
                                    AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.email,
                                          backgroundColor: AppColors.mainColor,
                                          iconColor: Colors.white,
                                          iconSize: Dimensions.height10 * 5 / 2,
                                          size: Dimensions.height10 * 5,
                                        ),
                                        bigText: BigText(
                                          text: userController.userModel.email,
                                        )),
                                    SizedBox(
                                      height: Dimensions.height20,
                                    ),
                                    //address
                                    AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.location_on,
                                          backgroundColor: AppColors.mainColor,
                                          iconColor: Colors.white,
                                          iconSize: Dimensions.height10 * 5 / 2,
                                          size: Dimensions.height10 * 5,
                                        ),
                                        bigText: BigText(
                                          text: "Location",
                                        )),
                                    SizedBox(
                                      height: Dimensions.height20,
                                    ),
                                    //message
                                    AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.chat,
                                          backgroundColor: AppColors.mainColor,
                                          iconColor: Colors.white,
                                          iconSize: Dimensions.height10 * 5 / 2,
                                          size: Dimensions.height10 * 5,
                                        ),
                                        bigText: BigText(
                                          text: "Messages",
                                        )),
                                    SizedBox(
                                      height: Dimensions.height20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (Get.find<AuthController>()
                                            .userLoggedIn()) {
                                          Get.find<AuthController>()
                                              .clearSharedData();
                                          Get.find<CartController>().clear();
                                          Get.find<CartController>()
                                              .clearCartHistory();
                                          Get.offNamed(
                                              RouteHelper.getSignInPage());
                                        } else {
                                          print("you logged out");
                                        }
                                      },
                                      child: AccountWidget(
                                          appIcon: AppIcon(
                                            icon: Icons.logout,
                                            backgroundColor:
                                                AppColors.mainColor,
                                            iconColor: Colors.white,
                                            iconSize:
                                                Dimensions.height10 * 5 / 2,
                                            size: Dimensions.height10 * 5,
                                          ),
                                          bigText: BigText(
                                            text: "Log Out",
                                          )),
                                    ),
                                    SizedBox(
                                      height: Dimensions.height20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ))
                    : CustomLoader())
                : Container(
                    child: Center(
                        child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.maxFinite,
                        height: Dimensions.height20 * 5,
                        margin: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/signin.png"))),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getSignInPage());
                        },
                        child: Container(
                            width: double.maxFinite,
                            height: Dimensions.height20 * 5,
                            margin: EdgeInsets.only(
                                left: Dimensions.width20,
                                right: Dimensions.width20),
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                            ),
                            child: Center(
                                child: BigText(
                              text: "Sign in",
                              color: Colors.white,
                              size: Dimensions.font26,
                            ))),
                      ),
                    ],
                  )));
          },
        ));
  }
}
