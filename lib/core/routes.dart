import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../screens/loading_screen.dart';
import '../screens/home_screen.dart';
import '../screens/settings_screen.dart'; // Import settings screen

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
  ],
);
