import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/auth_provider.dart';
import 'package:untitled/screens/login_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView(
        children: [
          _SettingsItem(
            icon: Icons.person,
            title: 'Account',
            onTap: () {},
          ),
          _buildDivider(),
          _SettingsItem(
            icon: Icons.lock,
            title: 'Password',
            onTap: () {},
          ),
          _buildDivider(),
          _SettingsItem(
            icon: Icons.help_outline,
            title: 'Help',
            onTap: () {},
          ),
          _buildDivider(),
          _SettingsItem(
            icon: Icons.notifications_none,
            title: 'Notifications',
            onTap: () {},
          ),
          _buildDivider(),
          _SettingsItem(
            icon: Icons.feedback_outlined,
            title: 'Feedback',
            onTap: () {},
          ),
          _buildDivider(),
          _SettingsItem(
            icon: Icons.logout,
            title: 'Logout',
            iconColor: Colors.red,
            titleColor: Colors.red,
            onTap: () => _showLogoutDialog(context),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(height: 1, margin: const EdgeInsets.only(left: 80), color: Colors.grey[800]);
  }

  void _showLogoutDialog(BuildContext context) {
    final parentContext = context;

    showDialog(
      context: parentContext,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: const Color(0xFF2A2A2A),
          title: const Text('Logout', style: TextStyle(color: Colors.white)),
          content: const Text('Are you sure you want to logout?', style: TextStyle(color: Colors.white70)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(dialogContext);

                final authProvider = parentContext.read<AppAuthProvider>();
                await authProvider.logout();

                if (parentContext.mounted) {
                  Navigator.of(parentContext).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                        (route) => false,
                  );
                }
              },
              child: const Text('Logout', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color? iconColor;
  final Color? titleColor;
  final VoidCallback onTap;

  const _SettingsItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor ?? const Color(0xFFFF8C42), size: 20),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: TextStyle(color: titleColor ?? Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}