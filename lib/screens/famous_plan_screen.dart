import 'package:flutter/material.dart';
import 'apphome_screen.dart';
import 'exercises_screen.dart';
import 'profile_screen.dart';
import 'create_exercises_screen.dart';

class FamousPlanScreen extends StatelessWidget {
  const FamousPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final plans = [
      'STRETCHING BODY',
      'FULL BODY',
      'EFFICIENCY WARM UP',
      'FAT LOSS',
      'MUSCLE GAIN',
      'CARDIO BLAST',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'FAMOUS PLANS',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        itemCount: plans.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          return Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(10),
                child: const Icon(Icons.add, color: Colors.black),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    plans[index],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const AppHomeScreen()),
                  );
                },
                child: const Icon(Icons.home, color: Colors.grey, size: 28),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const ExercisesScreen()),
                  );
                },
                child: const Icon(Icons.fitness_center, color: Colors.grey, size: 28),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const CreateExercisesScreen()),
                  );
                },
                child: const Icon(Icons.add_circle_outline, color: Colors.grey, size: 28),
              ),
              const Icon(Icons.calendar_today, color: Colors.grey, size: 28),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfileScreen()),
                  );
                },
                child: const Icon(Icons.person, color: Colors.grey, size: 28),
              ),
            ],
          ),
        ),
      ),
    );
  }
}