import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SponsorCarousel extends StatelessWidget {
  const SponsorCarousel({super.key});

  final List<String> sponsorImages = const [
    'assets/sponsors/AACBI.svg',
    'assets/sponsors/ALCALDIA.svg',
    'assets/sponsors/CAUJARAL.svg',
    'assets/sponsors/HOTEL.svg',
    'assets/sponsors/INTERFILMS.svg',
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
              return SvgPicture.asset(
                colorFilter: const ColorFilter.mode(
                  Colors.yellow,
                  BlendMode.srcIn,
                ),
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
