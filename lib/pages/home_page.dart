import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neuro_care_hub_app/controllers/home_controller.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';
import 'package:neuro_care_hub_app/utils/styles/text_styles.dart';
import 'package:neuro_care_hub_app/utils/widgets/reusable%20widgets/reusable_button.dart';

import '../utils/widgets/home page/circle_navigator.dart';

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

              // get to know, btd text option
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleNavigator(
                    onTap: () => controller.navigateToAboutPage(),
                    icon: Icons.calendar_today_outlined,
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
                        onTap: () => controller.navigateToBTDPage(),
                        icon: Icons.health_and_safety_outlined,
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
                    icon: Icons.help_outline,
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
                        icon: Icons.health_and_safety_outlined,
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
                  onTap: () {},
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
