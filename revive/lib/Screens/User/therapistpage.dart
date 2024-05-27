// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:revive/Models/therapistModal.dart';
// // import 'package:revive/Screens/User/feedbackform.dart';
// // import 'package:calendar_timeline/calendar_timeline.dart';
// //  import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';

// // class TherapistDetailScreen extends StatefulWidget {
// //   final Therapist therapist;
// //   final List<String> timeSlots;
// //   final List<String> appointmentTypes;

// //   TherapistDetailScreen({required this.therapist, required this.timeSlots, required this.appointmentTypes});

// //   @override
// //   _TherapistDetailScreenState createState() => _TherapistDetailScreenState();
// // }

// // class _TherapistDetailScreenState extends State<TherapistDetailScreen> {
// //   DateTime? selectedDate;
// //   String? selectedTimeSlot;
// //   String? selectedAppointmentType;
// //   bool isFavorite = false;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _checkIfFavorite();
// // //   } 

// // // void _checkIfFavorite() async {
// // //     final user = FirebaseAuth.instance.currentUser;
// // //     if (user != null) {
// // //       final doc = await FirebaseFirestore.instance
// // //           .collection('users')
// // //           .doc(user.uid)
// // //           .collection('favoriteTherapists')
// // //           .doc()
// // //           .get();

// // //       setState(() {
// // //         isFavorite = doc.exists;
// // //       });
// // //     }}
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SingleChildScrollView(
// //         child: Container(
// //           // decoration: BoxDecoration(
// //           //    gradient: LinearGradient(

// //           //     colors: [Color(0xff881736), Color(0xff281537)],
// //           //   ),
// //           // ),

// //           child: Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 SizedBox(height: 20),
// //                 buildTherapistInfo(),
// //                 SizedBox(height: 20),
// //                 Divider(color: Colors.grey, thickness: 2),
// //                 buildSectionTitle('Description:'),
// //                 Text(
// //                   widget.therapist.description,
// //                   style: TextStyle(fontSize: 16),
// //                   textAlign: TextAlign.justify,
// //                 ),
// //                 SizedBox(height: 20),
// //                 Divider(color: Colors.grey, thickness: 2),
// //                 buildSectionTitle('Experience:'),
// //                 Text(
// //                   widget.therapist.experience,
// //                   style: TextStyle(fontSize: 16),
// //                   textAlign: TextAlign.justify,
// //                 ),
// //                 SizedBox(height: 20),
// //                 Divider(color: Colors.grey, thickness: 2),
// //                 buildSectionTitle('Feedbacks:'),
// //                 SizedBox(height: 20),
// //                 Divider(color: Colors.grey, thickness: 2),
// //                 buildSectionTitle('Choose Date'),
// //                 SizedBox(height: 10),
// //                 buildCalendarTimeline(),
// //                 SizedBox(height: 20),
// //                 Divider(color: Colors.grey, thickness: 2),
// //                 buildSectionTitle('Time Slots'),
// //                 SizedBox(height: 10),
// //                 buildTimeSlots(),
// //                 SizedBox(height: 20),
// //                 Divider(color: Colors.grey, thickness: 2),
// //                 buildSectionTitle('Appointment Types'),
// //                 SizedBox(height: 10),
// //                 buildAppointmentTypes(),
// //                 SizedBox(height: 20),
// //                 if (selectedDate != null && selectedTimeSlot != null && selectedAppointmentType != null)
// //                   Center(
// //                     child: ElevatedButton(
// //                       onPressed: () => _showPaymentDialog(context),
// //                       style: ElevatedButton.styleFrom(
// //                         backgroundColor: Color(0xff881736),
// //                         foregroundColor: Colors.white,
// //                         shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(30),
// //                         ),
// //                         padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
// //                       ),
// //                       child: Text('Book Now', style: TextStyle(fontSize: 16)),
// //                     ),
// //                   ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget buildTherapistInfo() {
// //     return Row(
// //       children: [
// //         CircleAvatar(
// //           radius: 80,
// //           backgroundColor: Colors.grey[200],
// //           backgroundImage: widget.therapist.profileImageUrl != null
// //               ? NetworkImage(widget.therapist.profileImageUrl!)
// //               : null,
// //           child: widget.therapist.profileImageUrl == null
// //               ? Icon(Icons.person, size: 50, color: Color(0xff881736))
// //               : null,
// //         ),
// //         SizedBox(width: 30),
// //         Expanded(
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text(
// //                 widget.therapist.name,
// //                 style: TextStyle(
// //                   color: Color(0xff881736),
// //                   fontSize: 24,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //               Text(
// //                 widget.therapist.qualification,
// //                 style: TextStyle(fontSize: 16, color: Colors.grey[600]),
// //               ),
// //               Text(
// //                 widget.therapist.specialization,
// //                 style: TextStyle(fontSize: 16, color: Colors.grey[600]),
// //               ),
// //               SizedBox(height: 10),
// //               // Row(
// //               //   children: [
// //               //     IconButton(
// //               //       icon: Icon(
// //               //         isFavorite ? Icons.favorite : Icons.favorite_outline,
// //               //         color: Color(0xff881736),
// //               //       ),
// //               //       onPressed: () {
// //               //         setState(() {
// //               //           isFavorite = !isFavorite;
// //               //         });
// //               //          if (isFavorite) {
// //               //           _addToFavorites();
// //               //         } else {
// //               //           _removeFromFavorites();
// //               //         }
// //               //       },
// //               //     ),
// //               //     IconButton(
// //               //       icon: Icon(Icons.star_outline, color: Color(0xff881736)),
// //               //       onPressed: () {
// //               //       Navigator.push(
// //               //     context,
// //               //     MaterialPageRoute(
// //               //       builder: (context) => FeedbackFormScreen(
// //               //         therapistName: widget.therapist.name,
// //               //       ),
// //               //     ),
// //               //   );
// //               //       },
// //               //     ),
// //               //   ],
// //               // ),
// //             ],
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// //   // void _addToFavorites() async {
// //   //   final user = FirebaseAuth.instance.currentUser;
// //   //   if (user != null) {
// //   //     try {
// //   //       await FirebaseFirestore.instance
// //   //           .collection('users')
// //   //           .doc(user.uid)
// //   //           .collection('favoriteTherapists')
// //   //           .doc()
// //   //           .set({
// //   //         'name': widget.therapist.name,
// //   //         'qualification': widget.therapist.qualification,
// //   //         'specialization': widget.therapist.specialization,
// //   //         'profileImageUrl': widget.therapist.profileImageUrl,
// //   //       });
// //   //     } catch (e) {
// //   //       print('Failed to add therapist to favorites: $e');
// //   //     }
// //   //   }
// //   // }

// //   // void _removeFromFavorites() async {
// //   //   final user = FirebaseAuth.instance.currentUser;
// //   //   if (user != null) {
// //   //     try {
// //   //       await FirebaseFirestore.instance
// //   //           .collection('users')
// //   //           .doc(user.uid)
// //   //           .collection('favoriteTherapists')
// //   //           .doc()
// //   //           .delete();
// //   //     } catch (e) {
// //   //       print('Failed to remove therapist from favorites: $e');
// //   //     }
// //   //   }
// //   // }




// //   Widget buildSectionTitle(String title) {
// //     return Text(
// //       title,
// //       style: TextStyle(
// //         fontSize: 20,
// //         fontWeight: FontWeight.bold,
// //         color: Color(0xff881736),
// //       ),
// //     );
// //   }

// //   Widget buildCalendarTimeline() {
// //     return CalendarTimeline(
// //       initialDate: selectedDate ?? DateTime.now(),
// //       firstDate: DateTime(2020, 1, 1),
// //       lastDate: DateTime(2025, 12, 31),
// //       onDateSelected: (date) {
// //         setState(() {
// //           selectedDate = date;
// //         });
// //       },
// //       leftMargin: 20,
// //       monthColor: Colors.grey,
// //       dayColor: Color(0xff281537).withOpacity(0.9),
// //       activeDayColor: Colors.white,
// //       activeBackgroundDayColor: Color(0xff881736),
// //       dotsColor: Colors.white,
// //       selectableDayPredicate: (date) => date.isAfter(DateTime.now().subtract(Duration(days: 1))),
// //     );
// //   }

// //   Widget buildTimeSlots() {
// //     return SingleChildScrollView(
// //       scrollDirection: Axis.horizontal,
// //       child: Row(
// //         children: widget.timeSlots.map((timeSlot) {
// //           return GestureDetector(
// //             onTap: () {
// //               setState(() {
// //                 selectedTimeSlot = timeSlot;
// //               });
// //             },
// //             child: Container(
// //               height: 40,
// //               width: 90,
// //               decoration: BoxDecoration(
// //                 border: Border.all(
// //                   width: 2,
// //                   color: selectedTimeSlot == timeSlot ? Color(0xff881736) : Colors.grey,
// //                 ),
// //                 borderRadius: BorderRadius.circular(8),
// //               ),
// //               padding: EdgeInsets.all(8),
// //               margin: EdgeInsets.only(right: 8),
// //               child: Center(child: Text(timeSlot)),
// //             ),
// //           );
// //         }).toList(),
// //       ),
// //     );
// //   }

// //   Widget buildAppointmentTypes() {
// //     return SingleChildScrollView(
// //       scrollDirection: Axis.horizontal,
// //       child: Row(
// //         children: widget.appointmentTypes.map((appointmentType) {
// //           return GestureDetector(
// //             onTap: () {
// //               setState(() {
// //                 selectedAppointmentType = appointmentType;
// //               });
// //             },
// //             child: Container(
// //               width: 120,
// //               height: 40,
// //               decoration: BoxDecoration(
// //                 border: Border.all(
// //                   width: 2,
// //                   color: selectedAppointmentType == appointmentType ? Color(0xff881736) : Colors.grey,
// //                 ),
// //                 borderRadius: BorderRadius.circular(8),
// //               ),
// //               padding: EdgeInsets.all(8),
// //               margin: EdgeInsets.only(right: 8),
// //               child: Center(child: Text(appointmentType)),
// //             ),
// //           );
// //         }).toList(),
// //       ),
// //     );
// //   }

// //   void _showPaymentDialog(BuildContext context) {
// //     if (selectedDate != null && selectedTimeSlot != null && selectedAppointmentType != null) {
// //       showDialog(
// //         context: context,
// //         builder: (BuildContext context) {
// //           return AlertDialog(
// //             title: Text("Payment"),
// //             content: Text("Pay for the appointment"),
// //             actions: <Widget>[
// //               TextButton(
// //                 child: Text("Cancel"),
// //                 onPressed: () {
// //                   Navigator.of(context).pop();
// //                 },
// //               ),
// //               TextButton(
// //                 child: Text("Pay"),
// //                 onPressed: () {
// //                   _performPayment(context);
// //                   Navigator.pop(context);
// //                 },
// //               ),
// //             ],
// //           );
// //         },
// //       );
// //     } else {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(
// //           content: Text('Please select date, time slot, and appointment type.'),
// //         ),
// //       );
// //     }
// //   }

// //   void _performPayment(BuildContext context) {
// //     _showConfirmationMessage(context);
// //   }

// //   void _showConfirmationMessage(BuildContext context) {
// //     String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
// //     String confirmationMessage = 'Appointment booked for $formattedDate, $selectedTimeSlot, $selectedAppointmentType';
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(
// //         content: Text(confirmationMessage),
// //       ),
// //     );
// //   }
// // }



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:revive/Models/therapistModal.dart';
// import 'package:revive/Models/bookingModal.dart';
// import 'package:revive/Screens/User/feedbackform.dart';
// import 'package:revive/Screens/constants/myAppbar.dart';
// import 'package:revive/Services/bookingServices.dart';
// import 'package:revive/Services/therapistService.dart';
// import 'package:calendar_timeline/calendar_timeline.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class TherapistDetailScreen extends StatefulWidget {
//   final Therapist therapist;
//   final List<String> timeSlots;
//   final List<String> appointmentTypes;
//   final BookingService _bookingService=BookingService();

//   TherapistDetailScreen({required this.therapist, required this.timeSlots, required this.appointmentTypes});

//   @override
//   _TherapistDetailScreenState createState() => _TherapistDetailScreenState();
// }

// class _TherapistDetailScreenState extends State<TherapistDetailScreen> {
//   DateTime? selectedDate;
//   String? selectedTimeSlot;
//   String? selectedAppointmentType;
//   bool isFavorite = false;
// late Therapist therapist;
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
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 20),
//                  Center(
//                    child: CircleAvatar( 
//                              radius: 80,
//                              backgroundColor: Colors.grey[200],
//                              backgroundImage: widget.therapist.profileImageUrl != null
//                                  ? NetworkImage(widget.therapist.profileImageUrl!)
//                                  : null,
//                              child: widget.therapist.profileImageUrl == null
//                                  ? Icon(Icons.person, size: 50, color: Color(0xff881736))
//                                  : null,
//                            ),
//                  ),
//         SizedBox(width: 30),
//                 //Divider(color: Colors.grey),
//                 //_buildProfileItem(Icons.person, widget.therapist.name),
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
//                Divider(color: Colors.grey, thickness: 2),
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
//                        textAlign: TextAlign.justify,
//                       style: TextStyle(fontSize: 16,)
//                       ,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 // buildSectionTitle('Feedbacks:'),
//                 // SizedBox(height: 20),
                
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
//                       onPressed: () => _showPaymentDialog(context,widget.therapist),
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
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }


//   Widget buildTherapistInfo(Therapist therapist) {
//     return Row(
//       children: [
//         CircleAvatar( 
//           radius: 80,
//           backgroundColor: Colors.grey[200],
//           backgroundImage: widget.therapist.profileImageUrl != null
//               ? NetworkImage(widget.therapist.profileImageUrl!)
//               : null,
//           child: widget.therapist.profileImageUrl == null
//               ? Icon(Icons.person, size: 50, color: Color(0xff881736))
//               : null,
//         ),
//         SizedBox(width: 30),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 widget.therapist.name,
//                 style: TextStyle(
//                   color: Color(0xff881736),
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 widget.therapist.qualification,
//                 style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//               ),
//               Text(
//                 widget.therapist.specialization,
//                 style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//               ),
//               SizedBox(height: 10),
//               IconButton(
//                     icon: Icon(Icons.star_outline, color: Color(0xff881736)),
//                     onPressed: () {
//                     Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => FeedbackFormScreen(
//                       therapist: therapist
//                     ),
//                   ),
//                 );
//                     },
//                   ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//    Widget _buildProfileItem(IconData icon, String title) {
//     return ListTile(
//       contentPadding: EdgeInsets.zero,
//       leading: Icon(icon, color: Color(0xff881736)),
//       title: Text(
//         title,
//         style: TextStyle(
//           //fontWeight: FontWeight.bold,
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
//           selectedDate = date;
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

//   void _showPaymentDialog(BuildContext context,Therapist therapist) {
//     if (selectedDate != null && selectedTimeSlot != null && selectedAppointmentType != null) {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Payment"),
//             content: Text("Pay for the appointment"),
//             actions: <Widget>[
//               TextButton(
//                 child: Text("Cancel"),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               TextButton(
//                 child: Text("Pay"),
//                 onPressed: () {
//                   _performPayment(context,therapist);
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please select date, time slot, and appointment type.'),
//         ),
//       );
//     }
//   }


// void _performPayment(BuildContext context,Therapist therapist) async {
//   final user = FirebaseAuth.instance.currentUser;
//   String userId = user!.uid;
//   String therapistId = therapist.id ;// replace with actual therapist id
//   Booking booking = Booking(
//     userId: userId,
//     therapistId: therapistId,
//     day:selectedDate!,
//     status: 1,
//     //date: date!,
//     timeSlot: selectedTimeSlot!,
//     appointmentType: selectedAppointmentType!, 
//     id: '120', 
//   );
  
//   BookingService bookingService = BookingService();
//   try {

//      await bookingService.registerBooking(userId, booking);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Booking registered successfully'),
//         ),
//       );
//     // bool paymentSuccess = await _processPayment();
//     // if (paymentSuccess) {
//     //   await _bookingService.registerBooking(userId, booking);
//     //   ScaffoldMessenger.of(context).showSnackBar(
//     //     SnackBar(
//     //       content: Text('Booking registered successfully'),
//     //     ),
//     //   );
//     // } else {
//     //   ScaffoldMessenger.of(context).showSnackBar(
//     //     SnackBar(
//     //       content: Text('Payment failed. Please try again.'),
//     //     ),
//       //);
//     //}
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Error registering booking: $e'),
//       ),
//     );
//   }
// }

// Future<bool> _processPayment() async {
//   // Simulate a payment process (replace this with actual payment integration)
//   await Future.delayed(Duration(seconds: 2));
//   return true; // Simulate a successful payment
// }


//   void _showConfirmationMessage(BuildContext context) {
//     String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
//     String confirmationMessage = 'Appointment booked for $formattedDate, $selectedTimeSlot, $selectedAppointmentType';
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(confirmationMessage),
//       ),
//     );
//   }
// }



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:revive/Models/therapistModal.dart';
import 'package:revive/Models/bookingModal.dart';
import 'package:revive/Screens/User/feedbackform.dart';
import 'package:revive/Screens/constants/myAppbar.dart';
import 'package:revive/Services/bookingServices.dart';
import 'package:revive/Services/therapistService.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Center(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: widget.therapist.profileImageUrl != null
                        ? NetworkImage(widget.therapist.profileImageUrl!)
                        : null,
                    child: widget.therapist.profileImageUrl == null
                        ? Icon(Icons.person, size: 50, color: Color(0xff881736))
                        : null,
                  ),
                ),
                SizedBox(width: 30),
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
                      onPressed: () => _showPaymentDialog(context, widget.therapist),
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
          selectedDate = date;
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

  void _showPaymentDialog(BuildContext context, Therapist therapist) {
    if (selectedDate != null && selectedTimeSlot != null && selectedAppointmentType != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Book Now"),
            content: Text("Book the Appointment"),
            actions: <Widget>[
              TextButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text("Pay"),
                onPressed: () {
                  _performPayment(context, therapist);
                  Navigator.pop(context);
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

  void _performPayment(BuildContext context, Therapist therapist) async {
    final user = FirebaseAuth.instance.currentUser;
    String userId = user!.uid;
    String therapistId = therapist.id; // replace with actual therapist id
    Booking booking = Booking(
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
      await bookingService.registerBooking(userId, booking);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Booking registered successfully'),
          backgroundColor: const Color.fromARGB(255, 218, 228, 218),
        ),
      );
      _showConfirmationMessage(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error registering booking: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _showConfirmationMessage(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
    String confirmationMessage = 'Appointment booked for $formattedDate, $selectedTimeSlot, $selectedAppointmentType';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(confirmationMessage),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
