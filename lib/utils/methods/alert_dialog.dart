import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';

class AlertDialogs {
  static messageAlertDialog(IconData icon, String message,) {
    Get.dialog(
      AlertDialog(
        backgroundColor: const Color(0xffb0a1d2),
        contentPadding: EdgeInsets.all(3.0.wp),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 1.5.wp,
                ),
                Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  static resultAlertDialog(IconData icon, String message) {
    Get.dialog(
      AlertDialog(
        backgroundColor: const Color(0xffb0a1d2),
        contentPadding: EdgeInsets.all(3.0.wp),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 1.5.wp,
                ),
                Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
