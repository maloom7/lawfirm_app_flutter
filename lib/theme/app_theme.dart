import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF4A1554);
  static const Color white = Colors.white;
  static const Color white70 = Colors.white70;
  static const Color accentPurple = Color(0xFFA463F2);

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Roboto',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.transparent,
    useMaterial3: false,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.white70),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white70),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
  );

  static const LinearGradient mainGradient = LinearGradient(
    colors: [Color(0xFF4A1554), Color(0xFF2A0A35)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient buttonGradient = LinearGradient(
    colors: [Color(0xFF7A3FFF), Color(0xFFCB9BFF)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
