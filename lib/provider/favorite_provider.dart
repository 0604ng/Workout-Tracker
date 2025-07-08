import 'package:flutter/material.dart';
import '../models/favorite.dart';
import '../services/favorite_service.dart';

class FavoriteProvider with ChangeNotifier {
  final FavoriteService _service = FavoriteService();

  List<Favorite> _favorites = [];
  bool _loading = false;
  String? _error;

  List<Favorite> get favorites => _favorites;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> fetchFavorites(String userId) async {
    _setLoading(true);
    try {
      _favorites = await _service.getUserFavorites(userId);
      _error = null;
    } catch (e) {
      _error = 'Failed to load favorites: $e';
    } finally {
      _setLoading(false);
    }
  }

  Future<void> addFavorite(String userId, Favorite fav) async {
    _setLoading(true);
    try {
      await _service.addFavorite(userId, fav);
      await fetchFavorites(userId);
    } catch (e) {
      _error = 'Failed to add favorite: $e';
      _setLoading(false);
    }
  }

  Future<void> deleteFavorite(String userId, String favId) async {
    _setLoading(true);
    try {
      await _service.deleteFavorite(userId, favId);
      await fetchFavorites(userId);
    } catch (e) {
      _error = 'Failed to delete favorite: $e';
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
