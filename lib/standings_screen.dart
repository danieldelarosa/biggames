import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom.dart';

class StandingsScreen extends StatelessWidget {
  const StandingsScreen({super.key});

  final List<Map<String, dynamic>> standings = const [
    {'team': 'Team A', 'wins': 5, 'losses': 1, 'points': 15},
    {'team': 'Team B', 'wins': 4, 'losses': 2, 'points': 12},
    {'team': 'Team C', 'wins': 3, 'losses': 3, 'points': 9},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Standings',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1A2141),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: standings.length,
        itemBuilder: (context, index) {
          return Card(
            color: index % 2 == 0 ? const Color(0xFFF0F4FF) : Colors.white,
            child: ListTile(
              title: Text(standings[index]['team']),
              trailing: Text(
                '${standings[index]['points']} pts',
                style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'W: ${standings[index]['wins']}, L: ${standings[index]['losses']}',
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}