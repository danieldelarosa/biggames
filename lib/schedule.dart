import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sponsor_carousel.dart';
import 'navigation_helper.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int _selectedIndex = 3; // Track the selected tab, default to "Schedule"

  // List of tabs
  final List<String> _tabs = ['Home', 'Sports', 'Table', 'Schedule'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(
          0xFF1A2141,
        ), // Set app bar background color
        title: Text('Schedule', style: TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          Column(
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
              // Schedule Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Upcoming Events',
                        style: GoogleFonts.montserrat(
                          color: const Color(0xFF1A2141),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView(
                          children: [
                            _buildEventCard(
                              'Soccer Match',
                              'March 1, 2025',
                              '10:00 AM',
                            ),
                            _buildEventCard(
                              'Basketball Game',
                              'March 2, 2025',
                              '2:00 PM',
                            ),
                            _buildEventCard(
                              'Volleyball Tournament',
                              'March 3, 2025',
                              '4:00 PM',
                            ),
                            _buildEventCard(
                              'Tennis Match',
                              'March 4, 2025',
                              '9:00 AM',
                            ),
                            _buildEventCard(
                              'Swimming Competition',
                              'March 5, 2025',
                              '11:00 AM',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Carousel Footer
              const SponsorCarousel(),
            ],
          ),
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
      ),
    );
  }

  Widget _buildEventCard(String title, String date, String time) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          title,
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('$date at $time'),
      ),
    );
  }
}
