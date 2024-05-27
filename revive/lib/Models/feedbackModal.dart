// feedback_model.dart

import 'package:cloud_firestore/cloud_firestore.dart';

class Rating {
  String? id;
  String feedbackMessage;
  double rating;
  DateTime? date;

  Rating({
    this.id,
    required this.feedbackMessage,
    required this.rating,
    this.date,
  });

  factory Rating.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Rating(
      id: data['id'] ?? '',
      feedbackMessage: data['feedbackMessage'] ?? '',
       rating: data['rating'] ?? 0,
      date: (data['date'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'feedbackMessage': feedbackMessage,
      'rating': rating,
      'date': date != null ? Timestamp.fromDate(date!) : FieldValue.serverTimestamp(),
    };
  }
}
