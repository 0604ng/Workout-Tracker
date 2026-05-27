import 'package:flutter/material.dart';

class CreateExercisesScreen extends StatelessWidget {
  const CreateExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false, // Prevents showing back arrow in tabs
        title: const Text(
          'Create Exercise',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight - 120),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        "Regular Exercise",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Enter a title for the exercise',
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.3),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.white.withOpacity(0.08)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(color: Color(0xFFFF5E36), width: 1.5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: const [
                          Text(
                            "Set Goal",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.info_outline_rounded,
                            color: Color(0xFFFFAE33),
                            size: 18,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.white.withOpacity(0.08)),
                        ),
                        child: DropdownButtonFormField<String>(
                          initialValue: "2 months",
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Color(0xFFFFAE33),
                          ),
                          dropdownColor: const Color(0xFF16161F),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                          ),
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                          items: const [
                            DropdownMenuItem(
                              value: "1 month",
                              child: Text("1 month"),
                            ),
                            DropdownMenuItem(
                              value: "2 months",
                              child: Text("2 months"),
                            ),
                            DropdownMenuItem(
                              value: "3 months",
                              child: Text("3 months"),
                            ),
                          ],
                          onChanged: (value) {},
                        ),
                      ),
                      const SizedBox(height: 28),
                      
                      // Picker box section
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: const [
                          _PickerBox(title: "Reps", value: "7 reps", icon: Icons.refresh_rounded),
                          _PickerBox(title: "Sets", value: "10 sets", icon: Icons.grid_on_rounded),
                          _PickerBox(title: "Weight", value: "150 lbs", icon: Icons.fitness_center_rounded),
                          _PickerBox(title: "Rest timer", value: "80s", icon: Icons.timer_rounded),
                          _PickerBox(title: "Distance", value: "20km", icon: Icons.directions_run_rounded),
                        ],
                      ),
                      
                      const Spacer(),
                      const SizedBox(height: 40),
                      
                      // Create workout button
                      Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFF5E36), Color(0xFFFFAE33)],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFF5E36).withOpacity(0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Create workout",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 120), // Padding to avoid overlap with floating bottom nav
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _PickerBox extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _PickerBox({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 32,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.35),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                icon,
                color: const Color(0xFFFFAE33).withOpacity(0.6),
                size: 18,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.keyboard_arrow_up_rounded, color: Colors.white54, size: 18),
                  Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white54, size: 18),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
