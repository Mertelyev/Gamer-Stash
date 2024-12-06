import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    // 2 saniye sonra ana sayfaya geçiş yapacağız.
    Future.delayed(const Duration(seconds: 2), () {
      // go_router ile ana sayfaya geçiş
      context.go('/home'); // HomeScreen'e geçiş
    });
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
              Color.fromARGB(255, 67, 68, 68), // Açık ton
              Color.fromARGB(255, 41, 43, 46), // Koyu ton
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo ve yükleme göstergesi bölümü
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  // Logo
                  SizedBox(
                    width: 250, // Genişlik 250
                    height: 250, // Yükseklik 250
                    child: Image.asset(
                      'assets/images/logo-ai.webp', // Logo dosyasının yolu
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 20), // Resim ile gösterge arasındaki boşluk

                  // Yükleme göstergesi
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFFB0B0B0)), // Açık gri renk
                    strokeWidth: 6, // Çizgi kalınlığı
                  ),

                  const SizedBox(height: 60), // Yükleme göstergesi ile yazı arasındaki boşluk

                  // Loading yazısı
                  const Text(
                    'Loading...',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat', // Montserrat fontu
                      color: Color(0xFFDDDDDD), // Çok açık gri renk
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
