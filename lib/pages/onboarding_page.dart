import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';
import 'package:neuro_care_hub_app/utils/widgets/reusable%20widgets/reusable_button.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ReusableButton(
            onTap: () async {},
            text: "Login As Admin",
            color: const Color(0xff664f9e),
          ),
          SizedBox(
            height: 3.0.hp,
          ),
          ReusableButton(
            onTap: () async {},
            text: "Login As User",
            color: const Color(0xff664f9e),
          ),
          SizedBox(
            height: 3.0.hp,
          ),
        ],
      ),
    );
  }
}
