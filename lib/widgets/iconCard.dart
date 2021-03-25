import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../colorPalette.dart';

class IconCard extends StatelessWidget {
  final Size size;
  final IconData icon;
  final Function onPressed;

  const IconCard({
    Key key,
    this.size,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: onPressed,
      minDistance: -10,
      margin: EdgeInsets.symmetric(
        vertical: 20.0,
      ),
      style: NeumorphicStyle(
        shadowLightColorEmboss: Colors.white,
        shadowDarkColorEmboss: Colors.blueGrey[100],
        shadowDarkColor: Colors.teal[100],
        shadowLightColor: Colors.white,
        color: Colors.grey[100],
        surfaceIntensity: 1.0,
        depth: 10,
      ),
      child: Container(
        height: 40,
        child: Icon(
          icon,
          size: 30,
          color: primaryGreen,
        ),
      ),
    );
  }
}
