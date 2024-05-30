import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neuro_care_hub_app/controllers/brain_tumor_controller.dart';

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
    getxcontroller.getBrainUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Screen'),
      ),
      body: Obx(
        () {
          if (getxcontroller.isProfileLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (getxcontroller.allUsers.isEmpty) {
            return const Center(child: Text('No users found.'));
          }

          return ListView.builder(
            itemCount: getxcontroller.allUsers.length,
            itemBuilder: (context, index) {
              final user = getxcontroller.allUsers[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: Text('${user.name ?? ''} ${user.lastname ?? ''}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Disease: ${user.disease ?? ''}'),
                        Text('Address: ${user.address ?? ''}'),
                        Text('City: ${user.city ?? ''}'),
                        Text('State: ${user.state ?? ''}'),
                        Text('Gender: ${user.gender ?? ''}'),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
