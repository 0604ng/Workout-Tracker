import 'package:cloud_firestore/cloud_firestore.dart';

class Goal {
  final String id;
  final String userId;
  final int targetCalories;
  final int targetDuration;
  final DateTime startDate;
  final DateTime endDate;
  final bool completed;

  Goal({
    required this.id,
    required this.userId,
    required this.targetCalories,
    required this.targetDuration,
    required this.startDate,
    required this.endDate,
    required this.completed,
  });

  factory Goal.fromJson(Map<String, dynamic> json, String id) {
    return Goal(
      id: id,
      userId: json['user_id'] ?? '',
      targetCalories: json['target_calories'] ?? 0,
      targetDuration: json['target_duration'] ?? 0,
      startDate: (json['start_date'] as Timestamp).toDate(),
      endDate: (json['end_date'] as Timestamp).toDate(),
      completed: json['completed'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'target_calories': targetCalories,
      'target_duration': targetDuration,
      'start_date': Timestamp.fromDate(startDate),
      'end_date': Timestamp.fromDate(endDate),
      'completed': completed,
    };
  }
}
