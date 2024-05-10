import 'package:flutter/material.dart';
import 'package:revive/Screens/Therapist/thappointmanage.dart';



class Appointment {
  final String patientName;
  final String appointmentTime;
  final String appointmentType;

  Appointment({
    required this.patientName,
    required this.appointmentTime,
    required this.appointmentType,
  });
}

class AppointmentTile extends StatelessWidget {
  final Appointment appointment;

  const AppointmentTile({Key? key, required this.appointment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(appointment.patientName),
      subtitle: Text('${appointment.appointmentTime} - ${appointment.appointmentType}'),
      onTap: () {
        // Navigate to appointment details screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AppointmentDetailsScreen(appointment: appointment)),
        );
      },
    );
  }
}

