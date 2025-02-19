import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sponsor_carousel.dart'; // Import the SponsorCarousel class
import 'navigation_helper.dart'; // Import the navigation helper

class HomeSports extends StatefulWidget {
  const HomeSports({super.key});

  @override
  State<HomeSports> createState() => _HomeSportsState();
}

class _HomeSportsState extends State<HomeSports> {
  int _selectedIndex = 2; // Track the selected tab, default to "Sports"

  // List of tabs
  final List<String> _tabs = ['Home', 'Schools', 'Sports', 'Table', 'Scenarios'];

  // List of sports
  final List<Map<String, String>> sports = const [
    {'name': 'Paddle', 'image': 'assets/images/paddle.jpg'},
    {'name': 'Chess', 'image': 'assets/images/chess.jpg'},
    {'name': 'Tennis', 'image': 'assets/images/tennis.jpg'},
    {'name': 'Equestrian', 'image': 'assets/images/horse_riding.jpg'},
    {'name': 'Swimming', 'image': 'assets/images/swimming.jpg'},
    {'name': 'Soccer', 'image': 'assets/images/soccer.jpg'},
    {'name': 'Basketball', 'image': 'assets/images/basketball.jpg'},
    {'name': 'Volleyball', 'image': 'assets/images/volleyball.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A2141), // Set app bar background color
      ),
      body: Column(
        children: [
          // Top Navigation Bar
          Container(
            color: const Color(0xFF1A2141), // Blue background
            child: Row(
              children: _tabs.map((tab) {
                int index = _tabs.indexOf(tab);
                return Expanded(
                  child: Container(
                    color: _selectedIndex == index ? const Color(0xFFE30613) : Colors.transparent,
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
          // Title "Sports"
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Sports',
              style: GoogleFonts.montserrat(
                color: const Color(0xFF1A2141),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Main Content
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: sports.length,
              itemBuilder: (context, index) {
                return SportTile(
                  name: sports[index]['name']!,
                  image: sports[index]['image']!,
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

class SportTile extends StatelessWidget {
  final String name;
  final String image;

  const SportTile({super.key, required this.name, required this.image});

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