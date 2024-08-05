
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:revive/Models/bookingModal.dart';
// import 'package:revive/Services/bookingServices.dart';
// import 'package:revive/Screens/User/navbar.dart';
// import 'package:revive/Services/authprovider.dart';

// class UserDashboard extends StatefulWidget {
//   @override
//   _UserDashboardState createState() => _UserDashboardState();
// }

// class _UserDashboardState extends State<UserDashboard> {
//   final BookingService _bookingService = BookingService();
//   List<Booking> _appointments = [];
//   int _selectedIndex = 3;
//   late final AuthProvider authProvider;

//   @override
//   void initState() {
//     super.initState();
//     authProvider = Provider.of<AuthProvider>(context, listen: false);
//     _fetchBooking();
//   }

//   Future<void> _fetchBooking() async {
//     _appointments = await _bookingService.fetchMyBooking(authProvider.uid!);
//     setState(() {});
//   }
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(kToolbarHeight),
//         child: AppBar(
//           title: Text(
//             'Your Dashboard',
//             style: TextStyle(color: Colors.white),
//           ),
//           backgroundColor: Colors.transparent,
//           automaticallyImplyLeading: false,
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xff881736), Color(0xff281537)],
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             Visibility(
//               visible: _appointments.isNotEmpty,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10.0),
//                 child: Text(
//                   'Long press on an appointment to cancel it.',
//                   style: TextStyle(fontSize: 12, color: Colors.grey),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: _appointments.isEmpty
//                   ? Center(
//                       child: Text(
//                         'No Appointments Scheduled',
//                         style: TextStyle(fontSize: 16, color: Colors.grey),
//                       ),
//                     )
//                   : ListView.builder(
//                       itemCount: _appointments.length,
//                       itemBuilder: (context, index) {
//                         return _buildAppointmentTile(
//                             context, _appointments[index]);
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar:
//           NavBar(selectedIndex: _selectedIndex, userRole: UserRole.User),
//     );
//   }

//   Widget _buildAppointmentTile(BuildContext context, Booking appointment) {
//     String formattedDate = DateFormat('yyyy-MM-dd').format(appointment.day);

//     return GestureDetector(
//       onTap: () => _showJoinSessionDialog(context, appointment),
//       onLongPress: () => _showDeleteConfirmationDialog(context, appointment),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Card(
//           elevation: 5,
//           child: ListTile(
//             title: Text(
//               appointment.therapistName,
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             trailing: Text(
//               '$formattedDate, ${appointment.timeSlot}',
//               style: TextStyle(fontSize: 16),
//             ),
//             subtitle: Text(appointment.appointmentType),
//           ),
//         ),
//       ),
//     );
//   }

//   void _showJoinSessionDialog(BuildContext context, Booking appointment) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(
//             "Appointment Details",
//             style: TextStyle(color: Color(0xff881736)),
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Therapist: ${appointment.therapistName}",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               Text("Date: ${DateFormat('yyyy-MM-dd').format(appointment.day)}"),
//               Text("Time: ${appointment.timeSlot}"),
//               Text("Type: ${appointment.appointmentType}"),
//             ],
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text("Close", style: TextStyle(color: Color(0xff881736))),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             // TextButton(
//             //   child: Text("Join", style: TextStyle(color: Color(0xff881736))),
//             //   onPressed: () {
//             //     // Add your join session functionality here
//             //     Navigator.of(context).pop();
//             //   },
//             // ),
//           ],
//         );
//       },
//     );
//   }

//  void _showDeleteConfirmationDialog(
//       BuildContext context, Booking appointment) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Cancel Appointment"),
//           content: Text("Are you sure you want to cancel this appointment?"),
//           actions: <Widget>[
//             TextButton(
//               child: Text("Cancel"),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: Text("Cancel Appointment"),
//               onPressed: (){
//                  _delete(appointment);
//               Navigator.of(context).pop();}
//             ),
//           ],
//         );
//       },
//     );
//   }

// void _delete(Booking booking) async {
//   final authProvider = Provider.of<AuthProvider>(context, listen: false);
//   try {
//     print('User ID: ${authProvider.uid}');
//     print('Booking ID: ${booking.id}');
//     await _bookingService.deleteBooking(authProvider.uid!, booking.id.trim());
//      await FirebaseFirestore.instance
//         .collection('therapist')
//         .doc(booking.therapistId)
//         .collection('bookings')
//         .doc(booking.id)
//         .delete();
//     setState(() {
//       _appointments.remove(booking);
//     });
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Booking Canceled successfully.'),
//         backgroundColor:Color(0xff881736),
//       ),
//     );
//   } catch (e) {
//     print('Error deleting booking: $e');
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Error deleting booking.'),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }
// }



// }







import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:revive/Models/bookingModal.dart';
import 'package:revive/Services/bookingServices.dart';
import 'package:revive/Screens/User/navbar.dart';
import 'package:revive/Services/authprovider.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  final BookingService _bookingService = BookingService();
  List<Booking> _appointments = [];
  int _selectedIndex = 3;
  late final AuthProvider authProvider;

  @override
  void initState() {
    super.initState();
    authProvider = Provider.of<AuthProvider>(context, listen: false);
    _fetchBooking();
  }

  Future<void> _fetchBooking() async {
    _appointments = await _bookingService.fetchMyBooking(authProvider.uid!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    List<Booking> upcomingAppointments = _appointments.where((appointment) {
      return appointment.day.isAfter(now) ||
          (appointment.day.isAtSameMomentAs(now) &&
              appointment.endTime.isAfter(now));
    }).toList();

    List<Booking> pastAppointments = _appointments.where((appointment) {
      return appointment.day.isBefore(now) ||
          (appointment.day.isAtSameMomentAs(now) &&
              appointment.endTime.isBefore(now));
    }).toList();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: Text(
            'Your Dashboard',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff881736), Color(0xff281537)],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: _appointments.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Long press on an appointment to cancel it.',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ),
            _buildAppointmentsSection("Upcoming Appointments", upcomingAppointments),
            _buildAppointmentsSection("Past Appointments", pastAppointments),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(selectedIndex: _selectedIndex, userRole: UserRole.User),
    );
  }

  Widget _buildAppointmentsSection(String title, List<Booking> appointments) {
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
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  return _buildAppointmentTile(context, appointments[index]);
                },
              ),
      ],
    );
  }

  Widget _buildAppointmentTile(BuildContext context, Booking appointment) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(appointment.day);

    return GestureDetector(
      onTap: () => _showJoinSessionDialog(context, appointment),
      onLongPress: () => _showDeleteConfirmationDialog(context, appointment),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5,
          child: ListTile(
            title: Text(
              appointment.therapistName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              '$formattedDate, ${appointment.timeSlot}',
              style: TextStyle(fontSize: 16),
            ),
            subtitle: Text(appointment.appointmentType),
          ),
        ),
      ),
    );
  }

  void _showJoinSessionDialog(BuildContext context, Booking appointment) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Appointment Details",
            style: TextStyle(color: Color(0xff881736)),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Therapist: ${appointment.therapistName}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("Date: ${DateFormat('yyyy-MM-dd').format(appointment.day)}"),
              Text("Time: ${appointment.timeSlot}"),
              Text("Type: ${appointment.appointmentType}"),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Close", style: TextStyle(color: Color(0xff881736))),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, Booking appointment) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Cancel Appointment"),
          content: Text("Are you sure you want to cancel this appointment?"),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Cancel Appointment"),
              onPressed: () {
                _delete(appointment);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _delete(Booking booking) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    try {
      await _bookingService.deleteBookings(authProvider.uid!, booking.id.trim(), booking.therapistId);
      setState(() {
        _appointments.remove(booking);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Appointment cancelled successfully'),
          backgroundColor: Color(0xff881736),
        ),
      );
    } catch (e) {
      print('Error deleting booking: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error deleting booking.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:revive/Models/bookingModal.dart';
// import 'package:revive/Services/bookingServices.dart';
// import 'package:revive/Screens/User/navbar.dart';
// import 'package:revive/Services/authprovider.dart';

// class UserDashboard extends StatefulWidget {
//   @override
//   _UserDashboardState createState() => _UserDashboardState();
// }

// class _UserDashboardState extends State<UserDashboard> {
//   final BookingService _bookingService = BookingService();
//   List<Booking> _appointments = [];
//   int _selectedIndex = 3;
//   late final AuthProvider authProvider;

//   @override
//   void initState() {
//     super.initState();
//     authProvider = Provider.of<AuthProvider>(context, listen: false);
//     _fetchBooking();
//   }

//   Future<void> _fetchBooking() async {
//     _appointments = await _bookingService.fetchMyBooking(authProvider.uid!);
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     DateTime now = DateTime.now();
//     List<Booking> upcomingAppointments = _appointments.where((appointment) {
//       return appointment.day.isAfter(now) ||
//           (appointment.day.isAtSameMomentAs(now) &&
//               appointment.endTime.isAfter(now));
//     }).toList();

//     List<Booking> pastAppointments = _appointments.where((appointment) {
//       return appointment.day.isBefore(now) ||
//           (appointment.day.isAtSameMomentAs(now) &&
//               appointment.endTime.isBefore(now));
//     }).toList();

//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(kToolbarHeight),
//         child: AppBar(
//           title: Text(
//             'Your Dashboard',
//             style: TextStyle(color: Colors.white),
//           ),
//           backgroundColor: Colors.transparent,
//           automaticallyImplyLeading: false,
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xff881736), Color(0xff281537)],
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Visibility(
//               visible: _appointments.isNotEmpty,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10.0),
//                 child: Text(
//                   'Long press on an appointment to cancel it.',
//                   style: TextStyle(fontSize: 12, color: Colors.grey),
//                 ),
//               ),
//             ),
//             _buildAppointmentsSection("Upcoming Appointments", upcomingAppointments),
//             _buildAppointmentsSection("Past Appointments", pastAppointments),
//           ],
//         ),
//       ),
//       bottomNavigationBar: NavBar(selectedIndex: _selectedIndex, userRole: UserRole.User),
//     );
//   }

//   Widget _buildAppointmentsSection(String title, List<Booking> appointments) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10.0),
//           child: Text(
//             title,
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff881736)),
//           ),
//         ),
//         appointments.isEmpty
//             ? Center(
//                 child: Text(
//                   'No $title',
//                   style: TextStyle(fontSize: 16, color: Colors.grey),
//                 ),
//               )
//             : ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: appointments.length,
//                 itemBuilder: (context, index) {
//                   return _buildAppointmentTile(context, appointments[index]);
//                 },
//               ),
//       ],
//     );
//   }

//   Widget _buildAppointmentTile(BuildContext context, Booking appointment) {
//     String formattedDate = DateFormat('yyyy-MM-dd').format(appointment.day);

//     return GestureDetector(
//       onTap: () => _showJoinSessionDialog(context, appointment),
//       onLongPress: () => _showDeleteConfirmationDialog(context, appointment),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Card(
//           elevation: 5,
//           child: ListTile(
//             title: Text(
//               appointment.therapistName,
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             trailing: Text(
//               '$formattedDate, ${appointment.timeSlot}',
//               style: TextStyle(fontSize: 16),
//             ),
//             subtitle: Text(appointment.appointmentType),
//           ),
//         ),
//       ),
//     );
//   }

//   void _showJoinSessionDialog(BuildContext context, Booking appointment) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(
//             "Appointment Details",
//             style: TextStyle(color: Color(0xff881736)),
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Therapist: ${appointment.therapistName}",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               Text("Date: ${DateFormat('yyyy-MM-dd').format(appointment.day)}"),
//               Text("Time: ${appointment.timeSlot}"),
//               Text("Type: ${appointment.appointmentType}"),
//             ],
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text("Close", style: TextStyle(color: Color(0xff881736))),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showDeleteConfirmationDialog(BuildContext context, Booking appointment) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Cancel Appointment"),
//           content: Text("Are you sure you want to cancel this appointment?"),
//           actions: <Widget>[
//             TextButton(
//               child: Text("Cancel"),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: Text("Cancel Appointment"),
//               onPressed: () {
//                 _delete(appointment);
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _delete(Booking booking) async {
//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//     try {
//       print('User ID: ${authProvider.uid}');
//       print('Booking ID: ${booking.id}');
//       await _bookingService.deleteBooking(authProvider.uid!, booking.id.trim());
//       await FirebaseFirestore.instance
//           .collection('therapist')
//           .doc(booking.therapistId)
//           .collection('bookings')
//           .doc(booking.id)
//           .delete();
//       setState(() {
//         _appointments.remove(booking);
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Appointment cancelled successfully'),
//           backgroundColor: Color(0xff881736),
//         ),
//       );
//     } catch (e) {
//       print('Error deleting booking: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error deleting booking.'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }
// }
