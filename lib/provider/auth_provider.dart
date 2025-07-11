import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../exceptions/firebase_error_handler.dart';

class AppAuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // LOGIN
  Future<void> login(String email, String password) async {
    _setLoading(true);
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseErrorHandler.toException(e);
    } finally {
      _setLoading(false);
    }
  }

  // REGISTER
  Future<void> register({
    required String username,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required DateTime dateOfBirth,
  }) async {
    _setLoading(true);
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .set({
        'username': username,
        'firstName': firstName,
        'lastName': lastName,
        'dateOfBirth': dateOfBirth.toIso8601String(),
        'email': email,
        'createdAt': DateTime.now().toIso8601String(),
      });
    } on FirebaseAuthException catch (e) {
      throw FirebaseErrorHandler.toException(e);
    } finally {
      _setLoading(false);
    }
  }

  // SEND RESET EMAIL
  Future<void> sendPasswordResetEmail(String email) async {
    _setLoading(true);
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw FirebaseErrorHandler.toException(e);
    } finally {
      _setLoading(false);
    }
  }

  // Wrapper
  Future<String?> sendResetEmail(String email) async {
    if (email.isEmpty) return 'Email cannot be empty';
    try {
      await sendPasswordResetEmail(email);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  // ✅ ADD THIS LOGOUT METHOD
  Future<void> logout() async {
    _setLoading(true);
    try {
      await _auth.signOut();
    } catch (e) {
      debugPrint('Logout failed: $e');
    } finally {
      _setLoading(false);
    }
  }
}
