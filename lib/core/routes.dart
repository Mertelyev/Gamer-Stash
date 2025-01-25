import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../screens/loading_screen.dart';
import '../screens/home_screen.dart'; // Import HomeScreen
import '../screens/settings_screen.dart';
import '../screens/profile_screen.dart'; // Import ProfileScreen

// Router yapılandırması
final GoRouter router = GoRouter(
  initialLocation: '/', // Başlangıç rotası
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoadingScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/settings',
      builder: (BuildContext context, GoRouterState state) {
        return const SettingsScreen();
      },
    ),
    GoRoute(
      path: '/profile',
      builder: (BuildContext context, GoRouterState state) {
        return const ProfileScreen(
          username: 'YourUsername', // Replace with actual username
          email: 'your.email@example.com', // Replace with actual email
          profileImagePath:
              'assets/images/profile_picture.png', // Ensure this path is correct
        );
      },
    ),
  ],
);
