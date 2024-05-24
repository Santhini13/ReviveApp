
import 'package:cloud_firestore/cloud_firestore.dart';

class Booking {
  String id;
  String appointmentType;
  String timeSlot;
  DateTime date;
  String? Paymentid;

  Booking({
    required this.id,
    required this.appointmentType,
    required this.timeSlot,
    required this.date,
  });

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      id: map['id'],
      appointmentType: map['appointmentType'],
      timeSlot: map['timeSlot'],
      date: (map['date'] as Timestamp?)!.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'appointmentType': appointmentType,
      'timeSlot': timeSlot,
      'date': date,
    };
  }
}
