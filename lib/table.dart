import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sponsor_carousel.dart';
import 'navigation_helper.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  final int _selectedIndex = 3; // Track the selected tab, default to "Table"

  // List of tabs
  final List<String> _tabs = [
    'Home',
    'Schools',
    'Sports',
    'Table',
    'Scenarios',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(
          0xFF1A2141,
        ), // Set app bar background color
        title: Text(
          'School Points Table',
          style: TextStyle(color: Colors.white),
        ),
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
          // Table of Schools and Points
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Points Table',
                  style: GoogleFonts.montserrat(
                    color: const Color(0xFF1A2141),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Table(
                  border: TableBorder.all(color: Colors.black),
                  children: [
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'School',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Points',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('School A'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('100'),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('School B'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('90'),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('School C'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('80'),
                        ),
                      ],
                    ),
                    // Add more rows as needed
                  ],
                ),
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
}
