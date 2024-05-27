import 'package:flutter/material.dart';

// Define Appointment model
class Appointment {
  final String therapist;
  final String specialization;
  final String mode;
  final String dateTime;
  final bool isUpcoming;

  Appointment({
    required this.therapist,
    required this.specialization,
    required this.mode,
    required this.dateTime,
    required this.isUpcoming,
  });
}

class UserHistory extends StatelessWidget {
  final List<Appointment> appointments = [
    Appointment(
      therapist: 'Dr. John Doe',
      specialization: 'Anxiety, Depression',
      mode: 'Video',
      dateTime: '2024-05-14 10:00 AM',
      isUpcoming: true,
    ),
    // Appointment(
    //   therapist: 'Dr. Jane Smith',
    //   specialization: 'Stress Management',
    //   mode: 'Chat',
    //   dateTime: '2024-05-12 02:00 PM',
    //   isUpcoming: false,)
    // Other appointments...
  ];

  @override
  Widget build(BuildContext context) {
    List<Appointment> upcomingAppointments =
        appointments.where((appointment) => appointment.isUpcoming).toList();
    List<Appointment> pastAppointments =
        appointments.where((appointment) => !appointment.isUpcoming).toList();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Increase the height of the app bar
        child: AppBar(
          title:Text('My Appointments',style:TextStyle(color:Colors.white),),
          backgroundColor: Colors.transparent, // Transparent background
          automaticallyImplyLeading: false, // Removes the back button
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff881736), Color(0xff281537)],
              ),
            ),))),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Upcoming Appointments',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: upcomingAppointments.isNotEmpty
                ? ListView.builder(
                    itemCount: upcomingAppointments.length,
                    itemBuilder: (context, index) {
                      return AppointmentListItem(
                        appointment: upcomingAppointments[index],
                        onTap: () => _showAppointmentDetails(
                            context, upcomingAppointments[index]),
                      );
                    },
                  )
                : Center(
                    child: Text('No upcoming appointments available.'),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Past Appointments',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: pastAppointments.isNotEmpty
                ? ListView.builder(
                    itemCount: pastAppointments.length,
                    itemBuilder: (context, index) {
                      return AppointmentListItem(
                        appointment: pastAppointments[index],
                        onTap: () => _showAppointmentDetails(
                            context, pastAppointments[index]),
                      );
                    },
                  )
                : Center(
                    child: Text('No past appointments available.'),
                  ),
          ),
        ],
      ),
    );
  }

  void _showAppointmentDetails(BuildContext context, Appointment appointment) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Therapist: ${appointment.therapist}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Specialization: ${appointment.specialization}'),
              SizedBox(height: 8),
              Text('Mode: ${appointment.mode}'),
              SizedBox(height: 8),
              Text('Date & Time: ${appointment.dateTime}'),
            ],
          ),
        );
      },
    );
  }
}

class AppointmentListItem extends StatelessWidget {
  final Appointment appointment;
  final VoidCallback onTap;

  AppointmentListItem({required this.appointment, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(appointment.therapist),
      subtitle: Text(appointment.specialization),
      trailing: Text(appointment.dateTime),
      onTap: onTap,
    );
  }
}
