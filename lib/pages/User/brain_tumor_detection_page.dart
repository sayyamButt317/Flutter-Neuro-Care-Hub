import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neuro_care_hub_app/controllers/brain_tumor_controller.dart';
import 'package:neuro_care_hub_app/controllers/image_controllers.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';
import 'package:neuro_care_hub_app/utils/widgets/reusable%20widgets/reusable_button.dart';
import 'package:neuro_care_hub_app/utils/widgets/reusable%20widgets/text_form_field.dart';

import '../../utils/styles/text_styles.dart';
import '../../utils/widgets/RadioButton/radio_button.dart';

class BrainTumorDetectionPage extends GetView<BrainTumorDetectionPage> {
  BrainTumorDetectionPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final TumorController getxcontroller = Get.put(TumorController());
  final GenderController genderController = Get.put(GenderController());
  // final BrainTumorImageDetector imagecontroller =
  //     Get.put<BrainTumorImageDetector>(BrainTumorImageDetector());

      
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
              "Submit Your Form for Detecting Neuro Tumors Using Advanced AI",
              style: TextStyles.boldDarkSmallTextStyle().copyWith(
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
              softWrap: true,
            ),
            SizedBox(height: 3.0.hp),
              SizedBox(
            height: 10.0.hp,
          ),
          // Image display
          SizedBox(
            height: Get.height * 0.2,
            child: Obx(() {
              return Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    getxcontroller.getImage(ImageSource.gallery);
                  },
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 5,
                      ),
                      shape: BoxShape.rectangle,
                      color: Colors.grey,
                      image: getxcontroller.selectedImage == null
                          ? getxcontroller.myuser.value.image != null &&
                                  getxcontroller.myuser.value.image!.isNotEmpty
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      getxcontroller.myuser.value.image!),
                                )
                              : null
                          : DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(getxcontroller.selectedImage!),
                            ),
                    ),
                    child: getxcontroller.selectedImage == null
                        ? getxcontroller.myuser.value.image != null &&
                                getxcontroller.myuser.value.image!.isNotEmpty
                            ? Container()
                            : const Center(
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              )
                        : null,
                  ),
                ),
              );
            }),
          ),
             SizedBox(
            height: 10.0.hp,
          ),
            MedicalForm(formKey: _formKey, getxcontroller: getxcontroller),
            SizedBox(height: 2.0.hp),
            ReusableButton(
              onTap: () {
                // Validate the form
                if (_formKey.currentState!.validate()) {
                  getxcontroller.storeBrainUserInfo();
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

class MedicalForm extends StatelessWidget {
  const MedicalForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.getxcontroller,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TumorController getxcontroller;

  @override
  Widget build(BuildContext context) {
    return Form(
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
              keyboardType: TextInputType.name,
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
    );
  }
}
