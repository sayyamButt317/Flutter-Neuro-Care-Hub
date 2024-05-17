import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neuro_care_hub_app/Model/usermodel.dart';

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

  Future<void> storeUserInfo() async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;

      await FirebaseFirestore.instance.collection('patient_info').doc(uid).set(
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


  // Future<void> getuserinfo() async {
  //   final uid = FirebaseAuth.instance.currentUser!.uid;
  //   FirebaseFirestore.instance
  //       .collection('patient_info')
  //       .doc(uid)
  //       .snapshots()
  //       .listen((event) {
  //     // Explicitly cast the result to Map<String, dynamic>
  //     final Map<String, dynamic> userData = event.data() as Map<String, dynamic>;
  //     myuser.value = UserModel.fromJson(userData);
  //     imageUrl.value = myuser.value.image ?? '';
  //     firstnamecontroller.text = myuser.value.name ?? '';
  //     lastnamecontroller.text = myuser.value.lastname ?? '';
  //     diseasecontroller.text = myuser.value.disease ?? '';
  //     addresscontroller.text = myuser.value.address ?? '';
  //     citycontroller.text = myuser.value.city ?? '';
  //     statecontroller.text = myuser.value.state ?? '';
  //     gender.value = myuser.value.gender ?? '';
  //   });
  // }
  Future<void> getuserinfo() async {
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
