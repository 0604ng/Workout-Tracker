import 'package:cloud_firestore/cloud_firestore.dart';

class Workout {
  final String id;
  final String userId;
  final String title;
  final String description;
  final DateTime createdAt;

  Workout({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  factory Workout.fromJson(Map<String, dynamic> json, String id) {
    return Workout(
      id: id,
      userId: json['user_id'],
      title: json['title'],
      description: json['description'],
      createdAt: (json['created_at'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'title': title,
      'description': description,
      'created_at': createdAt,
    };
  }
}
