import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleAndContact extends StatelessWidget {
  final String title;
  final String contact;

  const TitleAndContact({
    Key key,
    this.title,
    this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: GoogleFonts.oxygen().fontFamily,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          contact,
          style: TextStyle(
            fontFamily: GoogleFonts.exo2().fontFamily,
            fontSize: 18.0,
          ),
        )
      ],
    );
  }
}
