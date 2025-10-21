import 'package:flutter/material.dart';
import '../models/exercise_log.dart';
import '../services/exercise_log_service.dart';


class ExerciseLogProvider with ChangeNotifier {
  final ExerciseLogService _service = ExerciseLogService();

  List<ExerciseLog> _logs = [];
  bool _loading = false;
  String? _error;

  List<ExerciseLog> get logs => _logs;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> fetchLogs(String workoutId) async {
    _setLoading(true);
    try {
      _logs = await _service.getExerciseLogs(workoutId);
      _error = null;
    } catch (e) {
      _error = 'Failed to load exercise logs: $e';
    } finally {
      _setLoading(false);
    }
  }

  Future<void> addLog(String workoutId, ExerciseLog log) async {
    _setLoading(true);
    try {
      await _service.addExerciseLog(workoutId, log);
      await fetchLogs(workoutId);
    } catch (e) {
      _error = 'Failed to add exercise log: $e';
      _setLoading(false);
    }
  }

  Future<void> updateLog(String workoutId, ExerciseLog log) async {
    _setLoading(true);
    try {
      await _service.updateExerciseLog(workoutId, log);
      await fetchLogs(workoutId);
    } catch (e) {
      _error = 'Failed to update exercise log: $e';
      _setLoading(false);
    }
  }

  Future<void> deleteLog(String workoutId, String logId) async {
    _setLoading(true);
    try {
      await _service.deleteExerciseLog(workoutId, logId);
      await fetchLogs(workoutId);
    } catch (e) {
      _error = 'Failed to delete exercise log: $e';
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
