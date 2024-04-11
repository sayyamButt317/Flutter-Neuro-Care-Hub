import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/home_page.dart';

class LoginController extends GetxController {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool hasEnteredProfiledata = false;

  var isprofileloading = false.obs;
  void setIsProfileLoading(bool isLoading) {
    isprofileloading.value = isLoading;
  }

  Future<void> login() async {
    try {
      final String email = _email.text.trim();
      final String password = _password.text.trim();
      await auth.signInWithEmailAndPassword(email: email, password: password);

      final User? user = auth.currentUser;
      if (user != null) {
        Get.offAll(() => const HomePage());
      }
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
      isprofileloading(false);
    }
  }
}
