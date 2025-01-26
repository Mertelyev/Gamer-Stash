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

    // animasyon kontrolcusu
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // 2 saniye sonra yukleme ekranindan home
    Future.delayed(const Duration(seconds: 2), () {
      // routerla home ekrani
      context.go('/home');
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
              Color.fromARGB(255, 67, 68, 68),
              Color.fromARGB(255, 41, 43, 46),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo ve yukleme animasyonu
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  // logo
                  SizedBox(
                    width: 250,
                    height: 250,
                    child: Image.asset(
                      'assets/images/logo-ai.webp',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // yukleme animasyonu
                  const CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFFB0B0B0)),
                    strokeWidth: 6, // kalinlik
                  ),

                  const SizedBox(height: 60),

                  // loading yazisi animasyonlu
                  FadeTransition(
                    opacity: _animation,
                    child: const Text(
                      'Loading...',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                        color: Color(0xFFDDDDDD),
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
