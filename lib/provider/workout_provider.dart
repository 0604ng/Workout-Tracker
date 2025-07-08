import 'package:flutter/material.dart';
import '../models/workout.dart';
import '../services/workout_service.dart';

class WorkoutProvider with ChangeNotifier {
  final WorkoutService _service = WorkoutService();

  List<Workout> _workouts = [];
  bool _loading = false;
  String? _error;

  List<Workout> get workouts => _workouts;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> fetchWorkouts(String userId) async {
    _setLoading(true);
    try {
      _workouts = await _service.getUserWorkouts(userId);
      _error = null;
    } catch (e) {
      _error = 'Failed to load workouts: $e';
    } finally {
      _setLoading(false);
    }
  }

  Future<void> addWorkout(Workout workout) async {
    _setLoading(true);
    try {
      await _service.addWorkout(workout);
      await fetchWorkouts(workout.userId);
    } catch (e) {
      _error = 'Failed to add workout: $e';
      _setLoading(false);
    }
  }

  Future<void> updateWorkout(Workout workout) async {
    _setLoading(true);
    try {
      await _service.updateWorkout(workout);
      await fetchWorkouts(workout.userId);
    } catch (e) {
      _error = 'Failed to update workout: $e';
      _setLoading(false);
    }
  }

  Future<void> deleteWorkout(String id, String userId) async {
    _setLoading(true);
    try {
      await _service.deleteWorkout(id);
      await fetchWorkouts(userId);
    } catch (e) {
      _error = 'Failed to delete workout: $e';
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
