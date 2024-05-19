class Booking {
  String id;
  String userId;
  String therapistId;
  DateTime bookingDate;
  DateTime timeSlot;
  String status;

  Booking({
    required this.id,
    required this.userId,
    required this.therapistId,
    required this.bookingDate,
    required this.timeSlot,
    required this.status,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      userId: json['userId'],
      therapistId: json['therapistId'],
      bookingDate: DateTime.parse(json['bookingDate']),
      timeSlot: DateTime.parse(json['timeSlot']),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'therapistId': therapistId,
      'bookingDate': bookingDate.toIso8601String(),
      'timeSlot': timeSlot.toIso8601String(),
      'status': status,
    };
  }
}
