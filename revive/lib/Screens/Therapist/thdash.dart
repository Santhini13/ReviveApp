
import 'package:flutter/material.dart';
import 'package:revive/Screens/Therapist/yourActivity.dart';
import 'package:revive/Screens/features/audiocall.dart';
import 'package:revive/Screens/features/chat.dart';
import 'package:revive/Screens/features/videocall.dart';


class ThDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSectionTitle('Your Appointments'),
            _buildAppointmentSection(
              context,
              ['Patient 1', 'Patient 2',], // Video call patients
              ['Patient 3', 'Patient 4'], // Call patients
              ['Patient 5', 'Patient 6'], // Chat group session patients
            ),
            _buildActivitiesSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xff881736),),
      ),
    );
  }

  Widget _buildAppointmentSection(BuildContext context, List<String> videoCallPatients, List<String> callPatients, List<String> chatPatients) {
    return ExpansionTile(
      title: Text('Your Appointments'),
      children: [
        _buildAppointmentList(context, 'Video Call', videoCallPatients, VideoCallScreen()),
        _buildAppointmentList(context, 'Call', callPatients, VoiceCallScreen()),
        _buildAppointmentList(context, 'Chat', chatPatients, Chat()),
      ],
    );
  }

  Widget _buildAppointmentList(BuildContext context, String sessionType, List<String> patients, Widget screen) {
    return Column(
      children: [
        ListTile(
          title: Text(sessionType),
          subtitle: Text('Patients booked for $sessionType session'),
        ),
        for (var patient in patients)
          ListTile(
            title: Text(patient),
            trailing: ElevatedButton(
              onPressed: () {
                _startSession(context, sessionType, screen);
              },
              child: Text('Start Session'),
            ),
          ),
      ],
    );
  }

  Widget _buildActivitiesSection(BuildContext context) {
  return GestureDetector(
    onTap: () {
     Navigator.pushNamed(context, '/yourActivity');
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff881736),
          borderRadius: BorderRadius.circular(30)
        ),
        child: ListTile(
          title: Text(
            'Activities',
            style: TextStyle(color: Colors.white),
          ),
          trailing: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}


  void _startSession(BuildContext context, String sessionType, Widget screen) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Start $sessionType Session'),
        content: Text('Do you want to start the $sessionType session?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Navigate to the corresponding screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => screen),
              );
            },
            child: Text('Start'),
          ),
        ],
      );
    },
  );
}
}


