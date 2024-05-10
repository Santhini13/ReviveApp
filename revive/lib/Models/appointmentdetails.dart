// import 'package:flutter/material.dart';

// class Appointment {
//   final String doctor;
//   final DateTime time;
//   final String specialization;
//   final Duration duration;

//   Appointment({
//     required this.doctor,
//     required this.time,
//     required this.specialization,
//     required this.duration,
//   });
// }

// class AppointmentDetailsPage extends StatelessWidget {
//   final Appointment appointment;

//   AppointmentDetailsPage({required this.appointment});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Appointment Details'),
//       ),
//       body: Center(
//         child: Card(
//           elevation: 5.0,
//           margin: EdgeInsets.all(20.0),
//           child: Container(
//             width: 200,
//             height: 200,
//             padding: EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Doctor: ${appointment.doctor}',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18.0,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   'Date: ${appointment.time.day}/${appointment.time.month}/${appointment.time.year}',
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   'Specialization: ${appointment.specialization}',
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   'Duration: ${appointment.duration.inHours} hours ${appointment.duration.inMinutes.remainder(60)} minutes',
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }