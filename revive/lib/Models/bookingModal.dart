
import 'package:cloud_firestore/cloud_firestore.dart';

class Booking {
  String id;
  String userId;
  String therapistId;
  String therapistName;
  String userName;
  int status;
  String appointmentType;
  String timeSlot;
  DateTime day;
  DateTime? date;
  String? phoneNumber;
  String? email;

  Booking({
    required this.userId,
    required this.therapistId,
    required this.therapistName,
    required this.userName,
    required this.status,
    required this.id,
    required this.appointmentType,
    required this.timeSlot,
    required this.day, 
   // r//equired this.date,
  });

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      therapistName:map['therapistName'],
      userName:map['userName'],
      therapistId: map['therapistId'],
      userId:map['userId'],
      id: map['id'],
      appointmentType: map['appointmentType'],
      timeSlot: map['timeSlot'],
      //date: (map['date'] as Timestamp?)!.toDate(), 
       day: (map['day'] as Timestamp).toDate(),
      status: map['status'].toInt(), 
    );
  }
DateTime get endTime {
    // Assume each appointment has a duration of 1 hour
    // You can adjust this based on your actual requirement
    return day.add(Duration(hours: 1));
  }
  Map<String, dynamic> toMap() {
    return {
      'therapistName':therapistName,
      'userName':userName,
      'id': id,
      'therapisId':therapistId,
      'userId': userId,
      'appointmentType': appointmentType,
      'timeSlot': timeSlot,
      'day':day,
      'date': date,
      'phoneNumber':phoneNumber,
      'email':email
    };
  }
}
