import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Gender { Male, Female, Other }

class GenderController extends GetxController {
  final Rx<Gender> _selectedGender = Gender.Male.obs;

  Rx<Gender> get selectedGender => _selectedGender;
}

class GenderRadioButton extends StatelessWidget {
  const GenderRadioButton({super.key});

  @override
  Widget build(BuildContext context) {
    final GenderController controller = Get.find<GenderController>();

    return Obx(() => Row(
      children: [
        _buildRadioButton(Gender.Male, controller),
        _buildRadioButton(Gender.Female, controller),
        _buildRadioButton(Gender.Other, controller),
      ],
    ));
  }

  Widget _buildRadioButton(Gender gender, GenderController controller) {
    return Row(
      children: [
        Radio<Gender>(
          value: gender,
          groupValue: controller.selectedGender.value,
          onChanged: (selectedGender) {
            controller.selectedGender.value = selectedGender!;
          },
        ),
        Text(_genderToString(gender)),
      ],
    );
  }

  String _genderToString(Gender gender) {
    switch (gender) {
      case Gender.Male:
        return 'Male';
      case Gender.Female:
        return 'Female';
      case Gender.Other:
        return 'Other';
      default:
        return '';
    }
  }
}
