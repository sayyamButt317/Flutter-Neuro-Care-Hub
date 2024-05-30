import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neuro_care_hub_app/controllers/alzheimer_controller.dart';
import 'package:neuro_care_hub_app/pages/User/onboarding_page.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';
import 'package:neuro_care_hub_app/utils/widgets/reusable%20widgets/reusable_button.dart';

class AdminAlzDataScreen extends StatefulWidget {
  const AdminAlzDataScreen({super.key});

  @override
  State<AdminAlzDataScreen> createState() => _AdminAlzDataScreenState();
}

class _AdminAlzDataScreenState extends State<AdminAlzDataScreen> {
  final AlzheimerController getxcontroller = Get.put(AlzheimerController());

  @override
  void initState() {
    super.initState();
    getxcontroller.getAlzInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Screen'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: getxcontroller.allUsers.length,
          itemBuilder: (context, index) {
            final user = getxcontroller.allUsers[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('First Name: ${user.name ?? ''}'),
                Text('Last Name: ${user.lastname ?? ''}'),
                Text('Disease: ${user.disease ?? ''}'),
                Text('Address: ${user.address ?? ''}'),
                Text('City: ${user.city ?? ''}'),
                Text('State: ${user.state ?? ''}'),
                const Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: ReusableButton(
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
            );
          },
        ),
      ),
    );
  }
}
