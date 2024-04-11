import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neuro_care_hub_app/controllers/brain_tumor_controller.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';
import 'package:neuro_care_hub_app/utils/methods/alert_dialog.dart';
import 'package:neuro_care_hub_app/utils/widgets/reusable%20widgets/reusable_button.dart';
import 'package:neuro_care_hub_app/utils/widgets/reusable%20widgets/text_form_field.dart';

class BrainTumorDetectionPage extends GetView<BrainTumorDetectionPage> {
  BrainTumorDetectionPage({super.key});

  final _formKey = GlobalKey<FormState>();

  final TumorController getxcontroller =
      Get.put<TumorController>(TumorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffc2aed3),
      body: Column(
        children: [
          SizedBox(
            height: 10.0.hp,
          ),

          // image
          SizedBox(
            height: Get.height * 0.2,
            child: Obx(() {
              return Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        getxcontroller.getImage(ImageSource.camera);
                      },
                      child: getxcontroller.selectedImage == null
                          ? (getxcontroller.myuser.value.image != null &&
                                  getxcontroller.myuser.value.image!.isNotEmpty)
                              ? Container(
                                  width: 120,
                                  height: 120,
                                  margin: const EdgeInsets.only(bottom: 20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 5,
                                    ),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          getxcontroller.myuser.value.image!),
                                    ),
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : Container(
                                  width: 120,
                                  height: 120,
                                  margin: const EdgeInsets.only(bottom: 20),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                          : Container(
                              width: 120,
                              height: 120,
                              margin: const EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      FileImage(getxcontroller.selectedImage!),
                                  fit: BoxFit.fill,
                                ),
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                            ),
                    ),
                  )
                ],
              );
            }),
          ),

          SizedBox(
            height: 10.0.hp,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                ReusableTextFormField(
                  controller: getxcontroller.namecontroller,
                  hintText: 'Name',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  onvalidation: (value) {
                    return value!.isEmpty ? "Enter Your Name!" : null;
                  },
                ),

                SizedBox(
                  height: 2.0.hp,
                ),
                ReusableTextFormField(
                  controller: getxcontroller.agecontroller,
                  hintText: 'Age',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  onvalidation: (value) {
                    return value!.isEmpty ? "Enter Your Age!" : null;
                  },
                ),

                SizedBox(
                  height: 2.0.hp,
                ),

                // text field password
                ReusableTextFormField(
                  controller: getxcontroller.gendercontroller,
                  hintText: 'Gender',
                  icon: Icons.password_outlined,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  onvalidation: (value) {
                    return value!.isEmpty ? "Enter Your Gender!" : null;
                  },
                ),

                SizedBox(
                  height: 5.0.hp,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.0.hp,
          ),
          // select button
          ReusableButton(
            onTap: () async {
              getxcontroller.isprofileloading(true);
              await getxcontroller.storeUserInfo();
              getxcontroller.isprofileloading(false);
            },
            text: "Select Image",
            color: const Color(0xff664f9e),
          ),

          SizedBox(
            height: 3.0.hp,
          ),

          // predict button
          ReusableButton(
            onTap: () => AlertDialogs.resultAlertDialog(
              Icons.report_outlined,
              "Yes Tumor Detected",
            ),
            text: "Detect",
            color: const Color(0xff664f9e),
          ),
        ],
      ),
    );
  }
}
