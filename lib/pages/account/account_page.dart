import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thesis_app/controllers/auth_controller.dart';
import 'package:thesis_app/controllers/cart_controller.dart';
import 'package:thesis_app/widgets/account_widget.dart';
import 'package:thesis_app/widgets/app_icon.dart';
import 'package:thesis_app/widgets/big_text.dart';

import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: BigText(text: "Profile", size: 24, color: Colors.white),
        ),
        body: Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(top: Dimensions.height20),
            child: Column(
              children: [
                //profile icon
                AppIcon(
                    icon: Icons.person,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    iconSize: Dimensions.height45 + Dimensions.height30,
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
                              text: "User",
                            )),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        //phone
                        AccountWidget(
                            appIcon: AppIcon(
                              icon: Icons.phone,
                              backgroundColor: AppColors.yellowColor,
                              iconColor: Colors.white,
                              iconSize: Dimensions.height10 * 5 / 2,
                              size: Dimensions.height10 * 5,
                            ),
                            bigText: BigText(
                              text: "Phone Number",
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
                              text: "E-Mail",
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
                            if (Get.find<AuthController>().userLoggedIn()) {
                              Get.find<AuthController>().clearSharedData();
                              Get.find<CartController>().clear();
                              Get.find<CartController>().clearCartHistory();
                              Get.offNamed(RouteHelper.getSignInPage());
                            }
                          },
                          child: AccountWidget(
                              appIcon: AppIcon(
                                icon: Icons.logout,
                                backgroundColor: AppColors.mainColor,
                                iconColor: Colors.white,
                                iconSize: Dimensions.height10 * 5 / 2,
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
            )));
  }
}
