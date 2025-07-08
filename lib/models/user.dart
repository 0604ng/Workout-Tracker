class User {
  final String id;
  final String name;
  final String email;
  final String role;
  final DateTime createdAt;
  final int streak;
  final int weeklyGoal;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.createdAt,
    required this.streak,
    required this.weeklyGoal,
  });

  factory User.fromJson(Map<String, dynamic> json, String id) {
    return User(
      id: id,
      name: json['name'],
      email: json['email'],
      role: json['role'],
      createdAt: (json['created_at'] as Timestamp).toDate(),
      streak: json['streak'],
      weeklyGoal: json['weekly_goal'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'role': role,
      'created_at': createdAt,
      'streak': streak,
      'weekly_goal': weeklyGoal,
    };
  }
}
