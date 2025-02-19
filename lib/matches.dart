import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'navigation_helper.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A2141), // Set app bar background color
        title: Text('Matches Calendar', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          // Top Navigation Bar
          Container(
            color: const Color(0xFF1A2141), // Blue background
            child: Row(
              children: ['Home', 'Schools', 'Sports', 'Table', 'Scenarios'].map((tab) {
                int index = ['Home', 'Schools', 'Sports', 'Table', 'Scenarios'].indexOf(tab);
                return Expanded(
                  child: Container(
                    color: _selectedDay == index ? const Color(0xFFE30613) : Colors.transparent,
                    child: TextButton(
                      onPressed: () => onItemTapped(context, index),
                      child: Text(
                        tab,
                        style: TextStyle(
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
          // Calendar Section
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // update `_focusedDay` here as well
              });
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          // Add more content here if needed
        ],
      ),
    );
  }
}