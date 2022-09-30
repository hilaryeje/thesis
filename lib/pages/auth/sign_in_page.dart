import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thesis_app/base/custom_loader.dart';
import 'package:thesis_app/pages/auth/sign_up_page.dart';
import 'package:thesis_app/routes/route_helper.dart';
import 'package:thesis_app/widgets/app_text_field.dart';
import 'package:thesis_app/widgets/big_text.dart';

import '../../base/show_custom_snackbar.dart';
import '../../controllers/auth_controller.dart';
import '../../models/signup_body_model.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    void _login(AuthController authController) {
      //var authController = Get.find<AuthController>();

      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
        showCustomSnackBar("Type your Email Address", title: "Email Address");
      } else if (GetUtils.isEmail(email)) {
        showCustomSnackBar("Type your Valid Email Address",
            title: "Invalid Email Address");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type your password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password must be more than 6 letters",
            title: "Invalid Password");
      } else {
        authController.login(email, password).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getInitial());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(
          builder: (authController) {
            return !authController.isLoading
                ? SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: Dimensions.screenHeight * 0.05),
                        //app logo
                        Container(
                          height: Dimensions.screenHeight * 0.25,
                          child: Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 80,
                              backgroundImage:
                                  AssetImage("assets/images/logo1.PNG"),
                            ),
                          ),
                        ),
                        //welcome
                        Container(
                            margin: EdgeInsets.only(left: Dimensions.width20),
                            width: double.maxFinite,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Hello",
                                    style: TextStyle(
                                        fontSize: Dimensions.font20 * 3 +
                                            Dimensions.font20 / 2,
                                        fontWeight: FontWeight.bold)),
                                Text("Sign into you account",
                                    style: TextStyle(
                                        fontSize: Dimensions.font20,
                                        color: Colors.grey[500]))
                              ],
                            )),
                        SizedBox(height: Dimensions.height20),
                        //email
                        AppTextField(
                            textController: emailController,
                            hintText: "Email",
                            icon: Icons.email),
                        SizedBox(height: Dimensions.height20),
                        //password
                        AppTextField(
                          textController: passwordController,
                          hintText: "Password",
                          icon: Icons.password_sharp,
                          isObscure: true,
                        ),

                        SizedBox(height: Dimensions.height10),
                        Row(
                          children: [
                            Expanded(
                              child: Container(),
                            ),
                            RichText(
                                text: TextSpan(
                                    text: "Sign into your account",
                                    style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: Dimensions.font20))),
                            SizedBox(width: Dimensions.width20),
                          ],
                        ),
                        SizedBox(height: Dimensions.screenHeight * 0.05),
                        //button
                        GestureDetector(
                          onTap: () {
                            _login(authController);
                          },
                          child: Container(
                              width: Dimensions.screenWidth / 2,
                              height: Dimensions.screenHeight / 13,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius30),
                                  color: AppColors.mainColor),
                              child: Center(
                                child: BigText(
                                    text: "Sign In",
                                    size: Dimensions.font20 +
                                        Dimensions.font20 / 2,
                                    color: Colors.white),
                              )),
                        ),
                        SizedBox(height: Dimensions.screenHeight * 0.05),
                        RichText(
                            text: TextSpan(
                                text: "Don\'t have an account yet? ",
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: Dimensions.font20),
                                children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.to(() => SignUpPage(),
                                      transition: Transition.leftToRight),
                                text: "Create",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.mainBlackColor,
                                    fontSize: Dimensions.font20),
                              )
                            ])),
                      ],
                    ),
                  )
                : CustomLoader();
          },
        ));
  }
}
