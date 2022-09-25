import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thesis_app/widgets/app_text_field.dart';
import 'package:thesis_app/widgets/big_text.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = ["logo.PNG"];
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
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
                    backgroundImage: AssetImage("assets/images/logo1.PNG"),
                  ),
                ),
              ),
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
                  icon: Icons.password_sharp),
              SizedBox(height: Dimensions.height20),
              //name
              AppTextField(
                  textController: nameController,
                  hintText: "Name",
                  icon: Icons.person),
              SizedBox(height: Dimensions.height20),
              //phone
              AppTextField(
                  textController: phoneController,
                  hintText: "Phone",
                  icon: Icons.phone),
              SizedBox(height: Dimensions.height20),

              Container(
                  width: Dimensions.screenWidth / 2,
                  height: Dimensions.screenHeight / 13,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      color: AppColors.mainColor),
                  child: Center(
                    child: BigText(
                        text: "Sign Up",
                        size: Dimensions.font20 + Dimensions.font20 / 2,
                        color: Colors.white),
                  )),

              SizedBox(height: Dimensions.height10),
              RichText(
                  text: TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.back(),
                      text: "Have an account already?",
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimensions.font20))),
              SizedBox(height: Dimensions.screenHeight * 0.05),
              RichText(
                  text: TextSpan(
                      text: "Sign Up using one of the following",
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimensions.font16))),
              Wrap(
                  children: List.generate(
                      3,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: Dimensions.radius30,
                              backgroundImage: AssetImage(
                                  "assets/images/" + signUpImages[index]),
                            ),
                          )))
            ],
          ),
        ));
  }
}
