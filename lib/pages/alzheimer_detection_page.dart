import 'package:flutter/material.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';
import 'package:neuro_care_hub_app/utils/methods/alert_dialog.dart';
import 'package:neuro_care_hub_app/utils/widgets/reusable%20widgets/reusable_button.dart';

class AlzheimerDetectionPage extends StatelessWidget {
  const AlzheimerDetectionPage({super.key});

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
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 35.0.hp,
              width: 65.0.wp,
              padding: EdgeInsets.symmetric(horizontal: 1.0.wp, vertical: 1.0.hp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                "assets/images/brain-tumour.png",
                fit: BoxFit.fill,
              ),
            ),
          ),

          SizedBox(
            height: 10.0.hp,
          ),

          // select button
          ReusableButton(
            onTap: () {},
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
