import 'package:flutter/material.dart';

import '../colorPalette.dart';

class TitleAndPrice extends StatelessWidget {
  final String title;
  final String country;
  final double price;

  const TitleAndPrice({
    Key key,
    this.title,
    this.country,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$title\n",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        color: grey,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                TextSpan(
                  text: country,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: primaryGreen,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "₹$price",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        color: primaryGreen,
                      ),
                ),
                TextSpan(
                  text: " / KG",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        color: grey,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
