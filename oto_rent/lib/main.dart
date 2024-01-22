import 'package:flutter/material.dart';
import 'package:oto_rent/pages/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static const String title = 'Oto Rent';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF5521CE),
          secondary: Colors.blueAccent,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto',
          ),
        ),
        scaffoldBackgroundColor: Colors.grey[900],
      ),
      home: const HomeScreen(title: title),
    );
  }
}
