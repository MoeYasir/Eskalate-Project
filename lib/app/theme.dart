import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFE6F0FA),
  cardColor: Colors.white, // white card background for light mode
  appBarTheme: const AppBarTheme(
    foregroundColor: Colors.black,
    backgroundColor: Color(0xFFE6F0FA),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
    iconTheme: IconThemeData(color: Colors.black),
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFE6F0FA),
    selectedItemColor: Color(0xFF295D9F),
    unselectedItemColor: Color(0xFF7A7A7A),
  ),
);

final darkTheme = ThemeData(
  colorScheme: ColorScheme.dark(
    surfaceVariant: Colors.grey.shade100, // softer dark gray, not black
    // ...
  ),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF121212),

  cardColor: const Color(0xFF1E1E1E), // dark card background
  appBarTheme: const AppBarTheme(
    foregroundColor: Colors.white,
    backgroundColor: Color(0xFF1F1F1F),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF1F1F1F),
    selectedItemColor: Color(0xFF5A8DEE),
    unselectedItemColor: Colors.grey,
  ),
);
