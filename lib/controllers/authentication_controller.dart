import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  TextEditingController adminloginEmailController = TextEditingController();
  TextEditingController adminloginPasswordController = TextEditingController();

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  TextEditingController signupNameController = TextEditingController();
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();

  // navigate to sign up page
  navigateToSignUpPage() {
    return Get.toNamed("/signup");
  }

  // navigate to login page
  navigateToLoginPage() {
    return Get.toNamed("/login");
  }

  // navigate to home page
  navigateToHomePage() {
    Get.toNamed("/home");
    Get.delete<AuthenticationController>();
  }

  @override
  void dispose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();

    adminloginEmailController.dispose();
    adminloginPasswordController.dispose();

    signupNameController.dispose();
    signupEmailController.dispose();
    signupPasswordController.dispose();

    super.dispose();
  }
}
