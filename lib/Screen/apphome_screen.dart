import 'package:flutter/material.dart';
import 'exercises_screen.dart';

class AppHomeScreen extends StatelessWidget {
  const AppHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFCAA88F),
              Color(0xFF1E1E1E),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            // Thay thế Column bằng SingleChildScrollView + Column để giải quyết vấn đề tràn
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  // Welcome card with profile image
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    height: 180,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'WELCOME BACK',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'JOHN !!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Image.asset(
                            'assets/profile_image.png', // Make sure to add this image to your assets
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Progress indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Overall progress:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '70%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Progress bar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: 0.7,
                      minHeight: 12,
                      backgroundColor: Colors.grey[700],
                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFF8C42)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Next workout card
                  _buildWorkoutCard(
                    title: 'Your next workout:',
                    exerciseName: 'Push ups',
                    duration: '30 minutes',
                    reps: '115',
                    sets: '15',
                    exercises: '5',
                  ),
                  const SizedBox(height: 16),
                  // Last workout card
                  _buildWorkoutCard(
                    title: 'Your last workout:',
                    exerciseName: 'Pull ups',
                    duration: '30 minutes',
                    reps: '115',
                    sets: '15',
                    exercises: '5',
                  ),
                  const SizedBox(height: 24),
                  // Create new plan button
                  ElevatedButton.icon(
                    onPressed: () {
                      // Handle create new plan
                    },
                    icon: const Icon(Icons.add, color: Colors.white),
                    label: const Text(
                      'Create new plan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF8C42),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Famous plans button
                  OutlinedButton.icon(
                    onPressed: () {
                      // Handle famous plans
                    },
                    icon: Icon(
                      Icons.bar_chart,
                      color: Color(0xFFFF8C42),
                    ),
                    label: const Text(
                      'FAMOUS PLANS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Color(0xFFFF8C42)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  // Thêm SizedBox để tạo khoảng cách thay vì dùng Spacer
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ),
      ),
      // Di chuyển thanh điều hướng ra ngoài thành widget riêng ở dưới cùng
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavBarItem(icon: Icons.home, isSelected: true),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExercisesScreen()),
                  );
                },
                child: _buildNavBarItem(icon: Icons.fitness_center),
              ),
              _buildNavBarItem(icon: Icons.add_circle_outline),
              _buildNavBarItem(icon: Icons.calendar_today),
              _buildNavBarItem(icon: Icons.person),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWorkoutCard({
    required String title,
    required String exerciseName,
    required String duration,
    required String reps,
    required String sets,
    required String exercises,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Color(0xFFFF8C42),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            exerciseName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          // Làm cho hàng này có thể scroll ngang nếu không đủ không gian
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildWorkoutDetail(label: 'Duration:', value: duration),
                _buildWorkoutDetail(label: 'Reps:', value: reps),
                _buildWorkoutDetail(label: 'Sets:', value: sets),
                _buildWorkoutDetail(label: 'Exercise:', value: exercises),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle start workout
                    },
                    child: const Text(
                      'Start workout',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF8C42),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutDetail({
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavBarItem({
    required IconData icon,
    bool isSelected = false,
  }) {
    return Icon(
      icon,
      color: isSelected ? Color(0xFFFF8C42) : Colors.grey,
      size: 28,
    );
  }
}