import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/favorite.dart';

class FavoriteService {
  final _db = FirebaseFirestore.instance;

  Future<List<Favorite>> getUserFavorites(String userId) async {
    final snapshot = await _db
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .get();
    return snapshot.docs
        .map((doc) => Favorite.fromJson(doc.data(), doc.id))
        .toList();
  }

  Future<void> addFavorite(String userId, Favorite fav) async {
    await _db
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .add(fav.toJson());
  }

  Future<void> deleteFavorite(String userId, String favId) async {
    await _db
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .doc(favId)
        .delete();
  }
}

