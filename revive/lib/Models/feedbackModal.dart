// feedback_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class Feedbacks {
  final String id;
  final String userId;
  final String therapistId;
  final String feedbackText;
  final DateTime date;

  Feedbacks({
    required this.id,
    required this.userId,
    required this.therapistId,
    required this.feedbackText,
    required this.date,
  });

  factory Feedbacks.fromFirestore(Map<String, dynamic> data) {
    return Feedbacks(
      id: data['id'],
      userId: data['userId'],
      therapistId: data['therapistId'],
      feedbackText: data['feedbackText'],
      date: (data['date'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'userId': userId,
      'therapistId': therapistId,
      'feedbackText': feedbackText,
      'date': date,
    };
  }
}
