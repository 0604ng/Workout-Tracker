import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';

class UserService {
  final _db = FirebaseFirestore.instance;

  Future<User?> getUserById(String id) async {
    final doc = await _db.collection('users').doc(id).get();
    if (!doc.exists) return null;
    return User.fromJson(doc.data()!, doc.id);
  }

  Future<void> addUser(User user) async {
    await _db.collection('users').doc(user.id).set(user.toJson());
  }

  Future<void> updateUser(User user) async {
    await _db.collection('users').doc(user.id).update(user.toJson());
  }

  Future<void> deleteUser(String id) async {
    await _db.collection('users').doc(id).delete();
  }
}
