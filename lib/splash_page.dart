import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'home.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset("assets/images/bis_logo.png"),
      //title: Text(
      //  "BIS BIG GAMES 2025",
      //  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //),
      backgroundColor: Colors.white38,
      showLoader: true,
      loadingText: Text("Loading..."),
      navigator: HomeScreen(),
      durationInSeconds: 3,
    );
  }
}
