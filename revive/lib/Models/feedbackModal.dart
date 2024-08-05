import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackData {
  final String therapistName;
  final String therapistId;
  final String feedback;
  final double rating;
  final DateTime timestamp;

  FeedbackData({
    required this.therapistName,
    required this.therapistId,
    required this.feedback,
    required this.rating,
    required this.timestamp,
  });

  factory FeedbackData.fromMap(Map<String, dynamic> map) {
    return FeedbackData(
      therapistName: map['therapistName'],
      therapistId: map['therapistId'],
      feedback: map['feedback'],
      rating: map['rating'].toDouble(),
      timestamp: (map['timestamp'] as Timestamp).toDate(),
    );
  }
}
