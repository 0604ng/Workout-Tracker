import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/workout_exercise.dart';

class WorkoutExerciseService {
  final _db = FirebaseFirestore.instance;

  Future<List<WorkoutExercise>> getExercisesForWorkout(String workoutId) async {
    final snapshot = await _db
        .collection('workouts')
        .doc(workoutId)
        .collection('exercises')
        .get();
    return snapshot.docs
        .map((doc) => WorkoutExercise.fromJson(doc.data(), doc.id))
        .toList();
  }

  Future<void> addExerciseToWorkout(String workoutId, WorkoutExercise ex) async {
    await _db
        .collection('workouts')
        .doc(workoutId)
        .collection('exercises')
        .add(ex.toJson());
  }

  Future<void> updateExerciseInWorkout(
      String workoutId, WorkoutExercise ex) async {
    await _db
        .collection('workouts')
        .doc(workoutId)
        .collection('exercises')
        .doc(ex.id)
        .update(ex.toJson());
  }

  Future<void> deleteExerciseFromWorkout(String workoutId, String exId) async {
    await _db
        .collection('workouts')
        .doc(workoutId)
        .collection('exercises')
        .doc(exId)
        .delete();
  }
}
