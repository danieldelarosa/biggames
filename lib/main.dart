import 'package:flutter/material.dart';
import 'home.dart';
import 'schools.dart';
import 'home_sports.dart';
import 'table.dart';
import 'scenarios.dart';
import 'matches.dart';
import 'splash_page.dart';

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
      initialRoute: '/SplashPage()',
      routes: {
        '/': (context) => SplashPage(),
        '/home': (context) => HomeScreen(),
        '/schools': (context) => SchoolsScreen(),
        '/sports': (context) => HomeSports(),
        '/table': (context) => TableScreen(),
        '/scenarios': (context) => ScenariosScreen(),
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
    );
  }
}
