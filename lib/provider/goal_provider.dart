import 'package:flutter/material.dart';
import '../models/goal.dart';
import '../services/goal_service.dart';

class GoalProvider with ChangeNotifier {
  final GoalService _service = GoalService();

  List<Goal> _goals = [];
  bool _loading = false;
  String? _error;

  List<Goal> get goals => _goals;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> fetchGoals(String userId) async {
    _setLoading(true);
    try {
      _goals = await _service.getUserGoals(userId);
      _error = null;
    } catch (e) {
      _error = 'Failed to load goals: $e';
    } finally {
      _setLoading(false);
    }
  }

  Future<void> addGoal(Goal goal) async {
    _setLoading(true);
    try {
      await _service.addGoal(goal);
      await fetchGoals(goal.userId);
    } catch (e) {
      _error = 'Failed to add goal: $e';
      _setLoading(false);
    }
  }

  Future<void> updateGoal(Goal goal) async {
    _setLoading(true);
    try {
      await _service.updateGoal(goal);
      await fetchGoals(goal.userId);
    } catch (e) {
      _error = 'Failed to update goal: $e';
      _setLoading(false);
    }
  }

  Future<void> deleteGoal(String id, String userId) async {
    _setLoading(true);
    try {
      await _service.deleteGoal(id);
      await fetchGoals(userId);
    } catch (e) {
      _error = 'Failed to delete goal: $e';
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
