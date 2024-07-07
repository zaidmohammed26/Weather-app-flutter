import 'package:flutter/material.dart';
import 'package:weather_app/home_page.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: Color.fromARGB(255, 107, 223, 94),
  ),
  // textTheme: GoogleFonts.latoTextTheme(),
  scaffoldBackgroundColor: Color.fromARGB(255, 57, 150, 173),
);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const HomePage(),
    );
  }
}
