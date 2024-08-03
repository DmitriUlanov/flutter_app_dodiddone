import 'package:flutter/material.dart';

class DoDidDoneTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF004D40), // Основной цвет
      brightness: Brightness.light,
      primary: const Color(0xFF004D40), // Основной цвет
      onPrimary: Colors.white, // Текст на основном цвете
      secondary: const Color(0xFFfff8e1), // Вторичный цвет
      onSecondary: const Color(0xFF004D40), // Текст на вторичном цвете
      error: Colors.red, // Цвет ошибки
      onError: Colors.white, // Текст на цвете ошибки
      background: const Color(0xFFfff8e1), // Цвет фона
      onBackground: const Color(0xFF004D40), // Текст на фоне
      surface: const Color(0xFFfff8e1), // Цвет поверхности
      onSurface: const Color(0xFF004D40), // Текст на поверхности
    ),
    useMaterial3: true,
    // Добавляем стиль для кнопок
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: const TextStyle(color: Colors.white), // Белый текст
      ),
    ),
    // Добавляем тему для BottomNavigationBar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: const Color(0xFF004D40), // Основной цвет
      unselectedItemColor: Colors.grey, // Серый цвет для неактивных иконок
    ),
  );
}
