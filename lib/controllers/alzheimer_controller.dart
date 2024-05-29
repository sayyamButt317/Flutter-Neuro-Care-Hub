import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neuro_care_hub_app/Model/usermodel.dart';

class AlzheimerController extends GetxController {
  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final TextEditingController diseasecontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController citycontroller = TextEditingController();
  final TextEditingController statecontroller = TextEditingController();
  final TextEditingController gendercontroller = TextEditingController();
  RxList<UserModel> allUsers = RxList<UserModel>();

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
          'gender': gendercontroller.value,
        },
      );
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

  Future<void> getAlzuserinfo() async {
    FirebaseFirestore.instance
        .collection('patient_info')
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> snapshot) {
      if (snapshot.docs.isNotEmpty) {
        // Iterate through each document in the collection
        snapshot.docs.forEach((DocumentSnapshot<Map<String, dynamic>> doc) {
          // Check if the data is not null
          if (doc.data() != null) {
            // Convert each document to a UserModel object
            UserModel user = UserModel.fromJson(doc.data()!);
            // Add the user to a list or perform any other operation as needed
            allUsers.add(user);
          }
        });
      }
    });
  }
}
