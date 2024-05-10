import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                // Add functionality to manage therapists
                print('Manage Therapists');
              },
              child: Text('Manage Therapists'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add functionality to update questionnaires
                print('Update Questionnaires');
              },
              child: Text('Update Questionnaires'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add functionality for other admin tasks
                print('Other Admin Tasks');
              },
              child: Text('Other Admin Tasks'),
            ),
          ],
        ),
      ),
    );
  }
}