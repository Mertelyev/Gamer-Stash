import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: const Center(
          child: Text(
            'Settings Screen Content',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat',
              color: Color(0xFFDDDDDD),
            ),
          ),
        ),
      ),
    );
  }
}
