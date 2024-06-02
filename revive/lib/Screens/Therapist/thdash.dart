// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
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
//               return ListTile(
//                 //title: Text(appointment.userName),
//                 subtitle: Text(' ${appointment.appointmentType}, ${appointment.timeSlot}'),
//                 trailing: Icon(Icons.arrow_forward),
//                 onTap: () {
//                   Navigator.pushNamed(context, '/appointmentDetail', arguments: appointment);
//                 },
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }


//   Widget _buildActivitiesSection(BuildContext context) {
//   return GestureDetector(
//     onTap: () {
//      Navigator.pushNamed(context, '/yourActivity');
//     },
//     child: Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Color(0xff881736),
//           borderRadius: BorderRadius.circular(30)
//         ),
//         child: ListTile(
//           title: Text(
//             'More',
//             style: TextStyle(color: Colors.white),
//           ),
//           trailing: Icon(
//             Icons.arrow_forward,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     ),
//   );
// }

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
//                     subtitle: Text(' ${appointment.appointmentType}, ${appointment.timeSlot},$formattedDay'),
//                     trailing: Icon(Icons.arrow_forward),
//                     onTap: () {
//                       Navigator.pushNamed(context, '/appointmentDetail', arguments: appointment);
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
import 'package:cloud_firestore/cloud_firestore.dart';
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
            _buildSectionTitle('Your Appointments'),
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

  // Widget _buildAppointmentsList(BuildContext context, String therapistId) {
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
  //                   trailing: Row(
  //                     mainAxisSize: MainAxisSize.min,
  //                     children: [
  //                       IconButton(
  //                         icon: Icon(Icons.cancel),
  //                         onPressed: () => _confirmCancellation(context, therapistId, appointment.id),
  //                       ),
  //                       Icon(Icons.arrow_forward),
  //                     ],
  //                   ),
  //                   onTap: () {
  //                     Navigator.pushNamed(context, '/appointmentDetail', arguments: appointment);
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
        return ListView.builder(
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
                          onPressed: () => _confirmCancellation(context, therapistId, appointment.id),
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
        );
      }
    },
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
            Text('Username: ${userName ?? 'Unknown'}'),
            Text('Email: ${email ?? 'N/A'}'),
            Text('Phone Number: ${phoneNumber ?? 'N/A'}'),
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


  void _confirmCancellation(BuildContext context, String therapistId, String bookingId) {
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
                _bookingService.deleteBookings(therapistId, bookingId).then((_) {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Appointment cancelled successfully',),backgroundColor: Color(0xff881736),),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff881736),
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
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:intl/intl.dart';
// import 'package:revive/Models/bookingModal.dart';
// import 'package:revive/Services/bookingServices.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:contacts_service/contacts_service.dart';
// import 'package:url_launcher/url_launcher.dart';

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
//                     trailing: _buildAppointmentActions(context, appointment),
//                     onTap: () {
//                       Navigator.pushNamed(context, '/appointmentDetail', arguments: appointment);
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
//                     SnackBar(
//                       content: Text('Appointment cancelled successfully'),
//                       backgroundColor: Color(0xff881736),
//                     ),
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

//   Widget _buildAppointmentActions(BuildContext context, Booking appointment) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         IconButton(
//           icon: Icon(Icons.videocam),
//           onPressed: () => _openContactList(context, 'video'),
//         ),
//         IconButton(
//           icon: Icon(Icons.chat),
//           onPressed: () => _openContactList(context, 'chat'),
//         ),
//         IconButton(
//           icon: Icon(Icons.call),
//           onPressed: () => _openContactList(context, 'call'),
//         ),
//       ],
//     );
//   }

//   Future<void> _openContactList(BuildContext context, String action) async {
//     await _requestContactsPermission();
//     Iterable<Contact> contacts = await _fetchContacts();
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Select Contact'),
//           content: Container(
//             width: double.maxFinite,
//             height: 400,
//             child: ListView.builder(
//               itemCount: contacts.length,
//               itemBuilder: (context, index) {
//                 Contact contact = contacts.elementAt(index);
//                 return ListTile(
//                   title: Text(contact.displayName ?? 'No Name'),
//                   subtitle: Text(contact.phones!.isNotEmpty ? contact.phones!.first.value! : 'No Phone'),
//                   onTap: () {
//                     Navigator.of(context).pop();
//                     if (action == 'video' || action == 'chat') {
//                       _launchWhatsApp(contact, action);
//                     } else if (action == 'call') {
//                       _initiatePhoneCall(contact);
//                     }
//                   },
//                 );
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Future<void> _requestContactsPermission() async {
//     if (await Permission.contacts.request().isGranted) {
//       return;
//     }
//     throw 'Permission denied';
//   }

//   Future<Iterable<Contact>> _fetchContacts() async {
//     return await ContactsService.getContacts(withThumbnails: false);
//   }

//  void _launchWhatsApp(Contact contact, String action) async {
//   String phone = contact.phones!.isNotEmpty ? contact.phones!.first.value! : '';
//   Uri url = Uri.parse('https://wa.me/$phone');

//   if (action == 'video') {
//     url = Uri.parse('whatsapp://send?phone=$phone&text=Start%20video%20call');
//   } else if (action == 'chat') {
//     url = Uri.parse('whatsapp://send?phone=$phone');
//   }

//   try {
//     if (await canLaunchUrl(url)) {
//       print('Launching URL: $url'); // Add debug print
//       await launchUrl(url, mode: LaunchMode.externalApplication);
//       print('URL launched successfully'); // Add debug print
//     } else {
//       throw 'Could not launch $url';
//     }
//   } catch (e) {
//     print('Error launching WhatsApp: $e');
//     // Provide feedback to the user about the error, if necessary
//   }
// }

// void _initiatePhoneCall(Contact contact) async {
//   String phone = contact.phones!.isNotEmpty ? contact.phones!.first.value! : '';
//   Uri url = Uri.parse('tel:$phone');

//   try {
//     if (await canLaunchUrl(url)) {
//       print('Launching URL: $url'); // Add debug print
//       await launchUrl(url, mode: LaunchMode.externalApplication);
//       print('URL launched successfully'); // Add debug print
//     } else {
//       throw 'Could not launch $url';
//     }
//   } catch (e) {
//     print('Error initiating phone call: $e');
//     // Provide feedback to the user about the error, if necessary
//   }
// }

// }
