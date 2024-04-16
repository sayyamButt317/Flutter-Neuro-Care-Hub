import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';

class SignupController extends GetxController {
  var loading = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signup(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Show success snackbar for 2 seconds
      Get.snackbar(
        "Success",
        "Account Created Successfully",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        snackStyle: SnackStyle.FLOATING,
        backgroundColor: Colors.green,
        colorText: Colors.lightGreen,
        titleText: const Text(
          "Success",
          style: TextStyle(color: Colors.lightGreen), // Custom title color
        ),
      );
      // Delay navigation to login screen by 2 seconds
      await Future.delayed(const Duration(seconds: 3));
      // Navigate to login screen
      Get.offAllNamed(AppRoutes.LOGIN);
    } catch (error) {
      // Show error snackbar
      Get.snackbar(
        "Error",
        "Failed to Create Account: $error",
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
        colorText:Colors.red,
        titleText: const Text(
          "Error",
          style: TextStyle(color: Colors.red), // Custom title color
        ),

      );
    }
  }
}
