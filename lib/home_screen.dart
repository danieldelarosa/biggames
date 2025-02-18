import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, String>> sports = const [
    {'name': 'Paddle Tennis', 'image': 'assets/images/paddle_tennis.jpg'},
    {'name': 'Chess', 'image': 'assets/images/chess.jpg'},
    {'name': 'Golf', 'image': 'assets/images/golf.jpg'},
    {'name': 'Horse Riding', 'image': 'assets/images/horse_riding.jpg'},
    {'name': 'Swimming', 'image': 'assets/images/swimming.jpg'},
    {'name': 'Soccer', 'image': 'assets/images/soccer.jpg'},
    {'name': 'Basketball', 'image': 'assets/images/basketball.jpg'},
    {'name': 'Volleyball', 'image': 'assets/images/volleyball.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BISB Sports Tracker',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1A2141),
      ),
      body: GridView.builder(
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
      bottomNavigationBar: const CustomBottomNavigationBar(),
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
 