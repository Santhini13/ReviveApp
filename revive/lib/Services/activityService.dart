// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:revive/Models/activityModal.dart';

// class ActivityService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<List<Activity>> fetchActivities() async {
//     try {
//       QuerySnapshot querySnapshot = await _firestore.collection('activities').get();
//       return querySnapshot.docs.map((doc) => Activity.fromFirestore(doc)).toList();
//     } catch (e) {
//       print('Error fetching activities: $e');
//       throw e;
//     }
//   }

//   Future<void> markActivityAsCompleted(String uid, int index) async {
//     try {
//       await _firestore.collection('users').doc(uid).collection('activities').doc('activity${index + 1}').set({
//         'completed': true,
//         'completion_time': DateTime.now(),
//       });
//     } catch (e) {
//       print('Error marking activity as completed: $e');
//       throw e;
//     }
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revive/Models/activityModal.dart';

class ActivityService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Activity>> getActivities() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('activities').get();

      return querySnapshot.docs.map((doc) => Activity.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error fetching activities: $e');
      throw e;
    }
  }

  Future<List<Activity>> fetchActivities(String uid) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('users').doc(uid).collection('activities').get();
      return querySnapshot.docs.map((doc) => Activity.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error fetching activities: $e');
      throw e;
    }
  }

  Future<void> markActivityAsCompleted(String uid, int index) async {
    try {
      await _firestore.collection('users').doc(uid).collection('activities').doc('activity${index + 1}').update({
        'completed': true,
        'completion_time': DateTime.now(),
      });
    } catch (e) {
      print('Error marking activity as completed: $e');
      throw e;
    }
  }
}

