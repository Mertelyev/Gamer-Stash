import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../screens/loading_screen.dart';
import '../screens/home_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/profile_screen.dart';

// router yapilandirma
final GoRouter router = GoRouter(
  initialLocation: '/', // baslangic
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
          username: 'YourUsername', // ornek kullanici adi
          email: 'your.email@example.com', // ornek email
          profileImagePath: 'assets/images/profile_picture.png',
        );
      },
    ),
  ],
);
