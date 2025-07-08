import 'package:flutter/material.dart';
import '../models/progress_log.dart';
import '../services/progress_log_service.dart';

class ProgressLogProvider with ChangeNotifier {
  final ProgressLogService _service = ProgressLogService();

  List<ProgressLog> _logs = [];
  bool _loading = false;
  String? _error;

  List<ProgressLog> get logs => _logs;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> fetchLogs(String userId) async {
    _setLoading(true);
    try {
      _logs = await _service.getUserProgressLogs(userId);
      _error = null;
    } catch (e) {
      _error = 'Failed to load logs: $e';
    } finally {
      _setLoading(false);
    }
  }

  Future<void> addLog(ProgressLog log) async {
    _setLoading(true);
    try {
      await _service.addProgressLog(log);
      await fetchLogs(log.userId);
    } catch (e) {
      _error = 'Failed to add log: $e';
      _setLoading(false);
    }
  }

  Future<void> updateLog(ProgressLog log) async {
    _setLoading(true);
    try {
      await _service.updateProgressLog(log);
      await fetchLogs(log.userId);
    } catch (e) {
      _error = 'Failed to update log: $e';
      _setLoading(false);
    }
  }

  Future<void> deleteLog(String id, String userId) async {
    _setLoading(true);
    try {
      await _service.deleteProgressLog(id);
      await fetchLogs(userId);
    } catch (e) {
      _error = 'Failed to delete log: $e';
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
