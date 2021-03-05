import 'package:flutter/material.dart';

import '../colorPalette.dart';

class PopularDealsCard extends StatelessWidget {
  final Size size;
  final Image image;
  final String deal;

  const PopularDealsCard({
    Key key,
    this.size,
    this.image,
    this.deal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15.0),
      elevation: 7.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      shadowColor: primaryGreen.withOpacity(0.6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: size.height * 0.13,
            width: size.height * 0.13,
            decoration: BoxDecoration(
              color: primaryGreen.withOpacity(0.2),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              ),
            ),
            child: ClipRRect(
              // borderRadius: BorderRadius.circular(20.0),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              ),
              child: image,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            height: size.height * 0.13,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                // category.toUpperCase(),
                deal,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
