import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'standings_screen.dart';
import 'results_screen.dart';
import 'schedule_screen.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFFE30613), // Gold
      unselectedItemColor: const Color(0xFF1A2141), // Blue
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'Standings'),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Results'),
        BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Schedule'),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
            break;
          case 1:
            Navigator.push(context, MaterialPageRoute(builder: (_) => const StandingsScreen()));
            break;
          case 2:
            Navigator.push(context, MaterialPageRoute(builder: (_) => const ResultsScreen()));
            break;
          case 3:
            Navigator.push(context, MaterialPageRoute(builder: (_) => const ScheduleScreen()));
            break;
        }
      },
    );
  }
}