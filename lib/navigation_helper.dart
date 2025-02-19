import 'package:flutter/material.dart';

void onItemTapped(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.pushReplacementNamed(context, '/home');
      break;
    case 1:
      Navigator.pushReplacementNamed(context, '/schools');
      break;
    case 2:
      Navigator.pushReplacementNamed(context, '/sports');
      break;
    case 3:
      Navigator.pushReplacementNamed(context, '/table');
      break;
    case 4:
      Navigator.pushReplacementNamed(context, '/scenarios');
      break;
  }
}