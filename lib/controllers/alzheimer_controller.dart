import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neuro_care_hub_app/Model/usermodel.dart';

import '../pages/User/image_upload.dart';

class AlzheimerController extends GetxController {
  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final TextEditingController diseasecontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController citycontroller = TextEditingController();
  final TextEditingController statecontroller = TextEditingController();

  RxList<UserModel> allUsers = RxList<UserModel>();
  RxString gender = "".obs;
  Future<void> storeAlzUserInfo() async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;

      await FirebaseFirestore.instance
          .collection('Alzpatient_info')
          .doc(uid)
          .set(
        {
          'firstname': firstnamecontroller.text,
          'lastname': lastnamecontroller.text,
          'address': addresscontroller.text,
          'city': citycontroller.text,
          'disease': diseasecontroller.text,
          'state': statecontroller.text,
          'gender': gender.value,
        },
      );
      Get.to(() => ImageUploadPage());
    } catch (error) {
      Get.snackbar(
        'Error',
        "There was an error Getting your Record.",
        backgroundColor: Colors.transparent,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        colorText: Colors.red,
        borderWidth: 1,
        borderColor: Colors.red,
      );
    }
  }

  Future<void> getBrainUserInfo() async {
    // Get a reference to the collection
    final collection = FirebaseFirestore.instance.collection('Alzpatient_info');

    try {
      // Get all documents in the collection
      final querySnapshot = await collection.get();

      // Clear existing data in allUsers
      allUsers.clear();

      // Add each user data to allUsers
      for (var doc in querySnapshot.docs) {
        final user = UserModel.fromJson(doc.data());
        allUsers.add(user);
      }
    } catch (error) {
      print("Error getting user info: $error");
    }
  }
}
