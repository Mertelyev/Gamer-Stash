import 'package:flutter/material.dart';
import 'core/routes.dart'; // go_router yapılandırmasını import et
import 'screens/profile_screen.dart'; // Import ProfileScreen

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter widget'larını başlat
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: router, // go_router yapılandırmamızı kullan
      debugShowCheckedModeBanner: false, // Debug bandını kaldır
    );
  }
}

// Example usage of ProfileScreen
void navigateToProfile(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ProfileScreen(
        username: 'YourUsername', // Replace with actual username
        email: 'your.email@example.com', // Replace with actual email
        profileImagePath:
            'assets/images/profile_picture.png', // Ensure this path is correct
      ),
    ),
  );
}
