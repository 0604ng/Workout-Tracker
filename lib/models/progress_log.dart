class ProgressLog {
  final String id;
  final String userId;
  final String workoutId;
  final DateTime performedAt;
  final int totalTime;
  final int caloriesBurned;
  final String notes;

  ProgressLog({
    required this.id,
    required this.userId,
    required this.workoutId,
    required this.performedAt,
    required this.totalTime,
    required this.caloriesBurned,
    required this.notes,
  });

  factory ProgressLog.fromJson(Map<String, dynamic> json, String id) {
    return ProgressLog(
      id: id,
      userId: json['user_id'],
      workoutId: json['workout_id'],
      performedAt: (json['performed_at'] as Timestamp).toDate(),
      totalTime: json['total_time'],
      caloriesBurned: json['calories_burned'],
      notes: json['notes'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'workout_id': workoutId,
      'performed_at': performedAt,
      'total_time': totalTime,
      'calories_burned': caloriesBurned,
      'notes': notes,
    };
  }
}
