import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './iconCard.dart';

class ProductImageAndIcons extends StatelessWidget {
  const ProductImageAndIcons({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60.0),
      child: SizedBox(
        height: size.height * 0.8,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 60.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        icon: FaIcon(FontAwesomeIcons.backward),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Spacer(),
                    IconCard(
                      size: size,
                      icon: Icons.add_shopping_cart_rounded,
                    ),
                    IconCard(
                      size: size,
                      icon: Icons.favorite_outline,
                    ),
                    IconCard(
                      size: size,
                      icon: Icons.share,
                    ),
                    /* IconCard(
                      size: size,
                      icon: Icons.shopping_bag_rounded,
                    ), */
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.8,
              width: size.width * 0.75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(65),
                  bottomLeft: Radius.circular(65),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 60,
                    color: Colors.tealAccent.withOpacity(0.4),
                  ),
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  alignment: Alignment.centerRight,
                  // Change the image correspondingly
                  image: AssetImage("assets/images/FarmerBuyer.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
