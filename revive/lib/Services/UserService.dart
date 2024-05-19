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
      });
    } catch (e) {
      print('Error registering user: $e');
      throw e;
    }
  }
  Future<Users?> loginUser(String email,String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
      Users? user= await getUserDetails(userCredential.user!.uid, userCredential);
      return user;
      } else {
        print('user is null');
        return null;
      }
      
    } catch (e) {
      print('Error logging in user: $e');
      throw (e);
    }
  }
  Future<Users?>getUserDetails(String uid,UserCredential userCredential)async {
      DocumentSnapshot<Map<String, dynamic>> userDoc = await _firestore.collection('users').doc(uid).get();
        if (userDoc.exists) {
          Map<String, dynamic>? userData = userDoc.data();
      
          return Users(
            username: userData!['username'],
            phoneNumber: userData['phoneNumber'],
            email: userData['email'],
            role: userData['role'], 
            uid: uid, 
            password: '', 
          );
        } else {
          return Users(
            username: 'admin',
            phoneNumber: '',
            email: userCredential.user!.email.toString(),
            role: 'Admin', 
            uid: uid, 
            password: '', 
          );
        }

  }
  Stream<User?> authStateChanges() {
    return _auth.authStateChanges();
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

