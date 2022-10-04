import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thesis_app/base/show_custom_snackbar.dart';
import 'package:thesis_app/controllers/auth_controller.dart';
import 'package:thesis_app/models/signup_body_model.dart';
import 'package:thesis_app/widgets/app_text_field.dart';
import 'package:thesis_app/widgets/big_text.dart';
import '../../base/custom_loader.dart';
import '../../routes/route_helper.dart';
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
    var signUpImages = ["fb.png", "twt.png", "google.png"];

    void _regsitration(AuthController authController) {
      //var authController = Get.find<AuthController>();
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar("Type your name", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Type your phone number", title: "Phone Number");
      } else if (email.isEmpty) {
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
        //showCustomSnackBar("Welcome! You're In!", title: "Perfect");
        SignUpBody signUpBody = SignUpBody(
            name: name, phone: phone, email: email, password: password);
        //print(signUpBody.toString());
        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
            print("Success registration");
            Get.offNamed(RouteHelper.getInitial());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (_authController) {
          return !_authController.isLoading
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

                      GestureDetector(
                        onTap: () {
                          _regsitration(_authController);
                        },
                        child: Container(
                            width: Dimensions.screenWidth / 2,
                            height: Dimensions.screenHeight / 13,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius30),
                                color: AppColors.mainColor),
                            child: Center(
                              child: BigText(
                                  text: "Sign Up",
                                  size:
                                      Dimensions.font20 + Dimensions.font20 / 2,
                                  color: Colors.white),
                            )),
                      ),

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
                                      backgroundColor: Colors.white,
                                      backgroundImage: AssetImage(
                                          "assets/images/" +
                                              signUpImages[index]),
                                    ),
                                  )))
                    ],
                  ),
                )
              : CustomLoader();
        }));
  }
}
