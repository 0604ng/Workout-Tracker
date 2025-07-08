class Favorite {
  final String id;
  final String exerciseId;

  Favorite({
    required this.id,
    required this.exerciseId,
  });

  factory Favorite.fromJson(Map<String, dynamic> json, String id) {
    return Favorite(
      id: id,
      exerciseId: json['exercise_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exercise_id': exerciseId,
    };
  }
}
