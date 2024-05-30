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
  var isprofileloading = false.obs;
  void setIsProfileLoading(bool isLoading) {
    isprofileloading.value = isLoading;
  }

  RxString gender = "".obs;
  var myuser = UserModel().obs;

  RxString imageUrl = RxString('');
  RxString imagePath = ''.obs;

  File? selectedImage;

  Future<void> getImage(ImageSource camera) async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(
      maxWidth: 150,
      maxHeight: 200,
      source: ImageSource.gallery,
    );
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }

  Future<String> uploadImage(File? image) async {
    if (image == null) {
      return '';
    }

    String imageUrl = '';
    try {
      String fileName = Path.basename(image.path);
      var reference =
          FirebaseStorage.instance.ref().child('diseaseimage/$fileName');
      TaskSnapshot taskSnapshot = await reference.putFile(image);
      imageUrl = await taskSnapshot.ref.getDownloadURL();
      debugPrint("Download URL: $imageUrl");
    } catch (error) {
      debugPrint("Image Upload Error: $error");
    }
    return imageUrl;
  }

  Future<void> storeBrainUserInfo() async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;

      await FirebaseFirestore.instance
          .collection('Brainpatient_info')
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
    final collection =
        FirebaseFirestore.instance.collection('Brainpatient_info');

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
