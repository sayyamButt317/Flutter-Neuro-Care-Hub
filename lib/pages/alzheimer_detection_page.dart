import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';
import 'package:neuro_care_hub_app/utils/methods/alert_dialog.dart';
import 'package:neuro_care_hub_app/utils/widgets/reusable%20widgets/reusable_button.dart';

import '../controllers/alzheimer_controller.dart';
import '../utils/widgets/reusable widgets/text_form_field.dart';
import 'image_upload.dart';

class AlzheimerDetectionPage extends GetView<AlzheimerDetectionPage> {
   AlzheimerDetectionPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final AlzheimerController getxcontroller =
  Get.put<AlzheimerController>(AlzheimerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffc2aed3),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ReusableTextFormField(
                          controller: getxcontroller.namecontroller,
                          hintText: 'Name',
                          icon: Icons.person_outline,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          onvalidation: (value) {
                            return value!.isEmpty ? "Enter Your Name!" : null;
                          },
                        ),
                      ),
                      const SizedBox(
                        width:
                        10, // Adjust the width between the fields as needed
                      ),
                      Expanded(
                        child: ReusableTextFormField(
                          controller: getxcontroller.namecontroller,
                          hintText: 'Alzheimer',
                          icon: Icons.sick_rounded,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          onvalidation: (value) {
                            return value!.isEmpty ? "Enter Your Disease!" : null;
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 2.0.hp,
                  ),
                  ReusableTextFormField(
                    controller: getxcontroller.agecontroller,
                    hintText: 'Age',
                    icon: Icons.person,
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
                    icon: Icons.male,
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
          ),
          SizedBox(
            height: 2.0.hp,
          ),
          // select button



          SizedBox(
            height: 2.0.hp,
          ),
          ReusableButton(
            onTap: () => Get.to(()=>ImageUploadPage()),
            width: MediaQuery.of(context).size.width * 0.2,
            text: "Submit",
            color: const Color(0xff664f9e),
          ),
        ],

      ),
    );
  }
}
