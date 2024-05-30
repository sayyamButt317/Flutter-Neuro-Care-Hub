import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';
import 'package:neuro_care_hub_app/utils/widgets/reusable%20widgets/reusable_button.dart';

import '../../controllers/alzheimer_controller.dart';
import '../../utils/styles/text_styles.dart';
import '../../utils/widgets/RadioButton/radio_button.dart';
import '../../utils/widgets/reusable widgets/text_form_field.dart';

class AlzheimerDetectionPage extends GetView<AlzheimerDetectionPage> {
  AlzheimerDetectionPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final AlzheimerController getxcontroller = Get.put(AlzheimerController());
  final GenderController genderController = Get.put(GenderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 8),
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
                            controller: getxcontroller.firstnamecontroller,
                            hintText: 'First',
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
                            controller: getxcontroller.lastnamecontroller,
                            hintText: 'Last',
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
                      ],
                    ),
                    SizedBox(height: 2.0.hp),
                    const GenderRadioButton(),
                    ReusableTextFormField(
                      controller: getxcontroller.diseasecontroller,
                      hintText: 'Medical History',
                      icon: Icons.sick_rounded,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      onvalidation: (value) {
                        return value!.isEmpty ? "Enter Your Disease!" : null;
                      },
                    ),
                    SizedBox(height: 2.0.hp),
                    ReusableTextFormField(
                      controller: getxcontroller.addresscontroller,
                      hintText: 'Address',
                      icon: Icons.home,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      onvalidation: (value) {
                        return value!.isEmpty ? "Enter Your Address!" : null;
                      },
                    ),
                    SizedBox(height: 2.0.hp),
                    Row(
                      children: [
                        Expanded(
                          child: ReusableTextFormField(
                            controller: getxcontroller.citycontroller,
                            hintText: 'City',
                            icon: Icons.location_city_rounded,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            onvalidation: (value) {
                              return value!.isEmpty ? "Enter Your City!" : null;
                            },
                          ),
                        ),
                        const SizedBox(
                          width:
                              10, // Adjust the width between the fields as needed
                        ),
                        Expanded(
                          child: ReusableTextFormField(
                            controller: getxcontroller.statecontroller,
                            hintText: 'State',
                            icon: Icons.real_estate_agent_outlined,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            onvalidation: (value) {
                              return value!.isEmpty ? "Enter Your City!" : null;
                            },
                          ),
                        ),
                      ],
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
                  getxcontroller.storeAlzUserInfo();
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
