class ExerciseLog {
  final String id;
  final String exerciseId;
  final int durationMinutes;
  final int caloriesBurned;

  ExerciseLog({
    required this.id,
    required this.exerciseId,
    required this.durationMinutes,
    required this.caloriesBurned,
  });

  factory ExerciseLog.fromJson(Map<String, dynamic> json, String id) {
    return ExerciseLog(
      id: id,
      exerciseId: json['exercise_id'],
      durationMinutes: json['duration_minutes'],
      caloriesBurned: json['calories_burned'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exercise_id': exerciseId,
      'duration_minutes': durationMinutes,
      'calories_burned': caloriesBurned,
    };
  }
}
