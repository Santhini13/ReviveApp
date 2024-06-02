// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:revive/Models/UserModal.dart';
// import 'package:revive/Models/therapistModal.dart';
// import 'package:revive/Models/bookingModal.dart';
// import 'package:revive/Screens/User/feedbackform.dart';
// import 'package:revive/Services/bookingServices.dart';
// import 'package:calendar_timeline/calendar_timeline.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class TherapistDetailScreen extends StatefulWidget {
//   final Therapist therapist;
//   final List<String> timeSlots;
//   final List<String> appointmentTypes;
//   final BookingService _bookingService = BookingService();

//   TherapistDetailScreen({
//     required this.therapist,
//     required this.timeSlots,
//     required this.appointmentTypes,
//   });

//   @override
//   _TherapistDetailScreenState createState() => _TherapistDetailScreenState();
// }

// class _TherapistDetailScreenState extends State<TherapistDetailScreen> {
//   DateTime? selectedDate;
//   String? selectedTimeSlot;
//   String? selectedAppointmentType;
//   bool isFavorite = false;
//   late Therapist therapist;
//   late Users users;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(widget.therapist.name, style: TextStyle(color: Colors.white)),
//         ),
//         automaticallyImplyLeading: false,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xff881736), Color(0xff281537)],
//             ),
//           ),
//         ),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.feedback, color: Colors.white), // Icon for feedback form
//             onPressed: () {
//               // Navigate to the feedback form screen and pass the therapist object
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => FeedbackFormScreen(therapist: widget.therapist),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 20),
//                 SizedBox(width: 40),
//                 _buildProfileItem(Icons.medical_services, widget.therapist.specialization),
//                 _buildProfileItem(Icons.school, widget.therapist.qualification),
//                 _buildProfileItem(Icons.work, widget.therapist.experience),
//                 SizedBox(height: 20.0),
//                 Text(
//                   'Description',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xff881736),
//                   ),
//                 ),
//                 Divider(color: Colors.grey, thickness: 2),
//                 Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   elevation: 4,
//                   margin: EdgeInsets.symmetric(vertical: 10),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Text(
//                       widget.therapist.description,
//                       textAlign: TextAlign.justify,
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 buildSectionTitle('Choose Date'),
//                 Divider(color: Colors.grey, thickness: 2),
//                 SizedBox(height: 10),
//                 buildCalendarTimeline(),
//                 SizedBox(height: 20),
//                 buildSectionTitle('Time Slots'),
//                 Divider(color: Colors.grey, thickness: 2),
//                 SizedBox(height: 10),
//                 buildTimeSlots(),
//                 SizedBox(height: 20),
//                 buildSectionTitle('Appointment Types'),
//                 Divider(color: Colors.grey, thickness: 2),
//                 SizedBox(height: 10),
//                 buildAppointmentTypes(),
//                 SizedBox(height: 20),
//                 if (selectedDate != null && selectedTimeSlot != null && selectedAppointmentType != null)
//                   Center(
//                     child: ElevatedButton(
//                       onPressed: () => _showConfirmationDialog(context, widget.therapist),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color(0xff881736),
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//                       ),
//                       child: Text('Book Now', style: TextStyle(fontSize: 16)),
//                     ),
//                   ),
//                 SizedBox(height: 20),
//                 buildSectionTitle('Feedback'),
//                 Divider(color: Colors.grey, thickness: 2),
//                 SizedBox(height: 10),
//                 StreamBuilder<QuerySnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection('therapist')
//                       .doc(widget.therapist.id)
//                       .collection('feedbacks')
//                       .orderBy('timestamp', descending: true)
//                       .snapshots(),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return Center(child: CircularProgressIndicator());
//                     } else if (snapshot.hasError) {
//                       return Center(child: Text('Error: ${snapshot.error}'));
//                     } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                       return Center(child: Text('No feedback available.'));
//                     } else {
//                       return ListView.builder(
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         itemCount: snapshot.data!.docs.length,
//                         itemBuilder: (context, index) {
//                           var feedback = snapshot.data!.docs[index];
//                           return Card(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             elevation: 4,
//                             margin: EdgeInsets.symmetric(vertical: 10),
//                             child: Padding(
//                               padding: const EdgeInsets.all(16.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     feedback['feedback'],
//                                     style: TextStyle(fontSize: 16),
//                                   ),
//                                   SizedBox(height: 10),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         'Rating: ${feedback['rating']}',
//                                         style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                                       ),
//                                       Text(
//                                         DateFormat('dd MMM yyyy, hh:mm a').format((feedback['timestamp'] as Timestamp).toDate()),
//                                         style: TextStyle(fontSize: 12, color: Colors.grey),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       );
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildProfileItem(IconData icon, String title) {
//     return ListTile(
//       contentPadding: EdgeInsets.zero,
//       leading: Icon(icon, color: Color(0xff881736)),
//       title: Text(
//         title,
//         style: TextStyle(
//           color: Color(0xff281537),
//         ),
//       ),
//     );
//   }

//   Widget buildSectionTitle(String title) {
//     return Text(
//       title,
//       style: TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.bold,
//         color: Color(0xff881736),
//       ),
//     );
//   }

//   Widget buildCalendarTimeline() {
//     return CalendarTimeline(
//       initialDate: selectedDate ?? DateTime.now(),
//       firstDate: DateTime(2020, 1, 1),
//       lastDate: DateTime(2025, 12, 31),
//       onDateSelected: (date) {
//         setState(() {
//           selectedDate = DateTime(date.year, date.month, date.day);
//         });
//       },
//       leftMargin: 20,
//       monthColor: Colors.grey,
//       dayColor: Color(0xff281537).withOpacity(0.9),
//       activeDayColor: Colors.white,
//       activeBackgroundDayColor: Color(0xff881736),
//       dotsColor: Colors.white,
//       selectableDayPredicate: (date) => date.isAfter(DateTime.now().subtract(Duration(days: 1))),
//     );
//   }

//   Widget buildTimeSlots() {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: widget.timeSlots.map((timeSlot) {
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedTimeSlot = timeSlot;
//               });
//             },
//             child: Container(
//               height: 40,
//               width: 90,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   width: 2,
//                   color: selectedTimeSlot == timeSlot ? Color(0xff881736) : Colors.grey,
//                 ),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               padding: EdgeInsets.all(8),
//               margin: EdgeInsets.only(right: 8),
//               child: Center(child: Text(timeSlot)),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }

//   Widget buildAppointmentTypes() {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: widget.appointmentTypes.map((appointmentType) {
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedAppointmentType = appointmentType;
//               });
//             },
//             child: Container(
//               width: 120,
//               height: 40,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   width: 2,
//                   color: selectedAppointmentType == appointmentType ? Color(0xff881736) : Colors.grey,
//                 ),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               padding: EdgeInsets.all(8),
//               margin: EdgeInsets.only(right: 8),
//               child: Center(child: Text(appointmentType)),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }

//   // void _showConfirmationDialog(BuildContext context, Therapist therapist) {
//   //   if (selectedDate != null && selectedTimeSlot != null && selectedAppointmentType != null) {
//   //     showDialog(
//   //       context: context,
//   //       builder: (BuildContext context) {
//   //         return AlertDialog(
//   //           title: Text("Book Now"),
//   //           content: Text("Confirm Your Appointment!"),
//   //           actions: <Widget>[
//   //             TextButton(
//   //               child: Text("OK"),
//   //               onPressed: () {
//   //                 Navigator.of(context).pop();
//   //                 ScaffoldMessenger.of(context).showSnackBar(
//   //     SnackBar(
//   //       content: Text('Booking Successful!'),
//   //       backgroundColor: Color(0xff881736),
//   //     ),
//   //   );
//   //               },
//   //             ),
//   //           ],
//   //         );
//   //       },
//   //     );

//   //     _performBooking(context, therapist);
//   //   } else {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(
//   //         content: Text('Please select date, time slot, and appointment type.'),
//   //         backgroundColor: Colors.red,
//   //       ),
//   //     );
//   //   }
//   // }


// Future<void> _showConfirmationDialog(BuildContext context, Therapist therapist) async {
//   if (selectedDate != null && selectedTimeSlot != null && selectedAppointmentType != null) {
//     // Perform a check if the selected timeslot for the selected date is available
//     // You can do this by querying the database to see if any booking exists for the selected date and timeslot
//     BookingService bookingService = BookingService();
//     bool isSlotAvailable = await bookingService.isTimeSlotAvailable(selectedDate!, selectedTimeSlot!);
    
//     if (isSlotAvailable) {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Book Now"),
//             content: Text("Confirm Your Appointment!"),
//             actions: <Widget>[
//               TextButton(
//                 child: Text("OK"),
//                 onPressed: () {
//                   Navigator.pop(context);
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text('Booking Successful!'),
//                       backgroundColor: Color(0xff881736),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           );
//         },
//       );

//       _performBooking(context, therapist);
//     } else {
//       // Show a message indicating that the selected timeslot is not available
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('The selected timeslot is not available. Please choose another one.'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Please select date, time slot, and appointment type.'),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }
// }

//   void _performBooking(BuildContext context, Therapist therapist) async {
//     final user = FirebaseAuth.instance.currentUser;
//     String userId = user!.uid;
//     String therapistId = therapist.id; // replace with actual therapist id
//     Booking booking = Booking(
//       therapistName: therapist.name,
//       userName: '',
//       userId: userId,
//       therapistId: therapistId,
//       day: selectedDate!,
//       status: 1,
//       timeSlot: selectedTimeSlot!,
//       appointmentType: selectedAppointmentType!,
//       id: '',
//     );

//     BookingService bookingService = BookingService();
//     try {
//       await bookingService.registerBooking(userId, booking);
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error registering booking: $e'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:revive/Models/UserModal.dart';
import 'package:revive/Models/therapistModal.dart';
import 'package:revive/Models/bookingModal.dart';
import 'package:revive/Screens/User/feedbackform.dart';
import 'package:revive/Services/bookingServices.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TherapistDetailScreen extends StatefulWidget {
  final Therapist therapist;
  final List<String> timeSlots;
  final List<String> appointmentTypes;
  final BookingService _bookingService = BookingService();

  TherapistDetailScreen({
    required this.therapist,
    required this.timeSlots,
    required this.appointmentTypes,
  });

  @override
  _TherapistDetailScreenState createState() => _TherapistDetailScreenState();
}

class _TherapistDetailScreenState extends State<TherapistDetailScreen> {
  DateTime? selectedDate;
  String? selectedTimeSlot;
  String? selectedAppointmentType;
  bool isFavorite = false;
  late Therapist therapist;
  late Users users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.therapist.name, style: TextStyle(color: Colors.white)),
        ),
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff881736), Color(0xff281537)],
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.feedback, color: Colors.white), // Icon for feedback form
            onPressed: () {
              // Navigate to the feedback form screen and pass the therapist object
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FeedbackFormScreen(therapist: widget.therapist),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                SizedBox(width: 40),
                _buildProfileItem(Icons.medical_services, widget.therapist.specialization),
                _buildProfileItem(Icons.school, widget.therapist.qualification),
                _buildProfileItem(Icons.work, widget.therapist.experience),
                SizedBox(height: 20.0),
                Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff881736),
                  ),
                ),
                Divider(color: Colors.grey, thickness: 2),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      widget.therapist.description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                buildSectionTitle('Choose Date'),
                Divider(color: Colors.grey, thickness: 2),
                SizedBox(height: 10),
                buildCalendarTimeline(),
                SizedBox(height: 20),
                buildSectionTitle('Time Slots'),
                Divider(color: Colors.grey, thickness: 2),
                SizedBox(height: 10),
                buildTimeSlots(),
                SizedBox(height: 20),
                buildSectionTitle('Appointment Types'),
                Divider(color: Colors.grey, thickness: 2),
                SizedBox(height: 10),
                buildAppointmentTypes(),
                SizedBox(height: 20),
                if (selectedDate != null && selectedTimeSlot != null && selectedAppointmentType != null)
                  Center(
                    child: ElevatedButton(
                      onPressed: () => _showConfirmationDialog(context, widget.therapist),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff881736),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      ),
                      child: Text('Book Now', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                SizedBox(height: 20),
                buildSectionTitle('Feedback'),
                Divider(color: Colors.grey, thickness: 2),
                SizedBox(height: 10),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('therapist')
                      .doc(widget.therapist.id)
                      .collection('feedbacks')
                      .orderBy('timestamp', descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('No feedback available.'));
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var feedback = snapshot.data!.docs[index];
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 4,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    feedback['feedback'],
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Rating: ${feedback['rating']}',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        DateFormat('dd MMM yyyy, hh:mm a').format((feedback['timestamp'] as Timestamp).toDate()),
                                        style: TextStyle(fontSize: 12, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Color(0xff881736)),
      title: Text(
        title,
        style: TextStyle(
          color: Color(0xff281537),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xff881736),
      ),
    );
  }

  Widget buildCalendarTimeline() {
    return CalendarTimeline(
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020, 1, 1),
      lastDate: DateTime(2025, 12, 31),
      onDateSelected: (date) {
        setState(() {
          selectedDate = DateTime(date.year, date.month, date.day);
          selectedTimeSlot = null; // Reset selected time slot when date changes
        });
      },
      leftMargin: 20,
      monthColor: Colors.grey,
      dayColor: Color(0xff281537).withOpacity(0.9),
      activeDayColor: Colors.white,
      activeBackgroundDayColor: Color(0xff881736),
      dotsColor: Colors.white,
      selectableDayPredicate: (date) => date.isAfter(DateTime.now().subtract(Duration(days: 1))),
    );
  }

  Widget buildTimeSlots() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.timeSlots.map((timeSlot) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedTimeSlot = timeSlot;
              });
            },
            child: Container(
              height: 40,
              width: 90,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: selectedTimeSlot == timeSlot ? Color(0xff881736) : Colors.grey,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(right: 8),
              child: Center(child: Text(timeSlot)),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget buildAppointmentTypes() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.appointmentTypes.map((appointmentType) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedAppointmentType = appointmentType;
              });
            },
            child: Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: selectedAppointmentType == appointmentType ? Color(0xff881736) : Colors.grey,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(right: 8),
              child: Center(child: Text(appointmentType)),
            ),
          );
        }).toList(),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, Therapist therapist) {
    if (selectedDate != null && selectedTimeSlot != null && selectedAppointmentType != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Book Now"),
            content: Text("Confirm Your Appointment!"),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Booking Successful!'),
                      backgroundColor: Color(0xff881736),
                    ),
                  );
                  _performBooking(context, therapist);
                },
              ),
            ],
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select date, time slot, and appointment type.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _performBooking(BuildContext context, Therapist therapist) async {
    final user = FirebaseAuth.instance.currentUser;
    String userId = user!.uid;
    String therapistId = therapist.id; // replace with actual therapist id
    Booking booking = Booking(
      therapistName: therapist.name,
      userName: '',
      userId: userId,
      therapistId: therapistId,
      day: selectedDate!,
      status: 1,
      timeSlot: selectedTimeSlot!,
      appointmentType: selectedAppointmentType!,
      id: '',
    );

    BookingService bookingService = BookingService();
    try {
      // Check if the slot is available
      bool isSlotAvailable = await bookingService.checkSlotAvailability(therapistId, selectedDate!, selectedTimeSlot!);
      if (isSlotAvailable) {
        await bookingService.registerBooking(userId, booking);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sorry, the selected time slot is already booked.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error registering booking: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}


