
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:revive/Models/activityModal.dart';

// // class ActivityService {
// //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// //   Future<List<Activity>> getActivities() async {
// //     try {
// //       QuerySnapshot querySnapshot = await _firestore.collection('activities').get();
// //       return querySnapshot.docs.map((doc) {
// //         return Activity.fromFirestore(doc);
// //       }).toList();
// //     } catch (e) {
// //       print('Error fetching activities: $e');
// //       throw e;
// //     }
// //   }

// //   Future<void> markActivityAsCompleted(String uid, int index) async {
// //     try {
// //       DocumentReference activityRef = _firestore.collection('users').doc(uid).collection('activities').doc(index.toString());
// //       await activityRef.set({
// //         'completed': true,
// //         'completionTime': DateTime.now(),
// //       }, SetOptions(merge: true));
// //     } catch (e) {
// //       print('Error marking activity as completed: $e');
// //       throw e;
// //     }
// //   }

// //   Future<List<Activity>> fetchUserActivities(String uid) async {
// //     try {
// //       QuerySnapshot querySnapshot = await _firestore.collection('users').doc(uid).collection('activities').get();
// //       return querySnapshot.docs.map((doc) {
// //         return Activity.fromFirestore(doc);
// //       }).toList();
// //     } catch (e) {
// //       print('Error fetching user activities: $e');
// //       throw e;
// //     }
// //   }
// // }


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:revive/Models/activityModal.dart';
// class ActivityService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<List<Activity>> getActivities() async {
//     try {
//       QuerySnapshot querySnapshot = await _firestore.collection('activities').get();
//       return querySnapshot.docs.map((doc) {
//         return Activity.fromFirestore(doc);
//       }).toList();
//     } catch (e) {
//       print('Error fetching activities: $e');
//       throw e;
//     }
//   }

//   Future<void> markActivityAsCompleted(String uid, String activityId) async {
//     try {
//       DocumentReference activityRef = _firestore.collection('users').doc(uid).collection('activities').doc(activityId);
//       await activityRef.set({
//         'completed': true,
//         'completionTime': DateTime.now(),
//       }, SetOptions(merge: true));
//     } catch (e) {
//       print('Error marking activity as completed: $e');
//       throw e;
//     }
//   }

//   Future<List<Activity>> fetchUserActivities(String uid) async {
//     try {
//       QuerySnapshot querySnapshot = await _firestore.collection('users').doc(uid).collection('activities').get();
//       return querySnapshot.docs.map((doc) {
//         return Activity.fromFirestore(doc);
//       }).toList();
//     } catch (e) {
//       print('Error fetching user activities: $e');
//       throw e;
//     }
//   }

//   Future<List<Activity>> getMergedActivities(String uid) async {
//     try {
//       List<Activity> allActivities = await getActivities();
//       List<Activity> userActivities = await fetchUserActivities(uid);

//       // Create a map of completed activities for easier access
//       Map<String, Activity> completedActivitiesMap = {
//         for (var activity in userActivities) activity.id: activity
//       };

//       // Update the completion status in all activities
//       for (var activity in allActivities) {
//         if (completedActivitiesMap.containsKey(activity.id)) {
//           activity.completed = true;
//           activity.completionTime = completedActivitiesMap[activity.id]!.completionTime;
//         }
//       }

//       return allActivities;
//     } catch (e) {
//       print('Error fetching merged activities: $e');
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
      return querySnapshot.docs.map((doc) {
        return Activity.fromFirestore(doc);
      }).toList();
    } catch (e) {
      print('Error fetching activities: $e');
      throw e;
    }
  }

  Future<void> markActivityAsCompleted(String uid, String activityId) async {
    try {
      DocumentReference activityRef = _firestore.collection('users').doc(uid).collection('activities').doc(activityId);
      await activityRef.set({
        'completed': true,
        'completionTime': DateTime.now(),
      }, SetOptions(merge: true));
    } catch (e) {
      print('Error marking activity as completed: $e');
      throw e;
    }
  }

  Future<List<Activity>> fetchUserActivities(String uid) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('users').doc(uid).collection('activities').get();
      return querySnapshot.docs.map((doc) {
        return Activity.fromFirestore(doc);
      }).toList();
    } catch (e) {
      print('Error fetching user activities: $e');
      throw e;
    }
  }

  Future<List<Activity>> getMergedActivities(String uid) async {
    try {
      List<Activity> allActivities = await getActivities();
      List<Activity> userActivities = await fetchUserActivities(uid);

      // Create a map of completed activities for easier access
      Map<String, Activity> completedActivitiesMap = {
        for (var activity in userActivities) activity.id: activity
      };

      // Update the completion status in all activities
      for (var activity in allActivities) {
        if (completedActivitiesMap.containsKey(activity.id)) {
          activity.completed = true;
          activity.completionTime = completedActivitiesMap[activity.id]!.completionTime;
        }
      }

      return allActivities;
    } catch (e) {
      print('Error fetching merged activities: $e');
      throw e;
    }
  }

  Future<void> clearAllActivities(String userId) async {
    try {
      QuerySnapshot activitiesSnapshot = await _firestore.collection('users').doc(userId).collection('activities').get();
      for (var doc in activitiesSnapshot.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      print('Error clearing all activities: $e');
      throw e;
    }
  }

  Future<void> unmarkAllActivities(String userId) async {
    try {
      QuerySnapshot activitiesSnapshot = await _firestore.collection('users').doc(userId).collection('activities').get();
      for (var doc in activitiesSnapshot.docs) {
        await doc.reference.update({'completed': false});
      }
    } catch (e) {
      print('Error unmarking all activities: $e');
      throw e;
    }
  }
}

