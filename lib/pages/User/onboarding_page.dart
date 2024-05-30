import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';
import 'package:neuro_care_hub_app/utils/widgets/reusable%20widgets/reusable_button.dart';
import '../Admin/admin_login.dart';
import '../Authentication/login_page.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: _body(height, width),
    );
  }

  Container _body(double height, double width) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/background-2.png"),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/splash-page-logo.png",
            height: height / 4.5,
            width: width / 1.85,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 8.0.hp,
          ),
          Align(
            alignment: Alignment.center,
            child: ReusableButton(
              // onTap: () => homeController.navigateToLoginPage(),
              onTap: () => Get.to(() => AdminLogin()),
              text: "Login as Admin",
              color: const Color(0xff7c4c87),
              width: 60,
            ),
          ),
          SizedBox(
            height: 5.0.hp,
          ),
          Align(
            alignment: Alignment.center,
            child: ReusableButton(
              onTap: () => Get.to(() => LoginPage()),
              text: "Login as User",
              color: const Color(0xff7c4c87),
              width: 60,
            ),
          ),
        ],
      ),
    );
  }
}
