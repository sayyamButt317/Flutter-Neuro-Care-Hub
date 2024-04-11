import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final _email = TextEditingController();
  final _password = TextEditingController();

  var isprofileloading = false.obs;
  void setIsProfileLoading(bool isLoading) {
    isprofileloading.value = isLoading;
  }

  void signUp() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth
        .createUserWithEmailAndPassword(
            email: _email.text.toString(), password: _password.text.toString())
        .then((value) {
      isprofileloading(false);
    }).onError((error, stackTrace) {
      Get.snackbar(
        'Error',
        error.toString(),
        backgroundColor: Colors.transparent,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        colorText: Colors.red,
        borderWidth: 1,
        borderColor: Colors.red,
      );
      isprofileloading(false);
    });
  }
}
