import 'package:flutter/material.dart';

import './popularDealsCard.dart';

class PopularDeals extends StatelessWidget {
  const PopularDeals({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        PopularDealsCard(
          size: size,
          image: Image.asset(
            "assets/images/FarmerBuyer.png",
            fit: BoxFit.cover,
          ),
          deal: "25",
        ),
        PopularDealsCard(
          size: size,
          image: Image.asset(
            "assets/images/FarmerBuyer.png",
            fit: BoxFit.cover,
          ),
          deal: "25",
        ),
        PopularDealsCard(
          size: size,
          image: Image.asset(
            "assets/images/FarmerBuyer.png",
            fit: BoxFit.cover,
          ),
          deal: "25",
        ),
        PopularDealsCard(
          size: size,
          image: Image.asset(
            "assets/images/FarmerBuyer.png",
            fit: BoxFit.cover,
          ),
          deal: "25",
        ),
        PopularDealsCard(
          size: size,
          image: Image.asset(
            "assets/images/FarmerBuyer.png",
            fit: BoxFit.cover,
          ),
          deal: "25",
        ),
        PopularDealsCard(
          size: size,
          image: Image.asset(
            "assets/images/FarmerBuyer.png",
            fit: BoxFit.cover,
          ),
          deal: "25",
        ),
      ],
    );
  }
}
