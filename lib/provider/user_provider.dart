import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/user_service.dart';

class UserProvider with ChangeNotifier {
  final UserService _service = UserService();

  User? _user;
  bool _loading = false;
  String? _error;

  User? get user => _user;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> fetchUser(String id) async {
    _setLoading(true);
    try {
      _user = await _service.getUserById(id);
      _error = null;
    } catch (e) {
      _error = 'Failed to load user: $e';
    } finally {
      _setLoading(false);
    }
  }

  void clear() {
    _user = null;
    notifyListeners();
  }

  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
