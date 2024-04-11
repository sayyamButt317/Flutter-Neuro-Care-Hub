import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // navigate to about page
  navigateToAboutPage() {
    return Get.toNamed("/about");
  }

  // navigate to help page
  navigateToHelpPage() {
    return Get.toNamed("/help");
  }

  // navigate to help page
  navigateToBTDPage() {
    return Get.toNamed("/btd");
  }

  // navigate to help page
  navigateToADPage() {
    return Get.toNamed("/ad");
  }

  TextEditingController helpEmailController = TextEditingController();
  TextEditingController helpTitleController = TextEditingController();
  TextEditingController helpQueryController = TextEditingController();

  @override
  void dispose() {
    helpEmailController.dispose();
    helpTitleController.dispose();
    helpQueryController.dispose();

    super.dispose();
  }
}