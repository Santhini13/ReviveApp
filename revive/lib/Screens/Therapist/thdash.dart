
import 'package:flutter/material.dart';

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
              ['Patient 1', 'Patient 2'], // Video call patients
              ['Patient 3', 'Patient 4'], // Call patients
              ['Patient 5', 'Patient 6'], // Chat group session patients
            ),
            _buildSectionTitle('Activities'),
            _buildActivitiesSection(),
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
        _buildAppointmentList(context, 'Video Call', videoCallPatients),
        _buildAppointmentList(context, 'Call', callPatients),
        _buildAppointmentList(context, 'Chat ', chatPatients),
      ],
    );
  }

  Widget _buildAppointmentList(BuildContext context, String sessionType, List<String> patients) {
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
                _startSession(context, sessionType);
              },
              child: Text('Start Session'),
            ),
          ),
      ],
    );
  }

  Widget _buildActivitiesSection() {
    return ListTile(
      title: Text('Activities'),
      // Implement your activities here
    );
  }


  void _startSession(BuildContext context, String sessionType) {
    // Show a dialog to start the session based on the session type
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Start Session'),
          content: Text('Start $sessionType session?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Start session logic goes here
                Navigator.of(context).pop();
              },
              child: Text('Start'),
            ),
          ],
        );
      },
    );
  }
}

