import 'package:flutter/material.dart';

import '../colorPalette.dart';

class CustomUnderlinedText extends StatelessWidget {
  final String text;
  final double fontSize;

  const CustomUnderlinedText({
    Key key,
    this.text,
    this.fontSize = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.0,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 5,
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(
                left: 5,
              ),
              height: 7,
              color: primaryGreen.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }
}
