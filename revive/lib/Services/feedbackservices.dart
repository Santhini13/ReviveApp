// feedback_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revive/Models/feedbackModal.dart';

class FeedbackService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addFeedback(Feedbacks feedback) async {
    try {
      await _firestore.collection('Feedback').doc(feedback.id).set(feedback.toFirestore());
    } catch (e) {
      print('Error adding feedback: $e');
      throw e;
    }
  }

  Future<List<Feedbacks>> fetchFeedbackByTherapist(String therapistId) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('Feedback')
          .where('therapistId', isEqualTo: therapistId)
          .get();

      return querySnapshot.docs.map((doc) => Feedbacks.fromFirestore(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      print('Error fetching feedback: $e');
      throw e;
    }
  }

  Future<void> deleteFeedback(String feedbackId) async {
    try {
      await _firestore.collection('Feedback').doc(feedbackId).delete();
    } catch (e) {
      print('Error deleting feedback: $e');
      throw e;
    }
  }
}
