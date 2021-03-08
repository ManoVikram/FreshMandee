import 'package:flutter/material.dart';

import '../colorPalette.dart';

class PopularDealsCard extends StatelessWidget {
  final Size size;
  final String image;
  final String deal;
  final Function onPressed;

  const PopularDealsCard({
    Key key,
    this.size,
    this.image,
    this.deal,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* return InkWell(
      onTap: onPressed,
      child: Card(
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
              height: size.height * 0.2,
              // width: size.height * 0.13,
              width: size.width * 0.8,
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
              height: size.width * 0.1,
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
      ),
    ); */
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(
          left: 10.0,
          right: 10.0,
          top: 10.0,
          bottom: 10.0,
        ),
        height: 185,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          // TODO: Add Hero animation
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
