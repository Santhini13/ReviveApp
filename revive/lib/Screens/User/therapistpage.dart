import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:revive/Screens/User/viewTherapist.dart';
import 'package:revive/utils/appbutton.dart';
import 'package:calendar_timeline/calendar_timeline.dart'; // Assuming Therapist class is defined in therapist.dart file

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xff881736),
      //   title: Text(widget.therapist.name,style: TextStyle(color: Colors.white),),
      // ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Image.asset(
            widget.therapist.photo,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.therapist.name,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Row(children:[
                      Icon(Icons.favorite_outline),
                    IconButton(
                      onPressed: () {
                        _showFeedbackDialog(context, widget.therapist.name);
                      },
                      icon: Icon(Icons.star_outline),
                    ),
                    ])
                  ],
                ),
                Text(
                  widget.therapist.qualification,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  widget.therapist.specialization,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Description:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.therapist.description,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Choose Date',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                CalendarTimeline(
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020, 1, 1),
                  lastDate: DateTime(2025, 12, 31),
                  //onDateSelected: (date) => _handleDateSelection(context, date),
                  onDateSelected: (date) {
                    setState(() {
                      selectedDate = date;
                      _handleDateSelection(context, date);
                    });
                  },
                  leftMargin: 20,
                  monthColor: Colors.grey,
                  dayColor: Color(0xff281537).withOpacity(0.9),
                  activeDayColor: Colors.white,
                  activeBackgroundDayColor: Color(0xff881736),
                  dotsColor: Colors.white,
                  selectableDayPredicate: (date) => true,
                ),
                SizedBox(height: 20),
                Text(
                  'Time Slots',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
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
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: selectedTimeSlot == timeSlot
                                  ? Color(0xff881736)
                                  : Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.only(right: 8),
                          child: Text(timeSlot),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Appointment Types',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
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
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: selectedAppointmentType == appointmentType
                                  ? Color(0xff881736)
                                  : Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.only(right: 8),
                          child: Text(appointmentType),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 20),
                if (selectedDate != null &&
                    selectedTimeSlot != null &&
                    selectedAppointmentType != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppButton(
                        onTap: () => _showPaymentDialog(context),
                        child: Text(
                          'Book Now',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Color(0xff881736),
                        height: 50,
                        width: 150,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  void _handleDateSelection(BuildContext context, DateTime selectedDate) {
    // You can show additional information or logic here based on the selected date
    // For example, you can update the list of available time slots and appointment types
  }
void _showPaymentDialog(BuildContext context) {
  if (selectedDate != null &&
      selectedTimeSlot != null &&
      selectedAppointmentType != null) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Payment"),
          content: Text("Please proceed with the payment to book your appointment."),
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

  // void _showPaymentDialog(BuildContext context) {
  //   if (selectedDate != null &&
  //       selectedTimeSlot != null &&
  //       selectedAppointmentType != null) {
  //     // Proceed with booking
  //     _showConfirmationMessage(context);
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Please select date, time slot, and appointment type.'),
  //       ),
  //     );
  //   }
  // }

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
}
void _showFeedbackDialog(BuildContext context, String therapistName) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      String feedbackDescription = '';
      int rating = 0;

      return AlertDialog(
        title: Text('Feedback for $therapistName'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your feedback here...',
              ),
              onChanged: (value) {
                feedbackDescription = value;
              },
            ),
            SizedBox(height:10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Rate: '),
                for (int i = 1; i <= 5; i++)
                  IconButton(
                    icon: Icon(
                      i <= rating ? Icons.star : Icons.star_border,
                      color: Colors.orange,
                    ),
                    onPressed: () {
                      // setState(() {
                      //   rating = i;
                      // });
                    },
                  ),
              ],
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              // Submit feedback
              _submitFeedback(context, rating, feedbackDescription);
            },
            child: Text('Submit'),
          ),
        ],
      );
    },
  );
}

void _submitFeedback(
    BuildContext context, int rating, String description) {
  // Implement logic to submit feedback
  // You can send the rating and description to the backend or perform any other action
  Navigator.pop(context); // Close the dialog
}