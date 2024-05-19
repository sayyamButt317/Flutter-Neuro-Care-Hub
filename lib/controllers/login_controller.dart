import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/routes.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var isProfileLoading = false.obs;

  void setIsProfileLoading(bool isLoading) {
    isProfileLoading.value = isLoading;
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAllNamed(AppRoutes.HOME);
    } catch (error) {
      // Show error snackbar
      Get.snackbar(
        "Error",
        "Failed to Login: $error",
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
        borderColor: Colors.red,
        colorText: Colors.red,
        titleText: const Text(
          "Error",
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }

  Future<void> adminlogin(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAllNamed(AppRoutes.ADMINHOME);
    } catch (error) {
      // Show error snackbar
      Get.snackbar(
        "Error",
        "Failed to Login: $error",
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
        borderColor: Colors.red,
        colorText: Colors.red,
        titleText: const Text(
          "Error",
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }
}
