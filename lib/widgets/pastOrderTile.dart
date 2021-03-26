import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PastOrderListTile extends StatelessWidget {
  final String image;
  final String title;
  final int quantity;
  final int price;

  const PastOrderListTile({
    Key key,
    this.image,
    this.title,
    this.quantity,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: Colors.blueGrey[50].withOpacity(0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          style: TextStyle(
            fontFamily: GoogleFonts.exo2().fontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "Quantity: $quantity",
          style: TextStyle(
            fontFamily: GoogleFonts.exo().fontFamily,
          ),
        ),
        trailing: Text(
          "₹ $price",
          style: TextStyle(
            fontFamily: GoogleFonts.exo2().fontFamily,
            fontSize: 18.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
