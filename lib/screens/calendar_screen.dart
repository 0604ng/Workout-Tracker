import 'package:flutter/material.dart';

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
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Calendar header
                const Text(
                  'Calendar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 20),

                // Month navigation
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left_rounded, color: Colors.white),
                      onPressed: () {
                        // Previous month
                      },
                    ),
                    const Text(
                      'October 2023',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.chevron_right_rounded, color: Colors.white),
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

                // No scheduled plan card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.35),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.white.withOpacity(0.08)),
                  ),
                  child: Column(
                    children: const [
                      Icon(
                        Icons.event_note_rounded,
                        color: Color(0xFFFFAE33),
                        size: 44,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'No Scheduled Plan Today',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Add a plan button
                InkWell(
                  onTap: () {
                    // Handle add plan
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFFF5E36), width: 1.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.add_rounded, color: Color(0xFFFF5E36)),
                        SizedBox(width: 8),
                        Text(
                          'Add a plan',
                          style: TextStyle(
                            color: Color(0xFFFF5E36),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 120), // Padding to avoid overlap with bottom nav
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCalendarGrid() {
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
          padding: const EdgeInsets.only(bottom: 12),
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
                    : const SizedBox(width: 40, height: 40);
              },
            ),
          ),
        ),
      ),
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
        style: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 14,
          fontWeight: FontWeight.bold,
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
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: isSelected
              ? const LinearGradient(
                  colors: [Color(0xFFFF5E36), Color(0xFFFFAE33)],
                )
              : null,
          color: isSelected ? null : Colors.black.withOpacity(0.2),
          border: isSelected
              ? null
              : Border.all(color: Colors.white.withOpacity(0.04), width: 1),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              day.toString(),
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white70,
                fontSize: 14,
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
                    color: Color(0xFFFF5E36),
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