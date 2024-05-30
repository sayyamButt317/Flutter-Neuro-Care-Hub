import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neuro_care_hub_app/controllers/brain_tumor_controller.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';
import 'package:neuro_care_hub_app/utils/widgets/reusable%20widgets/reusable_button.dart';
import '../User/onboarding_page.dart';

class AdminBrainDataScreen extends StatefulWidget {
  const AdminBrainDataScreen({super.key});

  @override
  State<AdminBrainDataScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminBrainDataScreen> {
  final TumorController getxcontroller = Get.put(TumorController());

  @override
  void initState() {
    super.initState();
    getxcontroller.getBrainUserInfo(); // Call to fetch all users
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Screen'),
      ),
      body: Obx(
        () => getxcontroller.allUsers.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: getxcontroller.allUsers.length,
                itemBuilder: (context, index) {
                  final user = getxcontroller.allUsers[index];
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('First Name: ${user.name ?? ''}'),
                        Text('Last Name: ${user.lastname ?? ''}'),
                        Text('Disease: ${user.disease ?? ''}'),
                        Text('Address: ${user.address ?? ''}'),
                        Text('City: ${user.city ?? ''}'),
                        Text('State: ${user.state ?? ''}'),

                        // Add more fields here as needed
                        const Spacer(),
                        Align(
                          alignment: Alignment.center,
                          child: ReusableButton(
                            // onTap: () => homeController.navigateToLoginPage(),
                            onTap: () async {
                              FirebaseAuth auth = FirebaseAuth.instance;
                              await auth.signOut();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const OnBoarding()));
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
                  );
                },
              ),
      ),
    );
  }
}
