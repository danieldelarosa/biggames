import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sponsor_carousel.dart';
import 'navigation_helper.dart';

class ScenariosScreen extends StatefulWidget {
  const ScenariosScreen({super.key});

  @override
  State<ScenariosScreen> createState() => _ScenariosScreenState();
}

class _ScenariosScreenState extends State<ScenariosScreen> {
  final int _selectedIndex =
      4; // Track the selected tab, default to "Scenarios"

  // List of tabs
  final List<String> _tabs = [
    'Home',
    'Schools',
    'Sports',
    'Table',
    'Scenarios',
  ];

  // List of scenarios
  final List<Map<String, String>> scenarios = const [
    {'name': 'Soccer Field', 'image': 'assets/images/soccer_field.jpg'},
    {'name': 'Basketball Court', 'image': 'assets/images/basketball_court.jpg'},
    {'name': 'Volleyball Court', 'image': 'assets/images/volleyball_court.jpg'},
    {'name': 'Tennis Court', 'image': 'assets/images/tennis_court.jpg'},
    {'name': 'Swimming Pool', 'image': 'assets/images/swimming_pool.jpg'},
    {
      'name': 'Horse Riding Arena',
      'image': 'assets/images/horse_riding_arena.jpg',
    },
    {'name': 'Chess Room', 'image': 'assets/images/chess_room.jpg'},
    {'name': 'Gymnastics Hall', 'image': 'assets/images/gymnastics_hall.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(
          0xFF1A2141,
        ), // Set app bar background color
        title: Text('Scenarios', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          // Top Navigation Bar
          Container(
            color: const Color(0xFF1A2141), // Blue background
            child: Row(
              children:
                  _tabs.map((tab) {
                    int index = _tabs.indexOf(tab);
                    return Expanded(
                      child: Container(
                        color:
                            _selectedIndex == index
                                ? const Color(0xFFE30613)
                                : Colors.transparent,
                        child: TextButton(
                          onPressed: () => onItemTapped(context, index),
                          child: Text(
                            tab,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
          // Grid of Scenarios
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: scenarios.length,
              itemBuilder: (context, index) {
                return ScenarioTile(
                  name: scenarios[index]['name']!,
                  image: scenarios[index]['image']!,
                );
              },
            ),
          ),
          // Carousel Footer
          const SponsorCarousel(),
        ],
      ),
    );
  }
}

class ScenarioTile extends StatelessWidget {
  final String name;
  final String image;

  const ScenarioTile({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(image, fit: BoxFit.cover),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1A2141).withOpacity(0.6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                name,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
