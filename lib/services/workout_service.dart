import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/workout.dart';

class WorkoutService {
  final _db = FirebaseFirestore.instance;

  Future<List<Workout>> getUserWorkouts(String userId) async {
    final snapshot = await _db
        .collection('workouts')
        .where('user_id', isEqualTo: userId)
        .get();
    return snapshot.docs
        .map((doc) => Workout.fromJson(doc.data(), doc.id))
        .toList();
  }

  Future<void> addWorkout(Workout workout) async {
    await _db.collection('workouts').add(workout.toJson());
  }

  Future<void> updateWorkout(Workout workout) async {
    await _db.collection('workouts').doc(workout.id).update(workout.toJson());
  }

  Future<void> deleteWorkout(String id) async {
    await _db.collection('workouts').doc(id).delete();
  }
}
