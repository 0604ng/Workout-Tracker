import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/exercise.dart';

class ExerciseService {
  final _db = FirebaseFirestore.instance;

  Future<List<Exercise>> getAllExercises() async {
    final snapshot = await _db.collection('exercises').get();
    return snapshot.docs
        .map((doc) => Exercise.fromJson(doc.data(), doc.id))
        .toList();
  }

  Future<void> addExercise(Exercise exercise) async {
    await _db.collection('exercises').add(exercise.toJson());
  }

  Future<void> updateExercise(Exercise exercise) async {
    await _db.collection('exercises').doc(exercise.id).update(exercise.toJson());
  }

  Future<void> deleteExercise(String id) async {
    await _db.collection('exercises').doc(id).delete();
  }
}
