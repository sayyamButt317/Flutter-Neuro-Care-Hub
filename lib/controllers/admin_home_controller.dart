import 'package:get/get.dart';

class AdminHomeController extends GetxController {
  // navigate to help page
  navigateToBTDPage() {
    return Get.toNamed("/btd");
  }

  // navigate to help page
  navigateToADPage() {
    return Get.toNamed("/ad");
  }
}
