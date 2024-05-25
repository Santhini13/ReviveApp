// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:intl/intl.dart';
// import 'package:revive/Models/therapistModal.dart';
// import 'package:revive/Screens/User/viewTherapist.dart';
// import 'package:revive/utils/appbutton.dart';
// import 'package:calendar_timeline/calendar_timeline.dart'; // Assuming Therapist class is defined in therapist.dart file

// class TherapistDetailScreen extends StatefulWidget {
//   final Therapist therapist;
//   final List<String> timeSlots;
//   final List<String> appointmentTypes;

//   const TherapistDetailScreen({
//     required this.therapist,
//     required this.timeSlots,
//     required this.appointmentTypes,
//   });

//   @override
//   State<TherapistDetailScreen> createState() => _TherapistDetailScreenState();
// }

// class _TherapistDetailScreenState extends State<TherapistDetailScreen> {
//   DateTime? selectedDate;
//   String? selectedTimeSlot;
//   String? selectedAppointmentType;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   backgroundColor: Color(0xff881736),
//       //   title: Text(widget.therapist.name,style: TextStyle(color: Colors.white),),
//       // ),
//       body: SingleChildScrollView(
//           child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               width: double.infinity,
//               height: 300,
//               child:
//                   // widget.therapist.photo!= null && widget.therapist.photo.isNotEmpty
//                   //     ? Image.network(widget.therapist.photo, fit: BoxFit.cover)
//                   //     :
//                   Image.asset('assets/images/user.png', fit: BoxFit.contain),
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//               border: Border(
//                 top: BorderSide(
//                   color: Colors.black, // Border color
//                   width: 2, // Border width
//                 ),
//                 left: BorderSide(
//                   color: Colors.black, // Border color
//                   width: 2, // Border width
//                 ),
//                 right: BorderSide(
//                   color: Colors.black, // Border color
//                   width: 2, // Border width
//                 ),
//               ),
//               borderRadius: BorderRadius.circular(20), // Border radius
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         widget.therapist.name,
//                         style: TextStyle(
//                             fontSize: 24, fontWeight: FontWeight.bold),
//                       ),
//                       Row(children: [
//                         Icon(Icons.favorite_outline),
//                         IconButton(
//                           onPressed: () {
//                             _showFeedbackDialog(context, widget.therapist.name);
//                           },
//                           icon: Icon(Icons.star_outline),
//                         ),
//                       ])
//                     ],
//                   ),
//                   Text(
//                     widget.therapist.qualification,
//                     style: TextStyle(
//                       fontSize: 16,
//                     ),
//                   ),
//                   Text(
//                     widget.therapist.specialization,
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'Description:',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     widget.therapist.description,
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'Choose Date',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 10),
//                   CalendarTimeline(
//                     initialDate: selectedDate ?? DateTime.now(),
//                     firstDate: DateTime(2020, 1, 1),
//                     lastDate: DateTime(2025, 12, 31),
//                     //onDateSelected: (date) => _handleDateSelection(context, date),
//                     onDateSelected: (date) {
//                       setState(() {
//                         selectedDate = date;
//                         _handleDateSelection(context, date);
//                       });
//                     },
//                     leftMargin: 20,
//                     monthColor: Colors.grey,
//                     dayColor: Color(0xff281537).withOpacity(0.9),
//                     activeDayColor: Colors.white,
//                     activeBackgroundDayColor: Color(0xff881736),
//                     dotsColor: Colors.white,
//                     selectableDayPredicate: (date) => date
//                         .isAfter(DateTime.now().subtract(Duration(days: 1))),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'Time Slots',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 10),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: widget.timeSlots.map((timeSlot) {
//                         return GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               selectedTimeSlot = timeSlot;
//                             });
//                           },
//                           child: Container(
//                             height:40,
//                             width:90,
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                 width: 2,
//                                 color: selectedTimeSlot == timeSlot
//                                     ? Color(0xff881736)
//                                     : Colors.grey,
//                               ),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             padding: EdgeInsets.all(8),
//                             margin: EdgeInsets.only(right: 8),
//                             child: Text(timeSlot),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'Appointment Types',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 10),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: widget.appointmentTypes.map((appointmentType) {
//                         return GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               selectedAppointmentType = appointmentType;
//                             });
//                           },
//                           child: Container(
//                             width:80,
//                             height:40,
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                 width: 2,
//                                 color:
//                                     selectedAppointmentType == appointmentType
//                                         ? Color(0xff881736)
//                                         : Colors.grey,
//                               ),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             padding: EdgeInsets.all(8),
//                             margin: EdgeInsets.only(right: 8),
//                             child: Text(appointmentType),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   if (selectedDate != null &&
//                       selectedTimeSlot != null &&
//                       selectedAppointmentType != null)
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         AppButton(
//                           onTap: () => _showPaymentDialog(context),
//                           child: Text(
//                             'Book Now',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           color: Color(0xff881736),
//                           height: 50,
//                           width: 150,
//                         ),
//                       ],
//                     ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       )),
//     );
//   }

//   void _handleDateSelection(BuildContext context, DateTime selectedDate) {
//     // You can show additional information or logic here based on the selected date
//     // For example, you can update the list of available time slots and appointment types
//   }
//   void _showPaymentDialog(BuildContext context) {
//     if (selectedDate != null &&
//         selectedTimeSlot != null &&
//         selectedAppointmentType != null) {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Payment"),
//             content: Text("Pay "),
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
//                   // Perform payment logic here
//                   _performPayment(context);
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

//   void _performPayment(BuildContext context) {
//     // Perform payment logic here
//     // Once payment is successful, show confirmation message
//     _showConfirmationMessage(context);
//   }

//   // void _showPaymentDialog(BuildContext context) {
//   //   if (selectedDate != null &&
//   //       selectedTimeSlot != null &&
//   //       selectedAppointmentType != null) {
//   //     // Proceed with booking
//   //     _showConfirmationMessage(context);
//   //   } else {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(
//   //         content: Text('Please select date, time slot, and appointment type.'),
//   //       ),
//   //     );
//   //   }
//   // }

//   void _showConfirmationMessage(BuildContext context) {
//     String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
//     String confirmationMessage =
//         'Appointment booked for $formattedDate, $selectedTimeSlot, $selectedAppointmentType';
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(confirmationMessage),
//       ),
//     );
//   }
// }

// void _showFeedbackDialog(BuildContext context, String therapistName) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       String feedbackDescription = '';
//       int rating = 0;

//       return AlertDialog(
//         title: Text('Feedback for $therapistName'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Enter your feedback here...',
//               ),
//               onChanged: (value) {
//                 feedbackDescription = value;
//               },
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('Rate: '),
//                 for (int i = 1; i <= 5; i++)
//                   IconButton(
//                     icon: Icon(
//                       i <= rating ? Icons.star : Icons.star_border,
//                       color: Colors.orange,
//                     ),
//                     onPressed: () {
//                       // setState(() {
//                       //   rating = i;
//                       // });
//                     },
//                   ),
//               ],
//             ),
//           ],
//         ),
//         actions: [
//           ElevatedButton(
//             onPressed: () {
//               // Submit feedback
//               _submitFeedback(context, rating, feedbackDescription);
//             },
//             child: Text('Submit'),
//           ),
//         ],
//       );
//     },
//   );
// }

// void _submitFeedback(BuildContext context, int rating, String description) {
//   // Implement logic to submit feedback
//   // You can send the rating and description to the backend or perform any other action
//   Navigator.pop(context); // Close the dialog
// }



// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:intl/intl.dart';
// import 'package:revive/Models/therapistModal.dart';
// import 'package:revive/utils/appbutton.dart';
// import 'package:calendar_timeline/calendar_timeline.dart'; // Assuming Therapist class is defined in therapist.dart file

// class TherapistDetailScreen extends StatefulWidget {
//   final Therapist therapist;
//   final List<String> timeSlots;
//   final List<String> appointmentTypes;

//   const TherapistDetailScreen({
//     required this.therapist,
//     required this.timeSlots,
//     required this.appointmentTypes,
//   });

//   @override
//   State<TherapistDetailScreen> createState() => _TherapistDetailScreenState();
// }

// class _TherapistDetailScreenState extends State<TherapistDetailScreen> {
//   DateTime? selectedDate;
//   String? selectedTimeSlot;
//   String? selectedAppointmentType;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   backgroundColor: Color(0xff881736),
//       //   title: Text(widget.therapist.name,style: TextStyle(color: Colors.white),),
//       // ),
//       body: SingleChildScrollView(
//           child: Column(
//         children: [
//           Container(
//             child: Padding(
//               padding: const EdgeInsets.only(top:30.0 ,left:20,right:20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(decoration: BoxDecoration(
//                           border: Border.all(
//                             width: 2
//                           ),borderRadius: BorderRadius.circular(20)
//                         ),
//                           child: Image.asset('assets/images/user.png',scale: 3,fit: BoxFit.contain,)),
//                         SizedBox(width: 30,),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               widget.therapist.name,
//                               style: TextStyle(
//                                 color:Color(0xff881736),
//                                   fontSize: 24, fontWeight: FontWeight.bold),
//                             ),
//                              Text(
//                       widget.therapist.qualification,
//                       style: TextStyle(
//                         fontSize: 18,
//                       ),
//                     ),
//                     Text(
//                       widget.therapist.specialization,
//                       style: TextStyle(fontSize: 18),
//                     ),
//                             Row(children: [
//                           Icon(Icons.favorite_outline,size: 20, color:Color(0xff881736),),
//                           IconButton(
//                             onPressed: () {
//                               _showFeedbackDialog(context, widget.therapist.name);
//                             },
//                             icon: Icon(Icons.star_outline,size: 20,color:Color(0xff881736)),
//                           ),
//                         ])
//                           ],
//                         ),
                        
//                       ],
//                     ),
//                   ),
                 
//                   SizedBox(height: 20),
//                   Text(
//                     'Description:',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:Color(0xff881736)),
//                   ),
//                   Text(
//                     widget.therapist.description,
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'Experience:',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:Color(0xff881736)),
//                   ),
//                   Text(
//                     widget.therapist.experience,
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'Feedbacks:',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:Color(0xff881736)),
//                   ),
//                   //row container scrolled 
//                   SizedBox(height: 20),
//                   Text(
//                     'Choose Date',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:Color(0xff881736)),
//                   ),
//                   SizedBox(height: 10),
//                   CalendarTimeline(
//                     initialDate: selectedDate ?? DateTime.now(),
//                     firstDate: DateTime(2020, 1, 1),
//                     lastDate: DateTime(2025, 12, 31),
//                     //onDateSelected: (date) => _handleDateSelection(context, date),
//                     onDateSelected: (date) {
//                       setState(() {
//                         selectedDate = date;
//                         _handleDateSelection(context, date);
//                       });
//                     },
//                     leftMargin: 20,
//                     monthColor: Colors.grey,
//                     dayColor: Color(0xff281537).withOpacity(0.9),
//                     activeDayColor: Colors.white,
//                     activeBackgroundDayColor: Color(0xff881736),
//                     dotsColor: Colors.white,
//                     selectableDayPredicate: (date) => date
//                         .isAfter(DateTime.now().subtract(Duration(days: 1))),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'Time Slots',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:Color(0xff881736)),
//                   ),
//                   SizedBox(height: 10),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: widget.timeSlots.map((timeSlot) {
//                         return GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               selectedTimeSlot = timeSlot;
//                             });
//                           },
//                           child: Container(
//                             height:40,
//                             width:90,
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                 width: 2,
//                                 color: selectedTimeSlot == timeSlot
//                                     ? Color(0xff881736)
//                                     : Colors.grey,
//                               ),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             padding: EdgeInsets.all(8),
//                             margin: EdgeInsets.only(right: 8),
//                             child: Text(timeSlot),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'Appointment Types',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color:Color(0xff881736)),
//                   ),
//                   SizedBox(height: 10),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: widget.appointmentTypes.map((appointmentType) {
//                         return GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               selectedAppointmentType = appointmentType;
//                             });
//                           },
//                           child: Container(
//                             width:80,
//                             height:40,
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                 width: 2,
//                                 color:
//                                     selectedAppointmentType == appointmentType
//                                         ? Color(0xff881736)
//                                         : Colors.grey,
//                               ),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             padding: EdgeInsets.all(8),
//                             margin: EdgeInsets.only(right: 8),
//                             child: Text(appointmentType),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   if (selectedDate != null &&
//                       selectedTimeSlot != null &&
//                       selectedAppointmentType != null)
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         AppButton(
//                           onTap: () => _showPaymentDialog(context),
//                           child: Text(
//                             'Book Now',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           color: Color(0xff881736),
//                           height: 50,
//                           width: 150,
//                         ),
//                       ],
//                     ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       )),
//     );
//   }

//   void _handleDateSelection(BuildContext context, DateTime selectedDate) {
//     // You can show additional information or logic here based on the selected date
//     // For example, you can update the list of available time slots and appointment types
//   }
//   void _showPaymentDialog(BuildContext context) {
//     if (selectedDate != null &&
//         selectedTimeSlot != null &&
//         selectedAppointmentType != null) {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Payment"),
//             content: Text("Pay "),
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
//                   // Perform payment logic here
//                   _performPayment(context);
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

//   void _performPayment(BuildContext context) {
//     // Perform payment logic here
//     // Once payment is successful, show confirmation message
//     _showConfirmationMessage(context);
//   }

//   // void _showPaymentDialog(BuildContext context) {
//   //   if (selectedDate != null &&
//   //       selectedTimeSlot != null &&
//   //       selectedAppointmentType != null) {
//   //     // Proceed with booking
//   //     _showConfirmationMessage(context);
//   //   } else {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(
//   //         content: Text('Please select date, time slot, and appointment type.'),
//   //       ),
//   //     );
//   //   }
//   // }

//   void _showConfirmationMessage(BuildContext context) {
//     String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
//     String confirmationMessage =
//         'Appointment booked for $formattedDate, $selectedTimeSlot, $selectedAppointmentType';
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(confirmationMessage),
//       ),
//     );
//   }
// }

// void _showFeedbackDialog(BuildContext context, String therapistName) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       String feedbackDescription = '';
//       int rating = 0;

//       return AlertDialog(
//         title: Text('Feedback for $therapistName'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Enter your feedback here...',
//               ),
//               onChanged: (value) {
//                 feedbackDescription = value;
//               },
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('Rate: '),
//                 for (int i = 1; i <= 5; i++)
//                   IconButton(
//                     icon: Icon(
//                       i <= rating ? Icons.star : Icons.star_border,
//                       color: Colors.orange,
//                     ),
//                     onPressed: () {
//                       // setState(() {
//                       //   rating = i;
//                       // });
//                     },
//                   ),
//               ],
//             ),
//           ],
//         ),
//         actions: [
//           ElevatedButton(
//             onPressed: () {
//               // Submit feedback
//               _submitFeedback(context, rating, feedbackDescription);
//             },
//             child: Text('Submit'),
//           ),
//         ],
//       );
//     },
//   );
// }

// void _submitFeedback(BuildContext context, int rating, String description) {
//   // Implement logic to submit feedback
//   // You can send the rating and description to the backend or perform any other action
//   Navigator.pop(context); // Close the dialog
// }



import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:revive/Models/bookingModal.dart';
import 'package:revive/Models/therapistModal.dart';
import 'package:revive/Screens/User/feedbackform.dart';
import 'package:revive/Screens/constants/myAppbar.dart';
import 'package:revive/Services/bookingServices.dart';
import 'package:revive/utils/appbutton.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

class TherapistDetailScreen extends StatefulWidget {
  final Therapist therapist;
  final List<String> timeSlots;
  final List<String> appointmentTypes;

  const TherapistDetailScreen({
    required this.therapist,
    required this.timeSlots,
    required this.appointmentTypes,
  });

  @override
  State<TherapistDetailScreen> createState() => _TherapistDetailScreenState();
}

class _TherapistDetailScreenState extends State<TherapistDetailScreen> {
  DateTime? selectedDate;
  String? selectedTimeSlot;
  String? selectedAppointmentType;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        padding: EdgeInsets.only(top:20,left:20,right:20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTherapistInfo(),
            SizedBox(height: 20),
            Divider(color: Colors.grey,thickness:2),
            buildSectionTitle('Description:'),
            Text(
              widget.therapist.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Divider(color: Colors.grey,thickness: 2),
            buildSectionTitle('Experience:'),
            Text(
              widget.therapist.experience,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Divider(color: Colors.grey,thickness: 2),
            buildSectionTitle('Feedbacks:'),
            SizedBox(height: 20),
            Divider(color: Colors.grey,thickness: 2),
            buildSectionTitle('Choose Date'),
            SizedBox(height: 10),
            Divider(color: Colors.grey,thickness: 2),
            buildCalendarTimeline(),
            SizedBox(height: 20),
            Divider(color: Colors.grey,thickness: 2),
            buildSectionTitle('Time Slots'),
            SizedBox(height: 10),
            buildTimeSlots(),
            SizedBox(height: 20),
            Divider(color: Colors.grey,thickness: 2),
            buildSectionTitle('Appointment Types'),
            SizedBox(height: 10),
            buildAppointmentTypes(),
            SizedBox(height: 20),
            if (selectedDate != null && selectedTimeSlot != null && selectedAppointmentType != null)
              Center(
                child: AppButton(
                  onTap: () => _showPaymentDialog(context),
                  child: Text(
                    'Book Now',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color(0xff881736),
                  height: 50,
                  width: 150,
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Widget buildTherapistInfo() {
  //   return SingleChildScrollView(
  //     child: Row(
  //       children: [
  //          CircleAvatar(
  //           radius: 80, // Adjust the radius as needed
  //           backgroundColor: Colors.grey[200], 
  //           // Background color of the avatar
  //           child: Icon(
  //             Icons.person,
  //             size: 50, // Size of the icon inside the avatar
  //             color: Color(0xff881736), // Color of the icon
  //           ),
  //         ),
  //         SizedBox(width: 20),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               widget.therapist.name,
  //               style: TextStyle(
  //                 color: Color(0xff881736),
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             Text(
  //               widget.therapist.qualification,
  //               style: TextStyle(fontSize: 14),
  //             ),
  //             Text(
  //               widget.therapist.specialization,
  //               style: TextStyle(fontSize: 14),
  //             ),
  //             SizedBox(height: 10),
  //             Row(
  //               children: [
  //                 IconButton(
  //                   icon: Icon(
  //                     isFavorite ? Icons.favorite : Icons.favorite_outline,
  //                     size: 20,
  //                     color: Color(0xff881736),
  //                   ),
  //                   onPressed: () {
  //                     setState(() {
  //                       isFavorite = !isFavorite;
  //                     });
  //                   },
  //                 ),
  //                 IconButton(
  //                   onPressed: () {
  //                     Navigator.push(
  //                       context,
  //                       MaterialPageRoute(
  //                         builder: (context) => FeedbackForm(),
  //                       ),
  //                     );
  //                   },
  //                   icon: Icon(Icons.star_outline, size: 20, color: Color(0xff881736)),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }


Widget buildTherapistInfo() {
  return SingleChildScrollView(
    child: Row(
      children: [
        Container(
          width: 160, // Set a fixed width for the container
          height: 160, // Set a fixed height for the container
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
          ),
          child: widget.therapist.profileImageUrl != null
              ? FadeInImage.assetNetwork(
                  placeholder: 'assets/images/user.png', // Placeholder image
                  image: widget.therapist.profileImageUrl!, // Image URL from Firestore
                  fit: BoxFit.cover, // Adjust the fit as needed
                )
              : Icon(
                  Icons.person,
                  size: 80, // Adjust the size of the icon
                  color: Color(0xff881736), // Color of the icon
                ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.therapist.name,
              style: TextStyle(
                color: Color(0xff881736),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.therapist.qualification,
              style: TextStyle(fontSize: 14),
            ),
            Text(
              widget.therapist.specialization,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_outline,
                    size: 20,
                    color: Color(0xff881736),
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FeedbackForm(),
                      ),
                    );
                  },
                  icon: Icon(Icons.star_outline, size: 20, color: Color(0xff881736)),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}


  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff881736)),
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
      selectableDayPredicate



: (date) => date.isAfter(DateTime.now().subtract(Duration(days: 1))),
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
              width: 80,
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


  void _showPaymentDialog(BuildContext context) {
    if (selectedDate != null && selectedTimeSlot != null && selectedAppointmentType != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Payment"),
            content: Text("Pay for the appointment"),
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
                  // Perform payment logic here
                  _performPayment(context);
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
        ),
      );
    }
  }

  void _performPayment(BuildContext context) {
    // Perform payment logic here
    // Once payment is successful, show confirmation message
    _showConfirmationMessage(context);
  }

  void _showConfirmationMessage(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
    String confirmationMessage =
        'Appointment booked for $formattedDate, $selectedTimeSlot, $selectedAppointmentType';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(confirmationMessage),
      ),
    );
  }
  Widget _buildProfileItem(IconData icon, String title, String subtitle) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Color(0xff281537)),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xff281537),
        ),
      ),
      subtitle: Text(subtitle),
    );
  }

}
 




// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:revive/Models/bookingModal.dart';
// import 'package:revive/Models/therapistModal.dart';
// import 'package:revive/Screens/User/feedbackform.dart';
// import 'package:revive/Screens/constants/myAppbar.dart';
// import 'package:revive/Services/bookingServices.dart';
// import 'package:revive/utils/appbutton.dart';
// import 'package:calendar_timeline/calendar_timeline.dart';

// class TherapistDetailScreen extends StatefulWidget {
//   final Therapist therapist;
//   final List<String> timeSlots;
//   final List<String> appointmentTypes;

//   const TherapistDetailScreen({
//     required this.therapist,
//     required this.timeSlots,
//     required this.appointmentTypes,
//   });

//   @override
//   State<TherapistDetailScreen> createState() => _TherapistDetailScreenState();
// }

// class _TherapistDetailScreenState extends State<TherapistDetailScreen> {
//   DateTime? selectedDate;
//   String? selectedTimeSlot;
//   String? selectedAppointmentType;
//   bool isFavorite = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           automaticallyImplyLeading: false,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xff881736), Color(0xff281537)],
//             ),
        
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.only(top:20,left:20,right:20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             buildTherapistInfo(),
//             SizedBox(height: 20),
//             Divider(color: Colors.grey,thickness:2),
//             buildSectionTitle('Description:'),
//             Text(
//               widget.therapist.description,
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             Divider(color: Colors.grey,thickness: 2),
//             buildSectionTitle('Experience:'),
//             Text(
//               widget.therapist.experience,
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             Divider(color: Colors.grey,thickness: 2),
//             buildSectionTitle('Feedbacks:'),
//             SizedBox(height: 20),
//             Divider(color: Colors.grey,thickness: 2),
//             buildSectionTitle('Choose Date'),
//             SizedBox(height: 10),
//             Divider(color: Colors.grey,thickness: 2),
//             buildCalendarTimeline(),
//             SizedBox(height: 20),
//             Divider(color: Colors.grey,thickness: 2),
//             buildSectionTitle('Time Slots'),
//             SizedBox(height: 10),
//             buildTimeSlots(),
//             SizedBox(height: 20),
//             Divider(color: Colors.grey,thickness: 2),
//             buildSectionTitle('Appointment Types'),
//             SizedBox(height: 10),
//             buildAppointmentTypes(),
//             SizedBox(height: 20),
//             if (selectedDate != null && selectedTimeSlot != null && selectedAppointmentType != null)
//               Center(
//                 child: AppButton(
//                   onTap: () => _showPaymentDialog(context),
//                   child: Text(
//                     'Book Now',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   color: Color(0xff881736),
//                   height: 50,
//                   width: 150,
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Widget buildTherapistInfo() {
//   //   return SingleChildScrollView(
//   //     child: Row(
//   //       children: [
//   //          CircleAvatar(
//   //           radius: 80, // Adjust the radius as needed
//   //           backgroundColor: Colors.grey[200], 
//   //           // Background color of the avatar
//   //           child: Icon(
//   //             Icons.person,
//   //             size: 50, // Size of the icon inside the avatar
//   //             color: Color(0xff881736), // Color of the icon
//   //           ),
//   //         ),
//   //         SizedBox(width: 20),
//   //         Column(
//   //           crossAxisAlignment: CrossAxisAlignment.start,
//   //           children: [
//   //             Text(
//   //               widget.therapist.name,
//   //               style: TextStyle(
//   //                 color: Color(0xff881736),
//   //                 fontSize: 20,
//   //                 fontWeight: FontWeight.bold,
//   //               ),
//   //             ),
//   //             Text(
//   //               widget.therapist.qualification,
//   //               style: TextStyle(fontSize: 14),
//   //             ),
//   //             Text(
//   //               widget.therapist.specialization,
//   //               style: TextStyle(fontSize: 14),
//   //             ),
//   //             SizedBox(height: 10),
//   //             Row(
//   //               children: [
//   //                 IconButton(
//   //                   icon: Icon(
//   //                     isFavorite ? Icons.favorite : Icons.favorite_outline,
//   //                     size: 20,
//   //                     color: Color(0xff881736),
//   //                   ),
//   //                   onPressed: () {
//   //                     setState(() {
//   //                       isFavorite = !isFavorite;
//   //                     });
//   //                   },
//   //                 ),
//   //                 IconButton(
//   //                   onPressed: () {
//   //                     Navigator.push(
//   //                       context,
//   //                       MaterialPageRoute(
//   //                         builder: (context) => FeedbackForm(),
//   //                       ),
//   //                     );
//   //                   },
//   //                   icon: Icon(Icons.star_outline, size: 20, color: Color(0xff881736)),
//   //                 ),
//   //               ],
//   //             ),
//   //           ],
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }


// Widget buildTherapistInfo() {
//   return SingleChildScrollView(
//     child: Row(
//       children: [
//         Container(
//           width: 160, // Set a fixed width for the container
//           height: 160, // Set a fixed height for the container
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.grey[200],
//           ),
//           child: widget.therapist.profileImageUrl != null
//               ? FadeInImage.assetNetwork(
//                   placeholder: 'assets/images/user.png', // Placeholder image
//                   image: widget.therapist.profileImageUrl!, // Image URL from Firestore
//                   fit: BoxFit.cover, // Adjust the fit as needed
//                 )
//               : Icon(
//                   Icons.person,
//                   size: 80, // Adjust the size of the icon
//                   color: Color(0xff881736), // Color of the icon
//                 ),
//         ),
//         SizedBox(width: 20),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.therapist.name,
//               style: TextStyle(
//                 color: Color(0xff881736),
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               widget.therapist.qualification,
//               style: TextStyle(fontSize: 14),
//             ),
//             Text(
//               widget.therapist.specialization,
//               style: TextStyle(fontSize: 14),
//             ),
//             SizedBox(height: 10),
//             Row(
//               children: [
//                 IconButton(
//                   icon: Icon(
//                     isFavorite ? Icons.favorite : Icons.favorite_outline,
//                     size: 20,
//                     color: Color(0xff881736),
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       isFavorite = !isFavorite;
//                     });
//                   },
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => FeedbackForm(),
//                       ),
//                     );
//                   },
//                   icon: Icon(Icons.star_outline, size: 20, color: Color(0xff881736)),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }


//   Widget buildSectionTitle(String title) {
//     return Text(
//       title,
//       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff881736)),
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
//       selectableDayPredicate



// : (date) => date.isAfter(DateTime.now().subtract(Duration(days: 1))),
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
//               width: 80,
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


//   void _showPaymentDialog(BuildContext context) {
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
//                   // Perform payment logic here
//                   _performPayment(context);
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

//   void _performPayment(BuildContext context) {
//     // Perform payment logic here
//     // Once payment is successful, show confirmation message
//     _showConfirmationMessage(context);
//   }

//   void _showConfirmationMessage(BuildContext context) {
//     String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
//     String confirmationMessage =
//         'Appointment booked for $formattedDate, $selectedTimeSlot, $selectedAppointmentType';
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(confirmationMessage),
//       ),
//     );
//   }
//   Widget _buildProfileItem(IconData icon, String title, String subtitle) {
//     return ListTile(
//       contentPadding: EdgeInsets.zero,
//       leading: Icon(icon, color: Color(0xff281537)),
//       title: Text(
//         title,
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//           color: Color(0xff281537),
//         ),
//       ),
//       subtitle: Text(subtitle),
//     );
//   }

// }
 