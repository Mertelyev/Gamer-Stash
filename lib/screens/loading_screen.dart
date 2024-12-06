import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller and animation
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Navigate to the home screen after 2 seconds.
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to the home screen using go_router
      context.go('/home'); // Navigate to HomeScreen
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo and loading indicator section
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  // Logo
                  SizedBox(
                    width: 250, // Width 250
                    height: 250, // Height 250
                    child: Image.asset(
                      'assets/images/logo-ai.webp', // Path to the logo file
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                      height: 20), // Space between the image and the indicator

                  // Loading indicator
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFFB0B0B0)), // Light gray color
                    strokeWidth: 6, // Stroke width
                  ),

                  const SizedBox(
                      height: 60), // Space between the indicator and the text

                  // Loading text with animation
                  FadeTransition(
                    opacity: _animation,
                    child: const Text(
                      'Loading...',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat', // Montserrat font
                        color: Color(0xFFDDDDDD), // Very light gray color
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
