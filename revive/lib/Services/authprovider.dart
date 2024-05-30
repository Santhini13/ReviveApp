import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:revive/Models/UserModal.dart';
import 'package:revive/Services/UserService.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseService _firebaseService = FirebaseService();
  Users? _user;
String? _uid;
  Users? get user => _user;
  String? get uid => _uid;

  AuthProvider() {
    _firebaseService.authStateChanges().listen((User? firebaseUser) {
      if (firebaseUser != null) {
        _loadUserDetails(firebaseUser.uid);
          notifyListeners();
      } else {
        _user = null;
        notifyListeners();
      }
    });
  }

  //get firebaseUser => null;

  Future<void> _loadUserDetails(String uid) async {
    _user = await _firebaseService.getUserDetails(uid);
    _uid = uid;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    await _firebaseService.loginUser(email, password);
    notifyListeners();
  }

  Future<void> register(Users user) async {
    await _firebaseService.registerUser(user);
     notifyListeners();
  }

  Future<void> signOut() async {
    await _firebaseService.signOut();
     notifyListeners();
  }
}