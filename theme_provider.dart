// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'core/constants/app_colors.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.greenButton,
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        color: AppColors.greenButton,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.greenButton,
          foregroundColor: Colors.white,
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
        titleLarge: TextStyle(color: Colors.black),
      ),
      iconTheme: const IconThemeData(color: AppColors.greenButton),
      cardTheme: const CardTheme(color: Colors.white),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.greenButton,
        unselectedItemColor: Colors.grey,
      ),
      colorScheme: ColorScheme.light(
        primary: AppColors.greenButton,
        secondary: AppColors.greenButton,
        surface: Colors.grey.shade50,
        onSurface: Colors.black,
        onPrimary: Colors.white,
      ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Colors.grey[900],
      scaffoldBackgroundColor: Colors.grey[900],
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        color: Colors.grey[900],
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[900],
          foregroundColor: Colors.white,
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        titleLarge: TextStyle(color: Colors.white),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      cardTheme: CardTheme(
        color: AppColors.darkBlue,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.grey[800],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
      ),
      colorScheme: ColorScheme.dark(
        primary: Colors.grey.shade200,
        secondary: Colors.black,
        surface: Colors.grey.shade300,
        onSurface: Colors.white,
        onPrimary: Colors.white,
      ),
    );
  }
}
