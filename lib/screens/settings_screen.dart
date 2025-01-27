import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = true;
  bool _pushNotifications = true;
  bool _emailNotifications = false;
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: ListView(
        children: [
          _buildSectionHeader('Appearance'),
          _buildSettingSwitch(
            'Dark Mode',
            'Enable dark mode',
            Icons.dark_mode,
            _darkMode,
            (value) => setState(() => _darkMode = value),
          ),
          _buildLanguageSelector(),
          _buildSectionHeader('Notifications'),
          _buildSettingSwitch(
            'Push Notifications',
            'Enable push notifications',
            Icons.notifications,
            _pushNotifications,
            (value) => setState(() => _pushNotifications = value),
          ),
          _buildSettingSwitch(
            'Email Notifications',
            'Receive email updates',
            Icons.email,
            _emailNotifications,
            (value) => setState(() => _emailNotifications = value),
          ),
          _buildSectionHeader('About'),
          _buildSettingTile(
            'Privacy Policy',
            'Read our privacy policy',
            Icons.privacy_tip,
            () => _showPrivacyPolicy(context),
          ),
          _buildSettingTile(
            'About',
            'App version and information',
            Icons.info,
            () => _showAboutDialog(context),
          ),
        ],
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

  Widget _buildSettingSwitch(
    String title,
    String subtitle,
    IconData icon,
    bool value,
    Function(bool) onChanged,
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
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.blue,
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

  Widget _buildLanguageSelector() {
    return ListTile(
      leading: const Icon(Icons.language, color: Colors.white),
      title: const Text(
        'Language',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Montserrat',
        ),
      ),
      subtitle: Text(
        _selectedLanguage,
        style: const TextStyle(
          color: Colors.grey,
          fontFamily: 'Montserrat',
        ),
      ),
      trailing: DropdownButton<String>(
        value: _selectedLanguage,
        dropdownColor: const Color.fromARGB(255, 67, 68, 68),
        items: ['English', 'Turkish', 'German']
            .map((String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ))
            .toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() => _selectedLanguage = newValue);
          }
        },
      ),
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 67, 68, 68),
        title: const Text(
          'Change Password',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Password change functionality will be implemented here.',
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

  void _showPrivacyPolicy(BuildContext context) {
    // Privacy policy implementation
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'Gamer Stash',
      applicationVersion: '1.0.0',
      applicationIcon: Image.asset(
        'assets/images/logo-ai.webp',
        width: 50,
        height: 50,
      ),
      children: const [
        Text(
          'Gamer Stash is your ultimate gaming companion.',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 67, 68, 68),
        title: const Text(
          'Logout',
          style: TextStyle(color: Colors.white),
        ),
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
              // Implement logout logic here
              Navigator.pop(context);
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
