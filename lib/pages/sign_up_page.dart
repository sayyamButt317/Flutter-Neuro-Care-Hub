import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neuro_care_hub_app/controllers/authentication_controller.dart';
import 'package:neuro_care_hub_app/controllers/signup_controller.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';
import 'package:neuro_care_hub_app/utils/styles/text_styles.dart';

import '../utils/widgets/authentication pages/switch_authentication_page_row.dart';
import '../utils/widgets/reusable widgets/text_form_field.dart';

class SignUpPage extends GetView<AuthenticationController> {
  SignUpPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final SignupController getxcontroller =
      Get.put<SignupController>(SignupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            // scale: double.maxFinite,
            image: AssetImage(
              "assets/images/background-1.jpg",
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.0.wp, vertical: 4.0.hp),
          child: Column(
            children: [
              SizedBox(
                height: 15.0.hp,
              ),

              // login text
              Text(
                "Sign Up",
                style: TextStyles.boldDarkLargeTextStyle().copyWith(
                  fontSize: 30.0.sp,
                  color: const Color(0xffE2F0FA),
                ),
              ),

              SizedBox(
                height: 10.0.hp,
              ),

              // text field name
              ReusableTextFormField(
                controller: controller.signupNameController,
                hintText: 'Name',
                icon: Icons.person_outline,
                keyboardType: TextInputType.text,
                obscureText: false,
                onvalidation: (value) =>
                    value!.isEmpty ? "Enter your name" : null,
              ),

              SizedBox(
                height: 2.0.hp,
              ),

              // text field email
              ReusableTextFormField(
                controller: controller.signupEmailController,
                hintText: 'Email',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                onvalidation: (value) =>
                    value!.isEmpty ? "Enter your Email" : null,
              ),

              SizedBox(
                height: 2.0.hp,
              ),

              // text field password
              ReusableTextFormField(
                controller: controller.signupPasswordController,
                hintText: 'Password',
                icon: Icons.password_outlined,
                keyboardType: TextInputType.text,
                obscureText: true,
                onvalidation: (value) =>
                    value!.isEmpty ? "Enter your Password" : null,
              ),

              SizedBox(
                height: 5.0.hp,
              ),

              MaterialButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    getxcontroller.signUp();
                  }
                },
                height: 50,
                minWidth: 300,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 50,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.black,
                child: Obx(() {
                  return getxcontroller.isprofileloading.value
                      ? const CircularProgressIndicator(
                          strokeWidth: 3,
                          color: Colors.white,
                        )
                      : const Text(
                          "Sign-up",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        );
                }),
              ),

              SizedBox(
                height: 5.0.hp,
              ),

              SwitchAuthenticationPageRow(
                firstText: "Already Have An Account?",
                secondText: "Login",
                onTap: () => controller.navigateToLoginPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
