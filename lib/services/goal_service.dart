import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/goal.dart';

class GoalService {
  final _db = FirebaseFirestore.instance;

  Future<List<Goal>> getUserGoals(String userId) async {
    final snapshot = await _db
        .collection('goals')
        .where('user_id', isEqualTo: userId)
        .get();
    return snapshot.docs
        .map((doc) => Goal.fromJson(doc.data(), doc.id))
        .toList();
  }

  Future<void> addGoal(Goal goal) async {
    await _db.collection('goals').add(goal.toJson());
  }

  Future<void> updateGoal(Goal goal) async {
    await _db.collection('goals').doc(goal.id).update(goal.toJson());
  }

  Future<void> deleteGoal(String id) async {
    await _db.collection('goals').doc(id).delete();
  }
}
