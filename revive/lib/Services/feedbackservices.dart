import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> submitFeedback({
    required String therapistId,
    required String therapistName,
    required String feedback,
    required double rating,
  }) async {
    try {
      DocumentReference feedbackDoc = await _firestore.collection('feedbacks').add({
        'therapistName': therapistName,
        'therapistId': therapistId,
        'feedback': feedback,
        'rating': rating,
        'timestamp': DateTime.now(),
      });

      await _firestore.collection('therapists').doc(therapistId).collection('feedbacks').doc(feedbackDoc.id).set({
        'feedbackId': feedbackDoc.id,
      });
    } catch (error) {
      throw Exception('Error submitting feedback: $error');
    }
  }
}
