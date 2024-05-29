import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neuro_care_hub_app/Model/usermodel.dart';

import '../pages/image_upload.dart';


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
    // Get the current user's ID
    final uid = FirebaseAuth.instance.currentUser!.uid;

    // Try-catch for error handling
    try {
      // Fetch the document from Firestore
      final docSnapshot = await FirebaseFirestore.instance
          .collection('Brainpatient_info')
          .doc(uid)
          .get();

      // Check if document exists
      if (docSnapshot.exists) {
        final Map<String, dynamic> userData =
            docSnapshot.data() as Map<String, dynamic>;
        final user = UserModel.fromJson(userData);

        // Update UI elements
        myuser.value = user;
        imageUrl.value = user.image ?? '';
        firstnamecontroller.text = user.name ?? '';
        lastnamecontroller.text = user.lastname ?? '';
        diseasecontroller.text = user.disease ?? '';
        addresscontroller.text = user.address ?? '';
        citycontroller.text = user.city ?? '';
        statecontroller.text = user.state ?? '';
        gender.value = user.gender ?? '';
      } else {
        // Handle case where document doesn't exist
        print("Document does not exist for uid: $uid");
      }
    } catch (error) {
      // Handle potential errors during Firestore operation
      print("Error getting user info: $error");
    }
  }
}
