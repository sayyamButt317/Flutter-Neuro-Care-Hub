import 'package:flutter/material.dart';
import 'package:neuro_care_hub_app/controllers/brain_tumor_controller.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';
import 'package:neuro_care_hub_app/utils/widgets/RadioButton/radio_button.dart';
import 'package:neuro_care_hub_app/utils/widgets/reusable%20widgets/text_form_field.dart';

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
