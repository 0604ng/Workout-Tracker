import 'package:flutter/material.dart';
import 'exercises_screen.dart';
import 'profile_screen.dart';
import 'create_exercises_screen.dart';
import 'apphome_screen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selectedDate = DateTime.now();

  // Days with workout plans (orange dots)
  final List<int> daysWithPlans = [7, 8, 9, 11, 14, 15, 16, 17, 23, 26, 29, 31];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
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
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Calendar header
                const Text(
                  'Calendar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Month navigation
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left, color: Colors.white),
                      onPressed: () {
                        // Previous month
                      },
                    ),
                    const Text(
                      'October 2023',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.chevron_right, color: Colors.white),
                      onPressed: () {
                        // Next month
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Days of week header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    _DayOfWeekLabel(label: 'S'),
                    _DayOfWeekLabel(label: 'M'),
                    _DayOfWeekLabel(label: 'T'),
                    _DayOfWeekLabel(label: 'W'),
                    _DayOfWeekLabel(label: 'T'),
                    _DayOfWeekLabel(label: 'F'),
                    _DayOfWeekLabel(label: 'S'),
                  ],
                ),

                const SizedBox(height: 15),

                // Calendar grid
                _buildCalendarGrid(),

                const SizedBox(height: 40),

                // No scheduled plan text
                const Text(
                  'No Scheduled Plan Today',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 30),

                // Add a plan button
                InkWell(
                  onTap: () {
                    // Handle add plan
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFFF8C42)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.add, color: Color(0xFFFF8C42)),
                        SizedBox(width: 8),
                        Text(
                          'Add a plan',
                          style: TextStyle(
                            color: Color(0xFFFF8C42),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 0.7),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AppHomeScreen()),
                  );
                },
                child: _buildNavBarItem(icon: Icons.home),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExercisesScreen()),
                  );
                },
                child: _buildNavBarItem(icon: Icons.fitness_center),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreateExercisesScreen()),
                  );
                },
                child: _buildNavBarItem(icon: Icons.add_circle_outline),
              ),
              _buildNavBarItem(icon: Icons.calendar_today, isSelected: true),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfileScreen()),
                  );
                },
                child: _buildNavBarItem(icon: Icons.person),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendarGrid() {
    // Sample calendar grid for October 2023
    // In a real app, this would be generated dynamically
    List<List<int?>> calendarData = [
      [1, 2, 3, 4, 5, 6, 7],
      [8, 9, 10, 11, 12, 13, 14],
      [15, 16, 17, 18, 19, 20, 21],
      [22, 23, 24, 25, 26, 27, 28],
      [29, 30, 31, null, null, null, null],
    ];

    return Column(
      children: List.generate(
        calendarData.length,
            (rowIndex) => Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              7,
                  (colIndex) {
                final day = calendarData[rowIndex][colIndex];
                return day != null
                    ? _CalendarDay(
                  day: day,
                  isSelected: day == 4, // Day 4 is selected in the image
                  hasWorkout: daysWithPlans.contains(day),
                  onTap: () {
                    setState(() {
                      selectedDate = DateTime(2023, 10, day);
                    });
                  },
                )
                    : const SizedBox(width: 40, height: 40); // Empty space for days outside the month
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavBarItem({
    required IconData icon,
    bool isSelected = false,
  }) {
    return Icon(
      icon,
      color: isSelected ? const Color(0xFFFF8C42) : Colors.grey,
      size: 28,
    );
  }
}

class _DayOfWeekLabel extends StatelessWidget {
  final String label;

  const _DayOfWeekLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 16,
        ),
      ),
    );
  }
}

class _CalendarDay extends StatelessWidget {
  final int day;
  final bool isSelected;
  final bool hasWorkout;
  final VoidCallback onTap;

  const _CalendarDay({
    required this.day,
    required this.isSelected,
    required this.hasWorkout,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF8C42) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              day.toString(),
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white70,
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            if (hasWorkout && !isSelected)
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF8C42),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}