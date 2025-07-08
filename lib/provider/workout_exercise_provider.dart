import 'package:flutter/material.dart';
import '../models/workout_exercise.dart';
import '../services/workout_exercise_service.dart';

class WorkoutExerciseProvider with ChangeNotifier {
  final WorkoutExerciseService _service = WorkoutExerciseService();

  List<WorkoutExercise> _exercises = [];
  bool _loading = false;
  String? _error;

  List<WorkoutExercise> get exercises => _exercises;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> fetchExercises(String workoutId) async {
    _setLoading(true);
    try {
      _exercises = await _service.getExercisesForWorkout(workoutId);
      _error = null;
    } catch (e) {
      _error = 'Failed to load workout exercises: $e';
    } finally {
      _setLoading(false);
    }
  }

  Future<void> addExercise(String workoutId, WorkoutExercise ex) async {
    _setLoading(true);
    try {
      await _service.addExerciseToWorkout(workoutId, ex);
      await fetchExercises(workoutId);
    } catch (e) {
      _error = 'Failed to add exercise: $e';
      _setLoading(false);
    }
  }

  Future<void> updateExercise(String workoutId, WorkoutExercise ex) async {
    _setLoading(true);
    try {
      await _service.updateExerciseInWorkout(workoutId, ex);
      await fetchExercises(workoutId);
    } catch (e) {
      _error = 'Failed to update exercise: $e';
      _setLoading(false);
    }
  }

  Future<void> deleteExercise(String workoutId, String exId) async {
    _setLoading(true);
    try {
      await _service.deleteExerciseFromWorkout(workoutId, exId);
      await fetchExercises(workoutId);
    } catch (e) {
      _error = 'Failed to delete exercise: $e';
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
