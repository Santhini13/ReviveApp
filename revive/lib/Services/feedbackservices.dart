// // feedback_service.dart
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:revive/Models/feedbackModal.dart';


// class FeedbackService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<String?> getCurrentUserUid() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     return user?.uid;

//   }

//   Future<void> registerFeedback(FeedbackModel feedback, String therapistUid) async {
//     if (therapistUid.isEmpty) {
//       print('Error: Therapist ID is empty');
//       throw Exception('Therapist ID is empty');
//     }

//     String? currentUserUid = await getCurrentUserUid();
//     if (currentUserUid == null || currentUserUid.isEmpty) {
//       print('Error: Current User ID is null or empty');
//       throw Exception('Current User ID is null or empty');
//     }

//     try {
//       await _firestore
//           .collection('therapists')
//           .doc(therapistUid)
//           .collection('feedbacks')
//           .doc(feedback.id)
//           .set({
//         'feedbackMessage': feedback.feedbackMessage,
//         'rating': feedback.rating,
//         'id': feedback.id,
//         'date': FieldValue.serverTimestamp(),
//         'submittedBy': currentUserUid,
//       });
//     } catch (e) {
//       print('Error registering feedback: $e');
//       throw e;
//     }
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revive/Models/feedbackModal.dart';

// class RatingService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//    Future<String?> fetchTherapistUid(String uid) async {
//     try {
//       DocumentSnapshot doc = await _firestore.collection('therapists').doc(uid).get();
//       if (doc.exists) {
//         return doc.id;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print('Error fetching therapist UID: $e');
//       throw e;
//     }
//   }

//   Future<void> registerFeedback(String? uid,Rating rating,String? thid) async {
//     try {
//        String? id= await fetchTherapistUid(thid!);
//        if(id!=null){
//       await _firestore.collection('Feedbacks').doc(uid).collection('feedback').doc(id).set({
//          'therapist':id,
//         'id': rating.id,
//         'message':rating.feedbackMessage,
//         'rating': rating.rating,
//         'date': DateTime.now(),
//       });}
//     } catch (e) {
//       print('Error registering Article: $e');
//       throw e;
//     }
//   }

// }


class RatingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to fetch therapist UID
  Future<String?> fetchTherapistUid(String uid) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('therapists').doc(uid).get();
      if (doc.exists) {
        return doc.id;
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching therapist UID: $e');
      throw e;
    }
  }

  // Method to register feedback
  Future<void> registerFeedback(String? currentUserUid, Rating rating, String? therapistUid) async {
    try {
      // Fetch the actual therapist UID dynamically
      String? fetchedTherapistUid = await fetchTherapistUid(therapistUid!);
      if (fetchedTherapistUid != null) {
        await _firestore.collection('Feedbacks').doc(currentUserUid).collection('feedback').doc(fetchedTherapistUid).set({
          'therapist': fetchedTherapistUid,
          'id': rating.id,
          'message': rating.feedbackMessage,
          'rating': rating.rating,
          'date': DateTime.now(),
        });
      } else {
        print('Therapist UID not found');
        throw Exception('Therapist UID not found');
      }
    } catch (e) {
      print('Error registering feedback: $e');
      throw e;
    }
  }
}