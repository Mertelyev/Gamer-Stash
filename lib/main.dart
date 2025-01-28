import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/routes.dart';
import 'core/themes.dart';
import 'screens/profile_screen.dart'; // Import ProfileScreen

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp.router(
          title: 'Flutter App',
          theme: themeProvider.theme,
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        );
      },
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
