import 'package:get/get.dart';
import 'package:neuro_care_hub_app/controllers/authentication_controller.dart';
import 'package:neuro_care_hub_app/controllers/home_controller.dart';
import 'package:neuro_care_hub_app/controllers/test_page_controller.dart';
import 'package:neuro_care_hub_app/controllers/login_controller.dart';
import 'package:neuro_care_hub_app/controllers/signup_controller.dart';

class ControllersBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthenticationController>(AuthenticationController());
    Get.put<HomeController>(HomeController(), permanent: true);
    Get.put<TestPageController>(TestPageController(), permanent: true);
    Get.put<LoginController>(LoginController(), permanent: true);
    Get.put<SignupController>(SignupController(), permanent: true);
  }
}
