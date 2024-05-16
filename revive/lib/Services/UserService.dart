import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revive/Models/UserModal.dart';


class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerUser(User user) async {
    try {
      await _firestore.collection('users').add(user.toJson());
    } catch (e) {
      print('Error registering user: $e');
      throw e;
    }
  }
}
