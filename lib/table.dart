import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'navigation_helper.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  int _selectedIndex = 3; // Track the selected tab, default to "Table"

  // List of tabs
  final List<String> _tabs = [
    'Home',
    'Schools',
    'Sports',
    'Table',
    'Scenarios',
  ];

  @override
  void initState() {
    super.initState();
    // Enable virtual display for WebView on macOS
    //if (WebView.platform is WebKitWebViewPlatform) {
    //  WebView.platform = WebKitWebViewPlatform();
    //}
  }

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
          // WebView to embed the webpage
          Expanded(
            child: WebView(
              initialUrl: 'https://peppy-cassata-14d9ce.netlify.app/',
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
        ],
      ),
    );
  }
}
