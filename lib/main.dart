import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart'; // Import the HomeScreen

void main() {
  runApp(const SportsTournamentApp());
}

class SportsTournamentApp extends StatelessWidget {
  const SportsTournamentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BIS BIG GAMES',
      theme: ThemeData(
        primaryColor: const Color(0xFF1A2141), // Blue
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue, // Base color for the scheme
        ).copyWith(
          secondary: const Color(0xFFE30613), // Gold
        ),
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const HomeScreen(), // Set the home screen
    );
  }
}