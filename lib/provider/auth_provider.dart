import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Fake delay for demo, replace with real API call
      await Future.delayed(const Duration(seconds: 2));

      if (email == "test@example.com" && password == "123456") {
        // Login thành công
      } else {
        throw Exception("Invalid credentials");
      }
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
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
      // Replace with real API call
      await Future.delayed(const Duration(seconds: 2));

      if (username.length < 3 || password.length < 6) {
        throw Exception("Invalid registration info");
      }

      // Save token or user info if needed

    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  Future<void> sendPasswordResetEmail(String email) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Replace with real backend call
      await Future.delayed(const Duration(seconds: 2));

      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
        throw Exception("Invalid email format");
      }

      // Fake logic – bạn có thể gửi API tới /forgot-password

    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  Future<String?> sendResetEmail(String email) async {
    if (email.isEmpty) return 'Email cannot be empty';

    try {
      _isLoading = true;
      notifyListeners();

      await sendPasswordResetEmail(email); // Gọi API

      return null; // success
    } catch (e) {
      return 'Error: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}


