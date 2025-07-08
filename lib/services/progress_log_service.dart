import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/progress_log.dart';

class ProgressLogService {
  final _db = FirebaseFirestore.instance;

  Future<List<ProgressLog>> getUserProgressLogs(String userId) async {
    final snapshot = await _db
        .collection('progress_logs')
        .where('user_id', isEqualTo: userId)
        .get();
    return snapshot.docs
        .map((doc) => ProgressLog.fromJson(doc.data(), doc.id))
        .toList();
  }

  Future<void> addProgressLog(ProgressLog log) async {
    await _db.collection('progress_logs').add(log.toJson());
  }

  Future<void> updateProgressLog(ProgressLog log) async {
    await _db
        .collection('progress_logs')
        .doc(log.id)
        .update(log.toJson());
  }

  Future<void> deleteProgressLog(String id) async {
    await _db.collection('progress_logs').doc(id).delete();
  }
}
