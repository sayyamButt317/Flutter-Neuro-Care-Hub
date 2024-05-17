import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';
import 'package:neuro_care_hub_app/utils/styles/text_styles.dart';
import '../controllers/admin_controller.dart';
import '../controllers/authentication_controller.dart';
import '../controllers/login_controller.dart';
import '../utils/widgets/reusable widgets/text_form_field.dart';
import 'admin_page.dart';

class AdminPage extends GetView<AdminController> {
  AdminPage({super.key});


  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  final AdminController getxcontroller =

  Get.put<AdminController>(AdminController());
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAll(()=>const AdminScreen() );
    } catch (error) {
      // Show error snackbar
      Get.snackbar(
        "Error",
        "Failed to Login: $error",
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
        borderColor: Colors.red,
        colorText: Colors.red,
        titleText: const Text(
          "Error",
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(
      builder: (controller) {
        return Scaffold(

          resizeToAvoidBottomInset: false,
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                scale: double.maxFinite,
                image: AssetImage(
                  "assets/images/background-1.jpg",
                ),
              ),
            ),
            child: Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 3.0.wp, vertical: 4.0.hp),
              child: Column(
                children: [
                  SizedBox(
                    height: 15.0.hp,
                  ),

                  // login text
                  Text(
                    "Login as Admin",
                    style: TextStyles.boldDarkLargeTextStyle().copyWith(
                      fontSize: 20.0.sp,
                      color: const Color(0xffE2F0FA),
                    ),
                  ),

                  SizedBox(
                    height: 10.0.hp,
                  ),

                  // text field email
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        ReusableTextFormField(
                          controller: emailcontroller,
                          hintText: 'Email',
                          icon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          onvalidation: (value) {
                            return value!.isEmpty
                                ? "Enter Your Email!"
                                : null;
                          },
                        ),

                        SizedBox(
                          height: 2.0.hp,
                        ),

                        // text field password
                        ReusableTextFormField(
                          controller: passwordcontroller,
                          hintText: 'Password',
                          icon: Icons.password_outlined,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          onvalidation: (value) {
                            return value!.isEmpty
                                ? "Enter Your Password!"
                                : null;
                          },
                        ),

                        SizedBox(
                          height: 5.0.hp,
                        ),
                      ],
                    ),
                  ),

                  MaterialButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        getxcontroller.isProfileLoading(true);
                        await login(
                            emailcontroller.text.toString(),
                            passwordcontroller.text.toString());
                        getxcontroller.isProfileLoading(false);
                      }
                    },
                    height: 50,
                    minWidth: MediaQuery.of(context).size.width * 0.89,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.purple[600],
                    child: Obx(() {
                      return getxcontroller.isProfileLoading.value
                          ? const CircularProgressIndicator(
                          strokeWidth: 3, color: Colors.white)
                          : const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      );
                    }),
                  ),


                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
