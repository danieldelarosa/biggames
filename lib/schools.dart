import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'sponsor_carousel.dart'; // Import the SponsorCarousel class
import 'navigation_helper.dart'; // Import the navigation helper

class SchoolsScreen extends StatefulWidget {
  const SchoolsScreen({super.key});

  @override
  State<SchoolsScreen> createState() => _SchoolsScreenState();
}

class _SchoolsScreenState extends State<SchoolsScreen> {
  final int _selectedIndex = 1; // Track the selected tab, default to "Schools"

  // List of tabs
  final List<String> _tabs = [
    'Home',
    'Schools',
    'Sports',
    'Table',
    'Scenarios',
  ];

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(
          0xFF1A2141,
        ), // Set app bar background color
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
          // BIS Logo and Visit Us Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _launchURL('https://britishschool.edu.co/'),
                  child: Image.asset(
                    'assets/images/bis_logo.png', // Ensure you have this image in your assets
                    height: 100,
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () => _launchURL('https://britishschool.edu.co/'),
                  child: Text(
                    'Visit us!!',
                    style: GoogleFonts.montserrat(
                      color: const Color(0xFFE30613),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // BIS Involved In Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BIS is involved in:',
                  style: GoogleFonts.montserrat(
                    color: const Color(0xFF1A2141),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                _buildLink(
                  context,
                  'Futbol Masculino Mayores',
                  '/futbol_masculino_mayores',
                ),
                _buildLink(
                  context,
                  'Futbol Masculino Juvenil',
                  '/futbol_masculino_juvenil',
                ),
                _buildLink(
                  context,
                  'Basketball Masculino Mayores',
                  '/basketball_masculino_mayores',
                ),
                _buildLink(
                  context,
                  'Basketball Masculino Juvenil',
                  '/basketball_masculino_juvenil',
                ),
                _buildLink(
                  context,
                  'Voleibol Femenino Mayores',
                  '/voleibol_femenino_mayores',
                ),
                _buildLink(
                  context,
                  'Voleibol Femenino Juvenil',
                  '/voleibol_femenino_juvenil',
                ),
                _buildLink(context, 'Gimnasia Juvenil', '/gimnasia_juvenil'),
                _buildLink(context, 'Ajedrez', '/ajedrez'),
                _buildLink(context, 'Tenis', '/tenis'),
                _buildLink(context, 'Hípica', '/hipica'),
              ],
            ),
          ),
          // Spacer to push the footer to the bottom
          const Spacer(),
          // Carousel Footer
          const SponsorCarousel(),
        ],
      ),
    );
  }

  Widget _buildLink(BuildContext context, String text, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(
          text,
          style: GoogleFonts.montserrat(
            color: const Color(0xFFE30613),
            fontSize: 18,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
