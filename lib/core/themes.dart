import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = true;
  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  ThemeData get theme => _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;

  BoxDecoration get backgroundDecoration => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: _isDarkMode
              ? [
                  const Color.fromARGB(255, 67, 68, 68),
                  const Color.fromARGB(255, 41, 43, 46),
                ]
              : [
                  Colors.grey[100]!,
                  Colors.grey[200]!,
                ],
        ),
      );
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
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
      textTheme: TextTheme(
        headlineSmall: GoogleFonts.montserrat(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: const Color(0xFFDDDDDD),
        ),
        bodyLarge: GoogleFonts.montserrat(
          fontSize: 16,
          color: Colors.white70,
        ),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.grey[100],
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey[800]),
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.grey[800],
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
        ),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey[600],
      ),
      textTheme: TextTheme(
        headlineSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: 'Montserrat',
          color: Colors.grey[800],
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontFamily: 'Montserrat',
          color: Colors.grey[800],
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontFamily: 'Montserrat',
          color: Colors.grey[700],
        ),
        labelLarge: const TextStyle(
          fontSize: 16,
          fontFamily: 'Montserrat',
          color: Colors.black87,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.grey[800],
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.blue;
          }
          return Colors.grey[400];
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.blue.withOpacity(0.5);
          }
          return Colors.grey[300];
        }),
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
