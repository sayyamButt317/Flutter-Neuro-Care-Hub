import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';
import 'package:neuro_care_hub_app/utils/styles/text_styles.dart';
import 'package:neuro_care_hub_app/utils/widgets/reusable%20widgets/reusable_button.dart';

import '../utils/widgets/about page/brain_tumor_types.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xff664f9e),
        title: Text(
          "About Tumor",
          style: TextStyles.boldDarkLargeTextStyle().copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0.wp, vertical: 3.0.hp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "A brain tumor is an abnormal growth of cells in the brain. These tumors can be benign or malignant and may cause symptoms like headaches, seizures, and cognitive changes. Early detection is crucial for effective treatment. Our Brain Tumor Detection app utilizes advanced AI technology to assist in the early identification and diagnosis of brain tumors, aiding healthcare professionals in providing timely care.",
              style: TextStyles.boldLightSmallTextStyle().copyWith(fontWeight: FontWeight.w200),
              softWrap: true,
            ),
            SizedBox(
              height: 2.0.hp,
            ),

            // types text
            Text(
              "Types",
              style: TextStyles.boldDarkMediumTextStyle(),
            ),
            SizedBox(
              height: 2.0.hp,
            ),

            // types of brain tumor
            const BrainTumorTypesRow(
              firstString: "1. Gliomas",
              secondString: "2. Meningioma",
              thirdString: "3. Chondroma",
            ),

            SizedBox(
              height: 0.25.hp,
            ),

            const BrainTumorTypesRow(
              firstString: "4. Osteoma",
              secondString: "5. Schwannoma",
              thirdString: "6. Neurofibroma",
            ),

            SizedBox(
              height: 5.0.hp,
            ),

            // images
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/images/description-1.jpg",
                  height: 20.0.hp,
                  width: 40.0.wp,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 1.0.wp,
                ),
                Image.asset(
                  "assets/images/description-2.png",
                  height: 20.0.hp,
                  width: 40.0.wp,
                  fit: BoxFit.cover,
                ),
              ],
            ),

            Text(
              "Alzheimer's disease is a brain disorder that slowly destroys memory and thinking skills, and eventually, the ability to carry out the simplest tasks. In most people with Alzheimer's, symptoms first appear later in life.",
              style: TextStyles.boldLightSmallTextStyle().copyWith(fontWeight: FontWeight.w200),
              softWrap: true,
            ),
            SizedBox(
              height: 2.0.hp,
            ),

            const Spacer(),

            Align(
              alignment: Alignment.center,
              child: ReusableButton(
                onTap: () {
                  Get.back();
                },
                text: "Go Back",
                color: const Color(0xff664f9e),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
