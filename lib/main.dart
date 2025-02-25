import 'package:flutter/material.dart';
import 'home.dart';
import 'home_sports.dart';
import 'table.dart';
import 'matches.dart';
import 'splash_page.dart';
import 'schedule.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BIS Big Games',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPage(),
        '/home': (context) => HomeScreen(),
        // '/schools': (context) => SchoolsScreen(), // Hide SchoolsScreen
        '/sports': (context) => HomeSports(),
        '/table': (context) => TableScreen(),
        '/schedule': (context) => ScheduleScreen(),
        // '/scenarios': (context) => ScenariosScreen(), // Hide ScenariosScreen
        // Add routes for the sports links
        '/futbol_masculino_mayores': (context) => MatchesScreen(),
        '/futbol_masculino_juvenil': (context) => MatchesScreen(),
        '/basketball_masculino_mayores': (context) => MatchesScreen(),
        '/basketball_masculino_juvenil': (context) => MatchesScreen(),
        '/voleibol_femenino_mayores': (context) => MatchesScreen(),
        '/voleibol_femenino_juvenil': (context) => MatchesScreen(),
        '/gimnasia_juvenil': (context) => MatchesScreen(),
        '/ajedrez': (context) => MatchesScreen(),
        '/tenis': (context) => MatchesScreen(),
        '/hipica': (context) => MatchesScreen(),
      },
      builder: (context, child) {
        return Stack(
          children: [
            child!,
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.red,
                padding: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 8.0,
                ),
                child: Center(
                  child: Text(
                    'This is a beta version',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
