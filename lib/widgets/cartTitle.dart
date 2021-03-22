import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartTitle extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;

  const CartTitle({
    Key key,
    this.text1 = "",
    this.text2 = "",
    this.text3 = "",
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
                text: "$text1\n",
                style: TextStyle(
                  fontFamily: GoogleFonts.oxygen().fontFamily,
                  fontSize: 36.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.blueGrey[700],
                ),
              ),
              TextSpan(
                text: "$text2 ",
                style: TextStyle(
                  fontFamily: GoogleFonts.oxygen().fontFamily,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[700],
                ),
              ),
              TextSpan(
                text: "$text3",
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
