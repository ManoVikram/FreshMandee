import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class TotalCostBox extends StatelessWidget {
  const TotalCostBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 16.0,
      ),
      child: Neumorphic(
        style: NeumorphicStyle(
          shadowLightColorEmboss: Colors.white,
          shadowDarkColorEmboss: Colors.blueGrey[100],
          color: Colors.cyanAccent[100].withOpacity(0.6),
          depth: -20,
        ),
        child: Container(
          height: size.height * 0.115,
          width: double.infinity,
          padding: EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(
                  fontFamily: GoogleFonts.oxygen().fontFamily,
                  fontSize: 18.0,
                ),
              ),
              Text(
                // TODO: Replace it with the total cost calculated from the API
                "₹ 1000",
                style: TextStyle(
                  color: Colors.blueGrey[700],
                  fontFamily: GoogleFonts.oxygen().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
