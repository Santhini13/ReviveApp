
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:intl/intl.dart';
// import 'package:revive/Models/bookingModal.dart';
// import 'package:revive/Services/bookingServices.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class ThDashboard extends StatelessWidget {
//   final BookingService _bookingService = BookingService();
//   final User? currentUser = FirebaseAuth.instance.currentUser;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold( 
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             _buildSectionTitle('Your Appointments'),
//             if (currentUser != null) _buildAppointmentsList(context, currentUser!.uid),
//             _buildActivitiesSection(context),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Text(
//         title,
//         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff881736)),
//       ),
//     );
//   }



//   Widget _buildAppointmentsList(BuildContext context, String therapistId) {
//   return StreamBuilder<List<Booking>>(
//     stream: _bookingService.fetchBookingForTherapist(therapistId),
//     builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return Center(child: CircularProgressIndicator());
//       } else if (snapshot.hasError) {
//         return Center(child: Text('Error fetching appointments: ${snapshot.error}'));
//       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//         return Center(child: Text('No appointments found'));
//       } else {
//         List<Booking> appointments = snapshot.data!;
//         return ListView.builder(
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           itemCount: appointments.length,
//           itemBuilder: (context, index) {
//             Booking appointment = appointments[index];
//             String formattedDay = DateFormat.yMMMd().format(appointment.day);
//             return Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Card(
//                 elevation: 5,
//                 child: ListTile(
//                   title: Text(appointment.userName ?? 'Unknown User'),
//                   subtitle: Text(' ${appointment.appointmentType}, ${appointment.timeSlot}, $formattedDay'),
//                   trailing: IconButton(
//                           icon: Icon(Icons.cancel),
//                           onPressed: () => _confirmCancellation(context, therapistId, appointment.id),
//                         ),
//                   onTap: () async {
//                     String? userName = await _bookingService.fetchUserName(appointment.userId);
//                     String? email = await _bookingService.fetchUserEmail(appointment.userId);
//                     String? phoneNumber = await _bookingService.fetchUserPhoneNumber(appointment.userId);
//                     _showAppointmentDetailsDialog(context, appointment, userName, email, phoneNumber);
//                   },
//                 ),
//               ),
//             );
//           },
//         );
//       }
//     },
//   );
// }

// void _showAppointmentDetailsDialog(BuildContext context, Booking appointment, String? userName, String? email, String? phoneNumber) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Appointment Details'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Name: ${userName ?? 'Unknown'}'),
//             Text('Email: ${email ?? 'N/A'}'),
//             Text('Phone: ${phoneNumber ?? 'N/A'}'),
//             SizedBox(height: 16),
//             Text('Appointment Type: ${appointment.appointmentType}'),
//             Text('Time Slot: ${appointment.timeSlot}'),
//             Text('Date: ${DateFormat.yMMMd().format(appointment.day)}'),
//           ],
//         ),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: Text('Close'),
//           ),
//         ],
//       );
//     },
//   );
// }


//   void _confirmCancellation(BuildContext context, String therapistId, String bookingId) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Cancel Appointment'),
//           content: Text('Are you sure you want to cancel this appointment?'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: Text('No'),
//             ),
//             TextButton(
//               onPressed: () {
//                 _bookingService.deleteBookings(therapistId, bookingId).then((_) {
//                   Navigator.of(context).pop();
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Appointment cancelled successfully',),backgroundColor: Color(0xff881736),),
//                   );
//                 }).catchError((error) {
//                   Navigator.of(context).pop();
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Failed to cancel appointment: $error')),
//                   );
//                 });
//               },
//               child: Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildActivitiesSection(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.pushNamed(context, '/yourActivity');
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10.0),
//         child: Container(
//           decoration: BoxDecoration(
//             color: Color(0xff881736),
//             borderRadius: BorderRadius.circular(30),
//           ),
//           child: ListTile(
//             title: Text(
//               'More',
//               style: TextStyle(color: Colors.white),
//             ),
//             trailing: Icon(
//               Icons.arrow_forward,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:revive/Models/bookingModal.dart';
import 'package:revive/Services/bookingServices.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ThDashboard extends StatelessWidget {
  final BookingService _bookingService = BookingService();
  final User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            if (currentUser != null) _buildAppointmentsList(context, currentUser!.uid),
            _buildActivitiesSection(context),
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
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff881736)),
      ),
    );
  }

  Widget _buildAppointmentsList(BuildContext context, String therapistId) {
    return StreamBuilder<List<Booking>>(
      stream: _bookingService.fetchBookingForTherapist(therapistId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error fetching appointments: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No appointments found'));
        } else {
          List<Booking> appointments = snapshot.data!;
          DateTime now = DateTime.now();
          List<Booking> upcomingAppointments = appointments.where((appointment) {
            return appointment.day.isAfter(now) ||
                (appointment.day.isAtSameMomentAs(now) &&
                    appointment.endTime.isAfter(now));
          }).toList();

          List<Booking> pastAppointments = appointments.where((appointment) {
            return appointment.day.isBefore(now) ||
                (appointment.day.isAtSameMomentAs(now) &&
                    appointment.endTime.isBefore(now));
          }).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppointmentsSection('Upcoming Appointments', upcomingAppointments, therapistId),
              _buildAppointmentsSection('Past Appointments', pastAppointments, therapistId),
            ],
          );
        }
      },
    );
  }

  Widget _buildAppointmentsSection(String title, List<Booking> appointments, String therapistId) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff881736)),
          ),
        ),
        appointments.isEmpty
            ? Center(
                child: Text(
                  'No $title',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  Booking appointment = appointments[index];
                  String formattedDay = DateFormat.yMMMd().format(appointment.day);
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text(appointment.userName ?? 'Unknown User'),
                        subtitle: Text(' ${appointment.appointmentType}, ${appointment.timeSlot}, $formattedDay'),
                        trailing: IconButton(
                          icon: Icon(Icons.cancel),
                          onPressed: () => _confirmCancellation(context, therapistId, appointment.id, appointment.userId),
                        ),
                        onTap: () async {
                          String? userName = await _bookingService.fetchUserName(appointment.userId);
                          String? email = await _bookingService.fetchUserEmail(appointment.userId);
                          String? phoneNumber = await _bookingService.fetchUserPhoneNumber(appointment.userId);
                          _showAppointmentDetailsDialog(context, appointment, userName, email, phoneNumber);
                        },
                      ),
                    ),
                  );
                },
              ),
      ],
    );
  }

  void _showAppointmentDetailsDialog(BuildContext context, Booking appointment, String? userName, String? email, String? phoneNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Appointment Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${userName ?? 'Unknown'}'),
              Text('Email: ${email ?? 'N/A'}'),
              Text('Phone: ${phoneNumber ?? 'N/A'}'),
              SizedBox(height: 16),
              Text('Appointment Type: ${appointment.appointmentType}'),
              Text('Time Slot: ${appointment.timeSlot}'),
              Text('Date: ${DateFormat.yMMMd().format(appointment.day)}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _confirmCancellation(BuildContext context, String therapistId, String bookingId, String userId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cancel Appointment'),
          content: Text('Are you sure you want to cancel this appointment?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                _bookingService.deleteBookings(userId, bookingId, therapistId).then((_) {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Appointment cancelled successfully'), backgroundColor: Color(0xff881736)),
                  );
                }).catchError((error) {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to cancel appointment: $error')),
                  );
                });
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildActivitiesSection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/yourActivity');
      },
      child: Container(
        decoration: BoxDecoration(color: Color(0xff881736),
          borderRadius: BorderRadius.circular(30),
        ),
        child: ListTile(
          title: Text(
            'More',
            style: TextStyle(color: Colors.white),
          ),
          trailing: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:revive/Models/bookingModal.dart';
// import 'package:revive/Services/bookingServices.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class ThDashboard extends StatelessWidget {
//   final BookingService _bookingService = BookingService();
//   final User? currentUser = FirebaseAuth.instance.currentUser;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold( 
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             _buildSectionTitle('Your Appointments'),
//             if (currentUser != null) _buildAppointmentsList(context, currentUser!.uid),
//             _buildActivitiesSection(context),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Text(
//         title,
//         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff881736)),
//       ),
//     );
//   }

//   Widget _buildAppointmentsList(BuildContext context, String therapistId) {
//     return StreamBuilder<List<Booking>>(
//       stream: _bookingService.fetchBookingForTherapist(therapistId),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error fetching appointments: ${snapshot.error}'));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return Center(child: Text('No appointments found'));
//         } else {
//           List<Booking> appointments = snapshot.data!;
//           return ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: appointments.length,
//             itemBuilder: (context, index) {
//               Booking appointment = appointments[index];
//               String formattedDay = DateFormat.yMMMd().format(appointment.day);
//               return Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: Card(
//                   elevation: 5,
//                   child: ListTile(
//                     title: Text(appointment.userName ?? 'Unknown User'),
//                     subtitle: Text(' ${appointment.appointmentType}, ${appointment.timeSlot}, $formattedDay'),
//                     trailing: IconButton(
//                       icon: Icon(Icons.cancel),
//                       onPressed: () => _confirmCancellation(context, therapistId, appointment.id, appointment.userId),
//                     ),
//                     onTap: () async {
//                       String? userName = await _bookingService.fetchUserName(appointment.userId);
//                       String? email = await _bookingService.fetchUserEmail(appointment.userId);
//                       String? phoneNumber = await _bookingService.fetchUserPhoneNumber(appointment.userId);
//                       _showAppointmentDetailsDialog(context, appointment, userName, email, phoneNumber);
//                     },
//                   ),
//                 ),
//               );
//             },
//           );
//         }
//       },
//     );
//   }

//   void _showAppointmentDetailsDialog(BuildContext context, Booking appointment, String? userName, String? email, String? phoneNumber) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Appointment Details'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Name: ${userName ?? 'Unknown'}'),
//               Text('Email: ${email ?? 'N/A'}'),
//               Text('Phone: ${phoneNumber ?? 'N/A'}'),
//               SizedBox(height: 16),
//               Text('Appointment Type: ${appointment.appointmentType}'),
//               Text('Time Slot: ${appointment.timeSlot}'),
//               Text('Date: ${DateFormat.yMMMd().format(appointment.day)}'),
//             ],
//           ),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _confirmCancellation(BuildContext context, String therapistId, String bookingId, String userId) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Cancel Appointment'),
//           content: Text('Are you sure you want to cancel this appointment?'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: Text('No'),
//             ),
//             TextButton(
//               onPressed: () {
//                 _bookingService.deleteBookings(userId, bookingId, therapistId).then((_) {
//                   Navigator.of(context).pop();
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Appointment cancelled successfully'), backgroundColor: Color(0xff881736)),
//                   );
//                 }).catchError((error) {
//                   Navigator.of(context).pop();
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Failed to cancel appointment: $error')),
//                   );
//                 });
//               },
//               child: Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildActivitiesSection(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.pushNamed(context, '/yourActivity');
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10.0),
//         child: Container(
//           decoration: BoxDecoration(color: Color(0xff881736),
//             borderRadius: BorderRadius.circular(30),
//           ),
//           child: ListTile(
//             title: Text(
//               'More',
//               style: TextStyle(color: Colors.white),
//             ),
//             trailing: Icon(
//               Icons.arrow_forward,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
