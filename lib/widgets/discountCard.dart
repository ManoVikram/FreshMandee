import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DiscountCard extends StatelessWidget {
  final Color color;
  final Color textColor;
  final int discount;
  final String description;
  final Image image;
  final Function onPressed;

  const DiscountCard({
    Key key,
    @required this.size,
    this.color,
    this.discount,
    this.description,
    this.image,
    this.textColor,
    this.onPressed,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Neumorphic(
        margin: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        style: NeumorphicStyle(
          depth: 10.0,
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(20.0),
          ),
          shape: NeumorphicShape.convex,
          // color: Colors.deepOrange[200].withOpacity(0.8),
          color: color,
        ),
        child: Container(
          height: size.height * 0.23,
          width: size.width * 0.9,
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.2,
                width: size.width * 0.35,
                /* child: Image.asset(
                  "assets/images/VegetableDiscount.png",
                  fit: BoxFit.cover,
                ), */
                child: image,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$discount% Discount",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  /* SizedBox(
                    height: 10.0,
                  ), */
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                  // Spacer(),
                  Text(
                    "Order Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
