import 'package:flutter/material.dart';
import 'package:revive/Screens/general/appointmentdetails.dart';

class DoctorAppointmentsPage extends StatelessWidget {
  // Dummy list of appointments
  final List<Appointment> appointments = [
    Appointment(
      doctor: 'Dr. Smith',
      time: DateTime.now().subtract(Duration(days: 2)),
      specialization: 'Cardiologist',
      duration: Duration(hours: 1),
    ),
    Appointment(
      doctor: 'Dr. Johnson',
      time: DateTime.now().add(Duration(days: 1)),
      specialization: 'Dermatologist',
      duration: Duration(hours: 2),
    ),
    Appointment(
      doctor: 'Dr. Williams',
      time: DateTime.now().add(Duration(days: 5)),
      specialization: 'Pediatrician',
      duration: Duration(hours: 1, minutes: 30),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Appointment> upcomingAppointments = [];
    List<Appointment> finishedAppointments = [];

    for (var appointment in appointments) {
      if (appointment.time.isBefore(DateTime.now())) {
        finishedAppointments.add(appointment);
      } else {
        upcomingAppointments.add(appointment);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Therapist Appointments',style: TextStyle(color: Color(0xff881736),fontSize: 24),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Upcoming Appointments'),
            _buildAppointmentList(upcomingAppointments),
            _buildSectionTitle('Finished Appointments'),
            _buildAppointmentList(finishedAppointments),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildAppointmentList(List<Appointment> appointments) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final appointment = appointments[index];
        final isPastAppointment = appointment.time.isBefore(DateTime.now());

        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Appointment Details'),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Doctor: ${appointment.doctor}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Date: ${appointment.time.day}/${appointment.time.month}/${appointment.time.year}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      if (!isPastAppointment) SizedBox(height: 8.0),
                      if (!isPastAppointment)
                        Text(
                          'Specialization: ${appointment.specialization}',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      if (!isPastAppointment) SizedBox(height: 8.0),
                      if (!isPastAppointment)
                        Text(
                          'Duration: ${appointment.duration.inHours} hours ${appointment.duration.inMinutes.remainder(60)} minutes',
                          style: TextStyle(fontSize: 16.0),
                        ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Close'),
                  ),
                ],
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: isPastAppointment ? Colors.red[100] : Colors.green[100],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Doctor: ${appointment.doctor}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Date: ${appointment.time.day}/${appointment.time.month}/${appointment.time.year}',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Appointment {
  final String doctor;
  final DateTime time;
  final String specialization;
  final Duration duration;

  Appointment({
    required this.doctor,
    required this.time,
    required this.specialization,
    required this.duration,
  });
}