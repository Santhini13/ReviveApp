import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:revive/Models/UserModal.dart';
import 'package:revive/Services/UserService.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseService _firebaseService = FirebaseService();
  Users? _user;

  Users? get user => _user;

  AuthProvider() {
    _firebaseService.authStateChanges().listen((User? firebaseUser) {
      if (firebaseUser != null) {
        _loadUserDetails(firebaseUser.uid,firebaseUser as UserCredential);
      } else {
        _user = null;
        notifyListeners();
      }
    });
  }

  Future<void> _loadUserDetails(String uid,UserCredential firebaseUser) async {

    _user = await _firebaseService.getUserDetails(uid,firebaseUser);
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    await _firebaseService.loginUser(email, password);
  }

  Future<void> register(Users user) async {
    await _firebaseService.registerUser(user);
  }

  Future<void> signOut() async {
    await _firebaseService.signOut();
  }
}