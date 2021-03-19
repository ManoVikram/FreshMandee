import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartTitle extends StatelessWidget {
  const CartTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "My\n",
                style: TextStyle(
                  fontFamily: GoogleFonts.oxygen().fontFamily,
                  fontSize: 36.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.blueGrey[700],
                ),
              ),
              TextSpan(
                text: "Cart ",
                style: TextStyle(
                  fontFamily: GoogleFonts.oxygen().fontFamily,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[700],
                ),
              ),
              TextSpan(
                text: "🛍️",
                style: TextStyle(
                  fontSize: 32.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
