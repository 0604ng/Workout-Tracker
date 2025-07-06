import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CaloriesScreen extends StatelessWidget {
  const CaloriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'Calories',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            Center(
              child: CircularPercentIndicator(
                radius: 100.0,
                lineWidth: 16.0,
                percent: 0.75,
                animation: true,
                animationDuration: 1000,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: const Color(0xFFFF8C42),
                backgroundColor: Colors.black,
                center: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "30000",
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      "cal",
                      style: TextStyle(color: Colors.white70),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.local_fire_department, color: Colors.white, size: 20),
                SizedBox(width: 6),
                Text(
                  "Total Calories burned",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFFF8C42), width: 1.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Text(
                    'Add calories',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(Icons.add, color: Color(0xFFFF8C42))
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Row(
              children: [
                Text("This week", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(width: 6),
                Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white)
              ],
            ),
            const SizedBox(height: 12),
            _buildWorkoutTile('Today:', 150, 'Push ups', '100/100'),
            const SizedBox(height: 12),
            _buildWorkoutTile('Tuesday:', 85, 'Squats', '100/100'),
            const SizedBox(height: 12),
            _buildWorkoutTile('Monday', 165, 'Deadlift', '100/100'),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutTile(String day, int calories, String title, String reps) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircularPercentIndicator(
                radius: 28.0,
                lineWidth: 6.0,
                percent: 0.7,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: const Color(0xFFFF8C42),
                backgroundColor: Colors.grey.shade800,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('$calories', style: const TextStyle(color: Colors.white, fontSize: 12)),
                    const Text('cal', style: TextStyle(color: Colors.white70, fontSize: 10)),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(day, style: const TextStyle(color: Colors.orange, fontSize: 12)),
                  Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text("Reps completed:", style: TextStyle(color: Colors.white70, fontSize: 12)),
              Text(reps, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
