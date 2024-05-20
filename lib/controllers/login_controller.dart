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
      Get.snackbar(
        "Success",
        "Successfully Login",
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
      Get.offAllNamed(AppRoutes.HOME);
    } on FirebaseAuthException catch (error) {
      String errorMessage = 'An error occurred while logging in';
      if (error.code == 'user-not-found') {
        errorMessage = 'User not found';
      } else if (error.code == 'wrong-password') {
        errorMessage = 'Invalid password';
      }

      debugPrint(error.toString());

      Get.snackbar(
        'Error',
        errorMessage,
        backgroundColor: Colors.transparent,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        colorText: Colors.red,
        borderWidth: 1,
        borderColor: Colors.red,
      );
    }
  }

  Future<void> adminlogin(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.snackbar(
        "Success",
        "Successfully Login",
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
      Get.offAllNamed(AppRoutes.ADMINHOME);
    } on FirebaseAuthException catch (error) {
      String errorMessage = 'An error occurred while logging in';
      if (error.code == 'user-not-found') {
        errorMessage = 'User not found';
      } else if (error.code == 'wrong-password') {
        errorMessage = 'Invalid password';
      }

      debugPrint(error.toString());

      Get.snackbar(
        'Error',
        errorMessage,
        backgroundColor: Colors.transparent,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        colorText: Colors.red,
        borderWidth: 1,
        borderColor: Colors.red,
      );
    }
  }
}
