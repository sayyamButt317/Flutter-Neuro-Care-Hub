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
import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Record'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Name:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '', // Replace with actual user name
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Address:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '123 Main Street, City, Country', // Replace with actual address
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Medical History:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Medical History details here...', // Replace with actual medical history
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'State:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Healthy', // Replace with actual state
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}