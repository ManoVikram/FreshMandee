import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListTileDivider extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onPressed;

  const ListTileDivider({
    Key key,
    this.text,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: ListTile(
            leading: Icon(
              icon,
              color: Colors.indigo,
            ),
            title: Text(
              text,
              style: TextStyle(
                fontFamily: GoogleFonts.exo2().fontFamily,
                fontSize: 24.0,
              ),
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
