import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 67, 68, 68), // Light tone
              Color.fromARGB(255, 41, 43, 46), // Dark tone
            ],
          ),
        ),
        child: const Center(
          child: Text(
            'Search Screen Content',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat', // Montserrat font
              color: Color(0xFFDDDDDD), // Very light gray color
            ),
          ),
        ),
      ),
    );
  }
}
