import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile_picture.png'),
            ),
            const SizedBox(height: 20),
            Text(
              username,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                color: Color(0xFFDDDDDD),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              email,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
                color: Color(0xFFDDDDDD),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // logout islemi
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 67, 68, 68),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  color: Color(0xFFDDDDDD),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
