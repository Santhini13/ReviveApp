import 'package:flutter/material.dart';

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

  AppointmentTile({required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(
          appointment.patientName,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${appointment.appointmentTime} - ${appointment.appointmentType}',
          style: TextStyle(fontSize: 16),
        ),
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Patient: ${appointment.patientName}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Time: ${appointment.appointmentTime}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        // Start session logic here
                        Navigator.pop(context);
                      },
                      child: Text('Start Session'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// class AppointmentTile extends StatelessWidget {
//   final Appointment appointment;

//   const AppointmentTile({Key? key, required this.appointment}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(appointment.patientName),
//       subtitle: Text('${appointment.appointmentTime} - ${appointment.appointmentType}'),
//       onTap: () {
//         // Navigate to appointment details screen
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => AppointmentDetailsScreen(appointment: appointment)),
//         );
//       },
//     );
//   }
// }

