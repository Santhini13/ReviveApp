
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revive/Models/assesmentModal.dart';

class AssesmentService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerAssesment(Assessment assessment, String? uid) async {
    try {
      print('print collection');
      print(assessment.title);

      DocumentReference userDoc = _firestore.collection('assessment').doc(uid);

      // Register the assessment
      await userDoc.collection(assessment.title).doc(assessment.id).set({
        'title': assessment.title,
        'score': assessment.score,
        'id':assessment.id,
        'date': FieldValue.serverTimestamp(),
      });

      // Track the assessment title if it's not already tracked
      await userDoc.collection('metadata').doc('assessmentTitles').set({
        'titles': FieldValue.arrayUnion([assessment.title]),
      }, SetOptions(merge: true));
    } catch (e) {
      print('Error registering assessment: $e');
      throw e;
    }
  }



  Future<List<Assessment>> fetchAssesment(String? uid) async {
    try {
      List<Assessment> assessments = [];

      // Fetch tracked assessment titles
      DocumentSnapshot<Map<String, dynamic>> metadataDoc = await _firestore
          .collection('assessment')
          .doc(uid)
          .collection('metadata')
          .doc('assessmentTitles')
          .get();

      // Check if the document exists and contains the expected data
      if (metadataDoc.exists && metadataDoc.data() != null) {
        Map<String, dynamic>? data = metadataDoc.data();
        if (data != null && data.containsKey('titles')) {
          List<String> assessmentTitles = List<String>.from(data['titles']);

          for (String title in assessmentTitles) {
            QuerySnapshot subcollectionSnapshot = await _firestore
                .collection('assessment')
                .doc(uid)
                .collection(title)
                .orderBy('date', descending: true)
                .get();

            assessments.addAll(subcollectionSnapshot.docs.map((doc) {
              return Assessment(
                title: doc['title'],
                score: doc['score'],
                id:doc['id'],
                date: (doc['date'] as Timestamp).toDate(),
              );
            }).toList());
          }
        }
      }

      return assessments;
    } catch (e) {
      print('Error fetching assessments: $e');
      throw e;
    }
  }

  
Future<void> deleteAssessment(Assessment assessment, String? uid) async {
 print(assessment.title);
 print(assessment.id);
 print(uid);
 try{   // Delete the assessment document
    await _firestore
        .collection('assessment')
        .doc(uid)
        .collection(assessment.title)
        .doc(assessment.id!) // Assuming each assessment has an ID
        .delete();
  } catch (e) {
    print('Error deleting assessment: $e');
    throw e;
  }
}

  // Future<void> deleteAssessment(Assessment assessment, String? uid) async {
  //   try {
  //     // Delete the assessment document
  //     await _firestore
  //         .collection('assessment')
  //         .doc(uid)
  //         .collection(assessment.title)
  //         .doc(assessment.id) // Assuming each assessment has an ID
  //         .delete();
  //   } catch (e) {
  //     print('Error deleting assessment: $e');
  //     throw e;
  //   }
  // }

  }

