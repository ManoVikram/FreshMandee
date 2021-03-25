import 'package:flutter/material.dart';

import '../colorPalette.dart';

class BuyAndDescriptionButtons extends StatelessWidget {
  final Function buyNowOnPressed;
  final Function descriptionOnPressed;

  const BuyAndDescriptionButtons({
    Key key,
    @required this.size,
    this.buyNowOnPressed,
    this.descriptionOnPressed,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 85,
          width: size.width / 2,
          child: TextButton(
            onPressed: buyNowOnPressed,
            style: TextButton.styleFrom(
              backgroundColor: primaryGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50.0),
                ),
              ),
            ),
            child: Text(
              "Buy Now",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 85,
            child: TextButton(
              onPressed: descriptionOnPressed,
              child: Text(
                "Description",
                style: TextStyle(
                  color: grey,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
