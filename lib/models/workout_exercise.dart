class WorkoutExercise {
  final String id;
  final String exerciseId;
  final int orderIndex;

  WorkoutExercise({
    required this.id,
    required this.exerciseId,
    required this.orderIndex,
  });

  factory WorkoutExercise.fromJson(Map<String, dynamic> json, String id) {
    return WorkoutExercise(
      id: id,
      exerciseId: json['exercise_id'],
      orderIndex: json['order_index'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exercise_id': exerciseId,
      'order_index': orderIndex,
    };
  }
}
