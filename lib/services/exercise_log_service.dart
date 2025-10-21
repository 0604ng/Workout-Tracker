import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/exercise_log.dart';

class ExerciseLogService {
  final _db = FirebaseFirestore.instance;

  Future<List<ExerciseLog>> getExerciseLogs(String workoutId) async {
    final snapshot = await _db
        .collection('progress_logs')
        .doc(workoutId)
        .collection('exercise_logs')
        .get();
    return snapshot.docs
        .map((doc) => ExerciseLog.fromJson(doc.data(), doc.id))
        .toList();
  }

  Future<void> addExerciseLog(
      String workoutId, ExerciseLog log) async {
    await _db
        .collection('progress_logs')
        .doc(workoutId)
        .collection('exercise_logs')
        .add(log.toJson());
  }

  Future<void> updateExerciseLog(
      String workoutId, ExerciseLog log) async {
    await _db
        .collection('progress_logs')
        .doc(workoutId)
        .collection('exercise_logs')
        .doc(log.id)
        .update(log.toJson());
  }

  Future<void> deleteExerciseLog(
      String workoutId, String logId) async {
    await _db
        .collection('progress_logs')
        .doc(workoutId)
        .collection('exercise_logs')
        .doc(logId)
        .delete();
  }
}

