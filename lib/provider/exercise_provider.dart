
import 'package:flutter/material.dart';
import '../models/exercise.dart';
import '../services/exercise_service.dart';

class ExerciseProvider with ChangeNotifier {
  final ExerciseService _service = ExerciseService();

  List<Exercise> _exercises = [];
  bool _loading = false;
  String? _error;

  List<Exercise> get exercises => _exercises;
  bool get loading => _loading;
  String? get error => _error;

  /// Load tất cả bài tập từ Firestore
  Future<void> fetchExercises() async {
    _setLoading(true);
    try {
      _exercises = await _service.getAllExercises();
      _error = null;
    } catch (e) {
      _error = 'Failed to load exercises: $e';
    } finally {
      _setLoading(false);
    }
  }

  /// Thêm bài tập mới
  Future<void> addExercise(Exercise ex) async {
    _setLoading(true);
    try {
      await _service.addExercise(ex);
      await fetchExercises();
    } catch (e) {
      _error = 'Failed to add exercise: $e';
      _setLoading(false);
    }
  }

  /// Cập nhật bài tập
  Future<void> updateExercise(Exercise ex) async {
    _setLoading(true);
    try {
      await _service.updateExercise(ex);
      await fetchExercises();
    } catch (e) {
      _error = 'Failed to update exercise: $e';
      _setLoading(false);
    }
  }

  /// Xóa bài tập
  Future<void> deleteExercise(String id) async {
    _setLoading(true);
    try {
      await _service.deleteExercise(id);
      await fetchExercises();
    } catch (e) {
      _error = 'Failed to delete exercise: $e';
      _setLoading(false);
    }
  }

  /// Nội bộ: Cập nhật loading state
  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
