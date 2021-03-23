import 'package:flutter/material.dart';

import '../colorPalette.dart';

class CategoryCard extends StatelessWidget {
  final String category;
  final Image image;
  final Function onPressed;

  const CategoryCard({
    Key key,
    this.category,
    this.image,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        margin: EdgeInsets.all(15.0),
        elevation: 7.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        shadowColor: primaryGreen.withOpacity(0.6),
        child: Column(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: primaryGreen.withOpacity(0.2),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: image,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                /* boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 10.0,
                    color: primaryGreen.withOpacity(0.2),
                  ),
                ], */
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                category.toUpperCase(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
