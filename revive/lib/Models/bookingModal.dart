
import 'package:cloud_firestore/cloud_firestore.dart';

class Booking {
  String id;
  String userId;
  String therapistId;
  int status;
  String appointmentType;
  String timeSlot;
  DateTime day;
  DateTime? date;

  Booking({
    required this.userId,
    required this.therapistId,
    required this.status,
    required this.id,
    required this.appointmentType,
    required this.timeSlot,
    required this.day, 
   // required this.date,
  });

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
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
