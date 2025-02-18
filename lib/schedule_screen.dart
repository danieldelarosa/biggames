import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  final List<Map<String, dynamic>> schedule = const [
    {'sport': 'Soccer', 'date': '2023-10-15', 'time': '10:00 AM', 'venue': 'Main Field'},
    {'sport': 'Basketball', 'date': '2023-10-16', 'time': '2:00 PM', 'venue': 'Gymnasium'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Schedule',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1A2141),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: schedule.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(schedule[index]['sport']),
              subtitle: Text(
                '${schedule[index]['date']} at ${schedule[index]['time']}\n${schedule[index]['venue']}',
              ),
              trailing: IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  // Add reminder logic
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}