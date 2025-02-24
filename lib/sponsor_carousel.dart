import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SponsorCarousel extends StatelessWidget {
  const SponsorCarousel({super.key});

  final List<String> sponsorImages = const [
    'assets/sponsors/CAUJARAL.png',
    'assets/sponsors/HOTEL.png',
    'assets/sponsors/INTERFILMS.png',
    'assets/sponsors/sponsor1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, // Set a fixed height for the footer

      width:
          double
              .infinity, // Make the container take the full width of the screen

      padding: const EdgeInsets.symmetric(vertical: 8),

      color: const Color(0xFF1A2141), // Blue background

      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,

          enlargeCenterPage: true,

          aspectRatio: 2.0, // Adjust aspect ratio to fit the smaller height
        ),

        items:
            sponsorImages.map((image) {
              return Image.asset(
                image,

                fit:
                    BoxFit
                        .contain, // Adjust fit to contain within the smaller height
              );
            }).toList(),
      ),
    );
  }
}
