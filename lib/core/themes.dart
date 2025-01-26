import 'package:flutter/material.dart';

class AppTheme {
  // Tema ayarlari
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: const Color.fromARGB(255, 67, 68, 68),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 67, 68, 68),
        iconTheme: IconThemeData(color: Color(0xFFDDDDDD)),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color.fromARGB(255, 41, 43, 46),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 41, 43, 46),
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xFFDDDDDD),
      ),
      textTheme: const TextTheme(
        headlineSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: 'Montserrat',
          color: Color(0xFFDDDDDD),
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontFamily: 'Montserrat',
          color: Color(0xFF424242),
        ),
      ),
    );
  }

  // tema stil bilesenleri
  static const TextStyle montserrat18W500 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
    color: Color(0xFFDDDDDD),
  );

  static const TextStyle montserrat16 = TextStyle(
    fontSize: 16,
    fontFamily: 'Montserrat',
    color: Color(0xFF424242),
  );

  static const BoxDecoration gradientBackground = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromARGB(255, 67, 68, 68),
        Color.fromARGB(255, 41, 43, 46),
      ],
    ),
  );
}
