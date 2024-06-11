import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neuro_care_hub_app/Model/usermodel.dart';

import '../pages/User/image_upload.dart'; 

class TumorController extends GetxController {
  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final TextEditingController diseasecontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController citycontroller = TextEditingController();
  final TextEditingController statecontroller = TextEditingController();
  RxList<UserModel> allUsers = RxList<UserModel>();
  var isProfileLoading = false.obs;

  void setIsProfileLoading(bool isLoading) {
    isProfileLoading.value = isLoading;
  }

  RxString gender = "".obs;
  var myuser = UserModel().obs;

  RxString imageUrl = RxString('');
  RxString imagePath = ''.obs;
  File? selectedImage;




  Future<void> getImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(
      maxWidth: 150,
      maxHeight: 200,
      source: source,
    );
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }

  Future<String> uploadImage(File? image) async {
    if (image == null) return '';

    try {
      String fileName = Path.basename(image.path);
      var reference =
          FirebaseStorage.instance.ref().child('diseaseimage/$fileName');
      TaskSnapshot taskSnapshot = await reference.putFile(image);
      return await taskSnapshot.ref.getDownloadURL();
    } catch (error) {
      debugPrint("Image Upload Error: $error");
      return '';
    }
  }

  Future<void> storeBrainUserInfo() async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;

      await FirebaseFirestore.instance
          .collection('Brainpatient_info')
          .doc(uid)
          .set({
        'firstname': firstnamecontroller.text,
        'lastname': lastnamecontroller.text,
        'address': addresscontroller.text,
        'city': citycontroller.text,
        'disease': diseasecontroller.text,
        'state': statecontroller.text,
        'gender': gender.value,
      });
      Get.to(() => ImageUploadPage());
    } catch (error) {
      Get.snackbar(
        'Error',
        "There was an error storing your record.",
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
    final collection = FirebaseFirestore.instance.collection('Brainpatient_info');

    try {
      final querySnapshot = await collection.get();
      allUsers.clear();

      for (var doc in querySnapshot.docs) {
        final user = UserModel.fromJson(doc.data());
        allUsers.add(user);
      }
    } catch (error) {
      print("Error getting user info: $error");
    }
  }
}

