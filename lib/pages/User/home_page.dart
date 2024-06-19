import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neuro_care_hub_app/controllers/home_controller.dart';
import 'package:neuro_care_hub_app/pages/User/camera.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';
import 'package:neuro_care_hub_app/utils/styles/text_styles.dart';
import 'package:neuro_care_hub_app/utils/widgets/reusable%20widgets/reusable_button.dart';

import '../../utils/widgets/home page/circle_navigator.dart';
import 'about_page.dart';
import 'brain_tumor_detection_page.dart';
import '../Authentication/login_page.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffb7a7da),
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0.wp, vertical: 1.5.hp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 3.0.hp,
              ),

              // welcome text
              Text(
                "Welcome",
                style: TextStyles.boldDarkLargeTextStyle().copyWith(
                  color: Colors.white,
                  fontSize: 25.0.sp,
                ),
                textAlign: TextAlign.left,
                softWrap: true,
              ),

              SizedBox(
                height: 1.0.hp,
              ),

              // sub text
              Text(
                "Detecting Neuro Tumors & Alzheimer Using Advanced AI",
                style: TextStyles.boldDarkMediumTextStyle().copyWith(
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
                softWrap: true,
              ),

              SizedBox(
                height: 13.0.hp,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleNavigator(
                    onTap: () => Get.to(() => const AboutPage()),
                    imageAssetPath: 'assets/images/faq.png',
                    text: "About",
                  ),
                  SizedBox(
                    width: 5.0.wp,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 3.0.hp,
                      ),
                      CircleNavigator(
                        // onTap: () => Get.to(() => BrainTumorDetectionPage()),
                        onTap: () => Get.to(() => const CameraPredection()),

                        imageAssetPath: 'assets/images/medical.png',
                        text: "BTD Test",
                      ),
                    ],
                  ),
                ],
              ),

              // help, alzheimer detection option
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleNavigator(
                    onTap: () => controller.navigateToHelpPage(),
                    imageAssetPath: 'assets/images/help.png',
                    text: "Help",
                  ),
                  SizedBox(
                    width: 10.0.wp,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 3.5.hp,
                      ),
                      CircleNavigator(
                        onTap: () => controller.navigateToADPage(),
                        imageAssetPath: 'assets/images/adp.png',
                        text: "AD Test",
                      ),
                    ],
                  ),
                ],
              ),

              const Spacer(),

              Align(
                alignment: Alignment.center,
                child: ReusableButton(
                  // onTap: () => homeController.navigateToLoginPage(),
                  onTap: () async {
                    FirebaseAuth auth = FirebaseAuth.instance;
                    await auth.signOut();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  text: "Logout",
                  color: const Color(0xff7c4c87),
                  width: 60,
                ),
              ),

              SizedBox(
                height: 1.5.hp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
