import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revive/Models/assesmentModal.dart';

class AssesmentService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerAssesment(Assessment assesment, String? uid) async {
    try {
      print('print collection');
      await _firestore.collection('assessment').doc(uid).collection('score').add({
        'title': assesment.title,
        'score': assesment.score,
        'date': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error registering Journal: $e');
      throw e;
    }
  }
  Future<List<Assessment>> fetchAssesment(String? uid) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('assessment')
          .doc(uid)
          .collection('score')
          .orderBy('date', descending: true)
          .get();

      return querySnapshot.docs.map((doc) {
        return Assessment(
          title: doc['title'],
         score: doc['score'],
          date: (doc['date'] as Timestamp).toDate(), 
        );
      }).toList();
    } catch (e) {
      print('Error fetching journals: $e');
      throw e;
    }
  }
  Future<void> deleteAssessment(String? uid, String id) async {
    try {
      await _firestore.collection('assessment').doc(uid).collection('score').doc(id).delete();
    } catch (e) {
      print('Error deleting assessment: $e');
      throw e;
    }
  }
}
