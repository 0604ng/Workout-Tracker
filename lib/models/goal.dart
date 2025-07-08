class Goal {
  final String id;
  final int targetCalories;
  final int targetDuration;
  final DateTime startDate;
  final DateTime endDate;
  final bool completed;

  Goal({
    required this.id,
    required this.targetCalories,
    required this.targetDuration,
    required this.startDate,
    required this.endDate,
    required this.completed,
  });

  factory Goal.fromJson(Map<String, dynamic> json, String id) {
    return Goal(
      id: id,
      targetCalories: json['target_calories'],
      targetDuration: json['target_duration'],
      startDate: (json['start_date'] as Timestamp).toDate(),
      endDate: (json['end_date'] as Timestamp).toDate(),
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'target_calories': targetCalories,
      'target_duration': targetDuration,
      'start_date': startDate,
      'end_date': endDate,
      'completed': completed,
    };
  }
}
