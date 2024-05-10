import 'package:flutter/material.dart';
import 'package:revive/Screens/Therapist/thappointment.dart';



class AppointmentDetailsScreen extends StatelessWidget {
  final Appointment appointment;

  const AppointmentDetailsScreen({Key? key, required this.appointment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Patient Name: ${appointment.patientName}'),
            Text('Appointment Time: ${appointment.appointmentTime}'),
            Text('Appointment Type: ${appointment.appointmentType}'),
          ],
        ),
      ),
    );
  }
}