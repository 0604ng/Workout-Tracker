
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'calories_screen.dart';
import 'goals_screen.dart';

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
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Color(0xFFFF8C42)),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: () => _pickImage(true),
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: _backgroundImage != null
                            ? FileImage(_backgroundImage!)
                            : const NetworkImage(
                            'https://th.bing.com/th/id/OIP.lfi0J5A3Nwrt1jdQhEYiIAHaFj?rs=1&pid=ImgDetMain')
                        as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  child: GestureDetector(
                    onTap: () => _pickImage(false),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.orange,
                      child: CircleAvatar(
                        radius: 37,
                        backgroundImage: _avatarImage != null
                            ? FileImage(_avatarImage!)
                            : const NetworkImage(
                            'https://static1.colliderimages.com/wordpress/wp-content/uploads/2023/05/john-wick-2x1.jpg')
                        as ImageProvider,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            const Text('JOHN WICK', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text.rich(
              TextSpan(
                text: 'Workout Streak: ',
                style: TextStyle(color: Colors.grey),
                children: [
                  TextSpan(text: '11 days ', style: TextStyle(color: Color(0xFFFF8C42))),
                  WidgetSpan(child: Icon(Icons.local_fire_department, color: Color(0xFFFF8C42), size: 18)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                height: 180,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _ProfileItem(
                      icon: Icons.history,
                      label: 'History',
                      onTap: () {},
                    ),
                    _ProfileItem(
                      icon: Icons.local_fire_department,
                      label: 'Calories',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CaloriesScreen(),
                          ),
                        );
                      },
                    ),
                    _ProfileItem(
                      icon: Icons.emoji_emotions,
                      label: 'Favourites',
                      onTap: () {},
                    ),
                    _ProfileItem(
                      icon: Icons.show_chart,
                      label: 'Goals',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GoalsScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.photo_camera, color: Colors.white),
                  label: const Text('Post Pictures', style: TextStyle(color: Colors.white)),
                  style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.white70)),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.video_library, color: Colors.white),
                  label: const Text('Post Videos', style: TextStyle(color: Colors.white)),
                  style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.white70)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const IconRow(),
            const SizedBox(height: 8),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1,
              padding: const EdgeInsets.all(16),
              children: [
                _gridImage('https://th.bing.com/th/id/R.f9e64be605e60ad6e851a673b106c8e6?rik=8SyTlnvg%2fXL7yA&riu=http%3a%2f%2fgreatist.com%2fsites%2fdefault%2ffiles%2fstyles%2ffb-1200x630%2fpublic%2fwp-content%2fuploads%2f2012%2f12%2fFree-Weight-Workout_featured.jpg%3fitok%3dyp0hUfnK&ehk=RFJ%2fDiR5BVriVMLwuwJGzVWmeAek0aDMMKU81mOgH3k%3d&risl=&pid=ImgRaw&r=0'),
                _gridImage('https://th.bing.com/th/id/OIP.6Isi1nCPHd8UtC_x_-pSMQHaEp?w=626&h=393&rs=1&pid=ImgDetMain'),
                _gridImage('https://th.bing.com/th/id/OIP.TWE2DQFaKEWwkOPT6hlrNgHaE8?rs=1&pid=ImgDetMain'),
                _gridImage('https://www.listoutdoor.com/wp-content/uploads/2020/04/Guy_Working_Out-scaled-e1587695089543.jpg'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _gridImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(url, fit: BoxFit.cover),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Color(0xFFFF8C42), size: 30),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class IconRow extends StatelessWidget {
  const IconRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Icon(Icons.grid_view_rounded, color: Colors.orange),
        Icon(Icons.folder_open, color: Colors.white70),
        Icon(Icons.workspace_premium, color: Colors.white70),
      ],
    );
  }
}