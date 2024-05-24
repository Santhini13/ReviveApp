// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:revive/Models/assesmentModal.dart';

// class AssesmentService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> registerAssesment(Assessment assesment, String? uid) async {
//     try {
//       print('print collection');
//       print(assesment.title);
//       await _firestore.collection('assessment').doc(uid).collection(assesment.title).add({
//         'title': assesment.title,
//         'score': assesment.score,
//         'date': FieldValue.serverTimestamp(),
//       });
//     } catch (e) {
//       print('Error registering Journal: $e');
//       throw e;
//     }
//   }

//   Future<List<Assessment>> fetchAssesment(String? uid) async {
//     try {
//       List<Assessment> assessments = [];

//       // Get all assessment subcollections under the user's document
//       DocumentSnapshot<Map<String, dynamic>> assessmentCollectionsSnapshot = await _firestore.collection('assessment').doc(uid).get();
      
//       for (var subcollection in assessmentCollectionsSnapshot.reference.collectionNames) {
//         QuerySnapshot subcollectionSnapshot = await _firestore
//             .collection('assessment')
//             .doc(uid)
//             .collection(subcollection)
//             .orderBy('date', descending: true)
//             .get();
        
//         assessments.addAll(subcollectionSnapshot.docs.map((doc) {
//           return Assessment(
//             title: doc['title'],
//             score: doc['score'],
//             date: (doc['date'] as Timestamp).toDate(),
//           );
//         }).toList());
//       }

//       return assessments;
//     } catch (e) {
//       print('Error fetching assessments: $e');
//       throw e;
//     }
//   }

//   Future<void> deleteAssessment(String? uid, String id, String title) async {
//     try {
//       await _firestore.collection('assessment').doc(uid).collection(title).doc(id).delete();
//     } catch (e) {
//       print('Error deleting assessment: $e');
//       throw e;
//     }
//   }
// }
//   Future<List<Assessment>> fetchAssesment(String? uid) async {
//     try {
//       QuerySnapshot querySnapshot = await _firestore
//           .collection('assessment')
//           .doc(uid)
//           .collection('score')
//           .orderBy('date', descending: true)
//           .get();

//       return querySnapshot.docs.map((doc) {
//         return Assessment(
//           title: doc['title'],
//          score: doc['score'],
//           date: (doc['date'] as Timestamp).toDate(), 
//         );
//       }).toList();
//     } catch (e) {
//       print('Error fetching journals: $e');
//       throw e;
//     }
//   }
//   Future<void> deleteAssessment(String? uid, String id) async {
//     try {
//       await _firestore.collection('assessment').doc(uid).collection('score').doc(id).delete();
//     } catch (e) {
//       print('Error deleting assessment: $e');
//       throw e;
//     }
//   }
// }




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
      await userDoc.collection(assessment.title).add({
        'title': assessment.title,
        'score': assessment.score,
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
    try {
      // Delete the assessment document
      await _firestore
          .collection('assessment')
          .doc(uid)
          .collection(assessment.title)
          .doc(assessment.id) // Assuming each assessment has an ID
          .delete();
    } catch (e) {
      print('Error deleting assessment: $e');
      throw e;
    }
  }
  }

