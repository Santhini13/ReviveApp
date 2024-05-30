
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
   // required this.date,
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
       day:map['day'],
      status: map['status'].toInt(), 
    );
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
    };
  }
}
