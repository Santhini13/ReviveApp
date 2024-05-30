import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revive/Screens/constants/myAppbar.dart';

class ViewTherapistScreen extends StatelessWidget {
  const ViewTherapistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'View Therapist'), 
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').where('role', isEqualTo: 'Therapist').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No therapists found'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var therapistData = snapshot.data!.docs[index];
              var username = therapistData['username'];
              var phoneNumber = therapistData['phoneNumber'];
              var email = therapistData['email'];
              var userId = therapistData.id;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Card(
                  elevation: 4,
                  child: ListTile(
                    title: Text(username),
                    onTap: () async {
                      // Fetch therapist's additional information
                      var therapistId = userId; // Use userId to fetch therapist's additional information
                      var therapistInfo = await FirebaseFirestore.instance.collection('therapist').doc(therapistId).get();
                      var specialization = therapistInfo.exists ? therapistInfo['specialization'] : 'N/A';
                      var qualification = therapistInfo.exists ? therapistInfo['qualification'] : 'N/A';
                      var experience = therapistInfo.exists ? therapistInfo['experience'] : 'N/A';
                      var description = therapistInfo.exists ? therapistInfo['description'] : 'N/A';
                      var rci = therapistInfo.exists ? therapistInfo['rci'] : 'N/A';
                      // var timeSlots = therapistInfo.exists ? (therapistInfo['timeSlots'] as List).join(', ') : 'N/A';
                      // var appointmentTypes = therapistInfo.exists ? (therapistInfo['appointmentTypes'] as List).join(', ') : 'N/A';
                      
                      // Show the therapist's details in a dialog
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(username),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Email: $email'),
                              SizedBox(height: 8),
                              Text('Phone Number: $phoneNumber'),
                              SizedBox(height: 8),
                              Text('Specialization: $specialization'),
                              SizedBox(height: 8),
                              Text('Qualification: $qualification'),
                              SizedBox(height: 8),
                              Text('Experience: $experience'),
                              SizedBox(height: 8),
                              Text('Description: $description'),
                              SizedBox(height: 8),
                              Text('RCI: $rci'),
                              SizedBox(height: 8),
                              // Text('Time Slots: $timeSlots'),
                              // SizedBox(height: 8),
                              // Text('Appointment Types: $appointmentTypes'),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () async {
                                // Delete the therapist data from Firestore
                                await FirebaseFirestore.instance.collection('users').doc(userId).delete();
                                await FirebaseFirestore.instance.collection('therapist').doc(userId).delete();
                                Navigator.of(context).pop();
                              },
                              child: Text('Delete'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
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
