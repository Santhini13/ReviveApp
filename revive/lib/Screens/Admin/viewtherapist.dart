 import 'package:flutter/material.dart';
 class ViewTherapistScreen extends StatefulWidget {
  @override
  _ViewTherapistScreenState createState() => _ViewTherapistScreenState();
}

class _ViewTherapistScreenState extends State<ViewTherapistScreen> {
  final List<String> therapists = [
    'Therapist 1',
    'Therapist 2',
    'Therapist 3',
  ];

  void _deleteTherapist(String therapist) {
    setState(() {
      therapists.remove(therapist);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Therapist "$therapist" deleted'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Therapists'),
      ),
      body: ListView.builder(
        itemCount: therapists.length,
        itemBuilder: (context, index) {
          final therapist = therapists[index];
          return ListTile(
            title: Text(therapist),
            onTap:(){},
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _deleteTherapist(therapist);
              },
            ),
          );
        },
      ),
    );
  }
}
