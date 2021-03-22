import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class NeumorphicRectangularTileButton extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final Function onPressed;

  const NeumorphicRectangularTileButton({
    Key key,
    @required this.size,
    this.title,
    this.leadingIcon,
    this.onPressed,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: onPressed,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      style: NeumorphicStyle(
        color: Colors.blueGrey[50],
        shadowDarkColor: Colors.grey,
        shadowLightColor: Colors.white,
        shadowLightColorEmboss: Colors.white,
        shadowDarkColorEmboss: Colors.blueGrey[100],
        depth: 15,
      ),
      pressed: true,
      child: Container(
        height: size.height * 0.07,
        width: double.infinity,
        child: ListTile(
          leading: Icon(
            leadingIcon,
            color: Colors.purpleAccent,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontFamily: GoogleFonts.oxygenMono().fontFamily,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
