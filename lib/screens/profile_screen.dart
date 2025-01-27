import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String username;
  final String email;
  final String profileImagePath;

  const ProfileScreen({
    super.key,
    required this.username,
    required this.email,
    required this.profileImagePath,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 67, 68, 68),
            Color.fromARGB(255, 41, 43, 46),
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Profil Başlığı
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(widget.profileImagePath),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.username,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  Text(
                    widget.email,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[400],
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
            ),

            // Account Settings
            _buildSectionHeader('Account Settings'),
            _buildSettingTile(
              'Edit Profile',
              'Change your profile information',
              Icons.edit,
              () => _showEditProfileDialog(context),
            ),
            _buildSettingTile(
              'Change Password',
              'Update your password',
              Icons.lock,
              () => _showChangePasswordDialog(context),
            ),
            _buildSettingTile(
              'Link Accounts',
              'Connect gaming platforms',
              Icons.link,
              () => _showLinkAccountsDialog(context),
            ),
            _buildSettingTile(
              'Privacy Settings',
              'Manage your privacy',
              Icons.security,
              () => _showPrivacySettingsDialog(context),
            ),
            _buildSettingTile(
              'Log Out',
              'Sign out from your account',
              Icons.logout,
              () => _showLogoutDialog(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }

  Widget _buildSettingTile(
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Montserrat',
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: Colors.grey,
          fontFamily: 'Montserrat',
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
        size: 16,
      ),
      onTap: onTap,
    );
  }

  // Dialog functions
  void _showEditProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 67, 68, 68),
        title:
            const Text('Edit Profile', style: TextStyle(color: Colors.white)),
        content: const Text(
          'Profile editing will be implemented here.',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showChangePasswordDialog(BuildContext context) {}

  void _showLinkAccountsDialog(BuildContext context) {}

  void _showPrivacySettingsDialog(BuildContext context) {}

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 67, 68, 68),
        title: const Text('Logout', style: TextStyle(color: Colors.white)),
        content: const Text(
          'Are you sure you want to logout?',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
