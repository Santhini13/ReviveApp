import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revive/Models/challengeModal.dart';

class ChallengeService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ChallengeDay>> fetchChallengeDays(String uid) async {
    QuerySnapshot snapshot = await _firestore
        .collection('users')
        .doc(uid)
        .collection('challengeDays')
        .get();

    return snapshot.docs.map((doc) {
      return ChallengeDay.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
  }

  Future<void> updateChallengeDay(String userId, ChallengeDay day) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('challengeDays')
        .doc(day.id)
        .set(day.toMap());
  }
}
