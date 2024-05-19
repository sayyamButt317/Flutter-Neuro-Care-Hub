// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../Model/usermodel.dart';
// import '../controllers/brain_tumor_controller.dart';
//
// class AdminScreen extends StatefulWidget {
//   const AdminScreen({super.key});
//
//   @override
//   State<AdminScreen> createState() => _AdminScreenState();
// }
//
// class _AdminScreenState extends State<AdminScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }
//
//
//   final TumorController getxcontroller = Get.put(TumorController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Admin Screen'),
//       ),
//
//
//
//       // body: getxcontroller.allUsers.isEmpty
//       //     ? const Center(child: CircularProgressIndicator())
//       //     : ListView.builder(
//       //         itemCount: getxcontroller.allUsers.length,
//       //         itemBuilder: (context, index) {
//       //           final user = getxcontroller.allUsers[index];
//       //           return Container(
//       //             margin: const EdgeInsets.all(8.0),
//       //             padding: const EdgeInsets.all(8.0),
//       //             decoration: BoxDecoration(
//       //               border: Border.all(color: Colors.grey),
//       //               borderRadius: BorderRadius.circular(8.0),
//       //             ),
//       //             child: Column(
//       //               crossAxisAlignment: CrossAxisAlignment.start,
//       //               children: [
//       //                 Text('First Name: ${user.name ?? ''}'),
//       //                 Text('Last Name: ${user.lastname ?? ''}'),
//       //                 Text('Disease: ${user.disease ?? ''}'),
//       //                 Text('Address: ${user.address ?? ''}'),
//       //                 Text('City: ${user.city ?? ''}'),
//       //                 Text('State: ${user.state ?? ''}'),
//       //
//       //                 // Add more fields here as needed
//       //               ],
//       //             ),
//       //           );
//       //         },
//       //       ),
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neuro_care_hub_app/pages/onboarding_page.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';
import 'package:neuro_care_hub_app/utils/styles/text_styles.dart';
import 'package:neuro_care_hub_app/utils/widgets/home%20page/circle_navigator.dart';
import 'package:neuro_care_hub_app/utils/widgets/reusable%20widgets/reusable_button.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

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
                "Welcome Admin ",
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
                "Record of Detecting Neuro Tumors & Alzheimer ",
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
                  Column(
                    children: [
                      SizedBox(
                        height: 3.0.hp,
                      ),
                      CircleNavigator(
                        onTap: () {},
                        // onTap: () => Get.to(() => BrainTumorDetectionPage()),
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
                  Column(
                    children: [
                      SizedBox(
                        height: 3.5.hp,
                      ),
                      CircleNavigator(
                        onTap: () {},
                        // onTap: () => Get.to(() => AlzheimerDetectionPage()),
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
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const OnBoarding()));
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
