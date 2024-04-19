import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';
import 'package:neuro_care_hub_app/utils/widgets/reusable%20widgets/reusable_button.dart';

import '../controllers/alzheimer_controller.dart';
import '../utils/styles/text_styles.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical:50.0,horizontal: 8),
        child: ListView(
          children: [
            Text(
              "Disease Form",
              style: TextStyles.boldDarkLargeTextStyle().copyWith(
                color: Colors.purple,
                fontSize: 25.0.sp,
              ),
              textAlign: TextAlign.left,
              softWrap: true,
            ),
            SizedBox(height: 3.0.hp),
            Text(
              "Submit Your Form for Detecting Alzheimer Tumors Using Advanced AI",
              style: TextStyles.boldDarkSmallTextStyle().copyWith(
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
              softWrap: true,
            ),
            SizedBox(height: 3.0.hp),
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
                          width: 10, // Adjust the width between the fields as needed
                        ),
                        Expanded(
                          child: ReusableTextFormField(
                            controller: getxcontroller.diseasecontroller,
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
                    SizedBox(height: 2.0.hp),
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
                    SizedBox(height: 2.0.hp),
                    ReusableTextFormField(
                      controller: getxcontroller.gendercontroller,
                      hintText: 'Gender',
                      icon: Icons.male,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      onvalidation: (value) {
                        return value!.isEmpty ? "Enter Your Gender!" : null;
                      },
                    ),
                    SizedBox(height: 5.0.hp),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.0.hp),
            ReusableButton(
              onTap: () {
                // Validate the form
                if (_formKey.currentState!.validate()) {

                  Get.to(() => ImageUploadPage());
                }
              },
              width: MediaQuery.of(context).size.width * 0.2,
              text: "Submit",
              color: const Color(0xff664f9e),
            ),
            SizedBox(height: 2.0.hp),
          ],
        ),
      ),
    );
  }

}
