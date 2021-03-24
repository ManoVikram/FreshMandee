import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final String imageURL;
  final String productTitle;
  final int productCost;
  final Function onPressed;

  const ProductCard({
    Key key,
    this.imageURL,
    this.productTitle,
    this.productCost,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        margin: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 7.0,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(6.0),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.blueGrey[50],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  imageURL,
                  fit: BoxFit.cover,
                  height: 150,
                  width: 150,
                ),
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              productTitle,
              style: TextStyle(
                fontFamily: GoogleFonts.oxygen().fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              "₹ $productCost",
              style: TextStyle(
                fontFamily: GoogleFonts.oxygen().fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
