class Exercise {
  final String id;
  final String name;
  final String category;
  final String level;
  final int durationMinutes;
  final int caloriesBurned;
  final bool isPopular;

  Exercise({
    required this.id,
    required this.name,
    required this.category,
    required this.level,
    required this.durationMinutes,
    required this.caloriesBurned,
    required this.isPopular,
  });

  factory Exercise.fromJson(Map<String, dynamic> json, String id) {
    return Exercise(
      id: id,
      name: json['name'],
      category: json['category'],
      level: json['level'],
      durationMinutes: json['duration_minutes'],
      caloriesBurned: json['calories_burned'],
      isPopular: json['is_popular'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'level': level,
      'duration_minutes': durationMinutes,
      'calories_burned': caloriesBurned,
      'is_popular': isPopular,
    };
  }
}
