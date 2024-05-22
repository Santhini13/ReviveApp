import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:revive/Models/dashboardModal.dart';

class DashboardService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<DashboardItem>> fetchDashboardItems() async {
    String uid = _auth.currentUser!.uid;

    try {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(uid).get();
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;

      int exerciseCompletedCount = userData['exerciseCompletedCount'] ?? 0;
      int challengeCompletedCount = userData['challengeCompletedCount'] ?? 0;

      List<DashboardItem> dashboardItems = [
        DashboardItem(
          title: 'Exercises',
          progress: exerciseCompletedCount / 7,
          daysLeft:7 - exerciseCompletedCount,
          markedDayCompleted: exerciseCompletedCount,
        ),
        DashboardItem(
          title: '21-Day Challenge',
          progress: challengeCompletedCount / 21,
          daysLeft: 21- challengeCompletedCount,
          markedDayCompleted: challengeCompletedCount,
        ),
      ];

      return dashboardItems;
    } catch (e) {
      print('Error fetching dashboard items: $e');
      throw e;
    }
  }
}
