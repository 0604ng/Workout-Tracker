import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'calories_screen.dart';
import 'goals_screen.dart';
import 'setting_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _backgroundImage;
  File? _avatarImage;

  Future<void> _pickImage(bool isBackground) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (isBackground) {
          _backgroundImage = File(pickedFile.path);
        } else {
          _avatarImage = File(pickedFile.path);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false, // Root tab
        centerTitle: true,
        title: const Text(
          'PROFILE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_rounded, color: Color(0xFFFFAE33)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 10),
            
            // Header with background and avatar
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                GestureDetector(
                  onTap: () => _pickImage(true),
                  child: Container(
                    height: 180,
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white.withOpacity(0.08)),
                      image: DecorationImage(
                        image: _backgroundImage != null
                            ? FileImage(_backgroundImage!)
                            : const NetworkImage(
                                'https://th.bing.com/th/id/OIP.lfi0J5A3Nwrt1jdQhEYiIAHaFj?rs=1&pid=ImgDetMain',
                              ) as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -36,
                  child: GestureDetector(
                    onTap: () => _pickImage(false),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFFF5E36), width: 3),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFF5E36).withOpacity(0.2),
                            blurRadius: 15,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 46,
                        backgroundColor: const Color(0xFF1E1E26),
                        backgroundImage: _avatarImage != null
                            ? FileImage(_avatarImage!)
                            : const NetworkImage(
                                'https://static1.colliderimages.com/wordpress/wp-content/uploads/2023/05/john-wick-2x1.jpg',
                              ) as ImageProvider,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 52),

            // Name and streak
            const Text(
              'JOHN WICK',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w900,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Workout Streak: ',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                Text(
                  '11 days ',
                  style: TextStyle(
                    color: Color(0xFFFFAE33),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.local_fire_department_rounded, color: Color(0xFFFF5E36), size: 22),
              ],
            ),

            const SizedBox(height: 28),

            // Profile Items wrapped in a beautiful glass card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.35),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white.withOpacity(0.08)),
              ),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  _ProfileItem(
                    icon: Icons.history_rounded,
                    label: 'History',
                    onTap: () {},
                  ),
                  _ProfileItem(
                    icon: Icons.local_fire_department_rounded,
                    label: 'Calories',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CaloriesScreen()),
                      );
                    },
                  ),
                  _ProfileItem(
                    icon: Icons.favorite_rounded,
                    label: 'Favourites',
                    onTap: () {},
                  ),
                  _ProfileItem(
                    icon: Icons.show_chart_rounded,
                    label: 'Goals',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const GoalsScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Action Buttons row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.photo_camera_rounded, color: Colors.white),
                      label: const Text(
                        'Post Pictures',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFFF5E36)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.videocam_rounded, color: Colors.white),
                      label: const Text(
                        'Post Videos',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFFF5E36)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Icon row divider
            const IconRow(),

            const SizedBox(height: 16),

            // Photo grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  _gridImage('https://th.bing.com/th/id/R.f9e64be605e60ad6e851a673b106c8e6?rik=8SyTlnvg%2fXL7yA&riu=http%3a%2f%2fgreatist.com%2fsites%2fdefault%2ffiles%2fstyles%2ffb-1200x630%2fpublic%2fwp-content%2fuploads%2f2012%2f12%2fFree-Weight-Workout_featured.jpg%3fitok%3dyp0hUfnK&ehk=RFJ%2fDiR5BVriVMLwuwJGzVWmeAek0aDMMKU81mOgH3k%3d&risl=&pid=ImgRaw&r=0'),
                  _gridImage('https://th.bing.com/th/id/OIP.6Isi1nCPHd8UtC_x_-pSMQHaEp?w=626&h=393&rs=1&pid=ImgDetMain'),
                  _gridImage('https://th.bing.com/th/id/OIP.TWE2DQFaKEWwkOPT6hlrNgHaE8?rs=1&pid=ImgDetMain'),
                  _gridImage('https://www.listoutdoor.com/wp-content/uploads/2020/04/Guy_Working_Out-scaled-e1587695089543.jpg'),
                ],
              ),
            ),

            const SizedBox(height: 120), // Spacer for bottom nav
          ],
        ),
      ),
    );
  }

  Widget _gridImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        url,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            color: Colors.black.withOpacity(0.3),
            child: const Center(
              child: CircularProgressIndicator(color: Color(0xFFFF5E36)),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.black.withOpacity(0.3),
            child: const Icon(Icons.error_outline_rounded, color: Colors.white54),
          );
        },
      ),
    );
  }
}

class _ProfileItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ProfileItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white.withOpacity(0.04)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: const Color(0xFFFFAE33), size: 20),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconRow extends StatelessWidget {
  const IconRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Icon(Icons.grid_view_rounded, color: Color(0xFFFFAE33), size: 26),
          Icon(Icons.folder_open_rounded, color: Colors.white38, size: 26),
          Icon(Icons.workspace_premium_rounded, color: Colors.white38, size: 26),
        ],
      ),
    );
  }
}