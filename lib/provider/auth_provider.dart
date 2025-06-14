import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppAuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Login bằng email/password
  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      _handleFirebaseAuthError(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }



  // Đăng ký tài khoản mới
  Future<void> register({
    required String username,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required DateTime dateOfBirth,
  }) async {
    _isLoading = true;
    notifyListeners();

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
      throw e.message ?? "Registration failed";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }


  // Gửi email đặt lại mật khẩu
  Future<void> sendPasswordResetEmail(String email) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Failed to send password reset email";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Wrapper trả về lỗi dạng String hoặc null
  Future<String?> sendResetEmail(String email) async {
    if (email.isEmpty) return 'Email cannot be empty';

    try {
      await sendPasswordResetEmail(email);
      return null;
    } catch (e) {
      return e.toString();
    }
  }
  void _handleFirebaseAuthError(dynamic error) {
    // Bạn có thể tùy chỉnh xử lý lỗi tại đây
    if (error.toString().contains('user-not-found')) {
      throw Exception('No user found for that email.');
    } else if (error.toString().contains('wrong-password')) {
      throw Exception('Wrong password provided.');
    } else {
      throw Exception('Login failed. Please try again.');
    }
  }

}
