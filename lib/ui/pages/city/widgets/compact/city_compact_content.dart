import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifyk_landing/constants/color_palette.dart';

class CityCompactContent extends StatelessWidget {
  const CityCompactContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Text(
          "City Phone View Coming Soon",
          textAlign: TextAlign.center,
          style: GoogleFonts.unbounded(
            fontWeight: FontWeight.w500,
            fontSize: 25,
            color: ColorPalette.subTextColor
          ),
        ),
      ),
    );
  }
}
