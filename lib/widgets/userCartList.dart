import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserCartList extends StatelessWidget {
  const UserCartList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (contxt, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: ListTile(
            tileColor: Colors.blueGrey[50].withOpacity(0.8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                // TODO: Replace the url with the url from the API
                "https://i.pinimg.com/originals/cb/33/49/cb3349b86ca661ca61ae9a36d88d70d4.png",
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              // TODO: Replace the title with the title from the API
              "Pikachu",
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: TextStyle(
                fontFamily: GoogleFonts.exo2().fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              // TODO: Replace the quantity with the quantity from the API
              "Quantity: 1",
              style: TextStyle(
                fontFamily: GoogleFonts.exo().fontFamily,
              ),
            ),
            trailing: Text(
              // TODO: Replace the price with the price from the API
              "₹ 500",
              style: TextStyle(
                fontFamily: GoogleFonts.exo2().fontFamily,
                fontSize: 18.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ),
      itemCount: 2,
    );
  }
}
