import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'sponsor_carousel.dart';
import 'navigation_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late YoutubePlayerController _controller;
  int _selectedIndex = 0; // Track the selected tab, default to "Home"

  // List of tabs
  final List<String> _tabs = ['Home', 'Schools', 'Sports', 'Table', 'Scenarios'];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '8T5YWANH4OE', // YouTube video ID
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          // Image Section with Link to YouTube Video
          GestureDetector(
            onTap: () => _launchURL('https://www.youtube.com/watch?v=8T5YWANH4OE'),
            child: Image.asset(
              'assets/images/youtube_thumbnail.png', 
              height: 200, // Reduce the size of the thumbnail
              fit: BoxFit.cover,
            ),
          ),
          // About Us Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About Us',
                        style: GoogleFonts.montserrat(
                          color: const Color(0xFF1A2141),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'We are a sports organization dedicated to promoting various sports activities and events. Our mission is to encourage participation and foster a love for sports in the community.',
                        style: GoogleFonts.montserrat(
                          color: const Color(0xFF1A2141),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Spacer to push the footer to the bottom
          const Spacer(),
          // Carousel Footer
          const SponsorCarousel(),
          // BIS Logo at the Bottom
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Image.asset(
                'assets/images/bis_logo.png', // Ensure you have this image in your assets
                height: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}