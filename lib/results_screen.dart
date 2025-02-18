import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  final List<Map<String, dynamic>> results = const [
    {'sport': 'Soccer', 'date': '2023-10-10', 'teams': 'Team A vs Team B', 'score': '3-2'},
    {'sport': 'Basketball', 'date': '2023-10-09', 'teams': 'Team C vs Team D', 'score': '78-65'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Results',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1A2141),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: results.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(results[index]['teams']),
              subtitle: Text(
                '${results[index]['sport']} - ${results[index]['date']}',
              ),
              trailing: Text(
                results[index]['score'],
                style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}