import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:revive/Models/UserModal.dart';


class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<void> registerUser(Users user) async {
    try {
       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
     );
     String uid=userCredential.user!.uid;
     await _firestore.collection('users').doc(uid).set({
        'username': user.username,
        'phoneNumber': user.phoneNumber,
        'email': user.email,
        'role':user.role
        // Do not store the password directly for security reasons
      });
      //await _firestore.collection('users').add(user.toJson());
      //await _firestore.collection('users').doc(uid).set(user.toJson());
    } catch (e) {
      print('Error registering user: $e');
      throw e;
    }
  }
}
