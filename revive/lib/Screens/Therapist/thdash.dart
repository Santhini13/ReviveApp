import 'package:flutter/material.dart';

class Appointment {
  final String patientName;
  final DateTime appointmentTime;

  Appointment({required this.patientName, required this.appointmentTime});
}


class ThDashboard extends StatefulWidget {
  @override
  State<ThDashboard> createState() => _ThDashboardState();
}

class _ThDashboardState extends State<ThDashboard> {
 final List<Appointment> appointments = [
    Appointment(patientName: 'Alice', appointmentTime: DateTime.now().add(Duration(hours: 1))),
    Appointment(patientName: 'Bob', appointmentTime: DateTime.now().add(Duration(days: 1))),
    Appointment(patientName: 'Charlie', appointmentTime: DateTime.now().add(Duration(days: 1, hours: 2))),
    Appointment(patientName: 'David', appointmentTime: DateTime.now().add(Duration(days: 2))),
  ];

  @override
  Widget build(BuildContext context) {
    // Group appointments by date
    Map<DateTime, List<Appointment>> groupedAppointments = {};
    for (var appointment in appointments) {
      final date = DateTime(appointment.appointmentTime.year, appointment.appointmentTime.month, appointment.appointmentTime.day);
      groupedAppointments[date] = [...(groupedAppointments[date] ?? []), appointment];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Therapist Dashboard'),
      ),
      body: ListView(
        children: [
          for (var date in groupedAppointments.keys.toList()..sort((a, b) => a.compareTo(b)))
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${date.year}-${date.month}-${date.day}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                ...groupedAppointments[date]!.map((appointment) => AppointmentTile(appointment: appointment)).toList(),
                Divider(),
              ],
            ),
          SizedBox(height: 20),
          Text(
            'Mental Health Community Groups',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Column(
            children: [
              ListTile(
                title: Text('Anxiety Support Group'),
                onTap: () {
                  //Navigator.pushNamed(context, '/chat');
                  // Navigate to the anxiety support group chat
                },
              ),
              ListTile(
                title: Text('Depression Support Group'),
                onTap: () {
                  // Navigate to the depression support group chat
                },
              ),
              ListTile(
                title: Text('Stress Management Group'),
                onTap: () {
                  // Navigate to the stress management group chat
                },
              ),
              // Add more mental health community groups as needed
            ],
          ),
        ],
      ),
    );
  }
}

class AppointmentTile extends StatelessWidget {
  final Appointment appointment;

  AppointmentTile({required this.appointment});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(appointment.patientName),
      subtitle: Text('${appointment.appointmentTime.hour}:${appointment.appointmentTime.minute}'),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              width:double.infinity,
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Patient: ${appointment.patientName}'),
                  Text('Time: ${appointment.appointmentTime}'),
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
    );
  }
}