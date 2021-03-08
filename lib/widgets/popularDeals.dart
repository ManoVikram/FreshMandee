import 'package:flutter/material.dart';

import './popularDealsCard.dart';
import '../screens/productDetailsScreen.dart';

class PopularDeals extends StatelessWidget {
  const PopularDeals({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        // crossAxisAlignment: WrapCrossAlignment.center,
        // TODO: Change the image and deal value.
        children: [
          PopularDealsCard(
            size: size,
            image: "assets/images/FarmerBuyer.png",
            deal: "25",
            onPressed: () {
              Navigator.of(context).pushNamed(ProductDetailsScreen.routeName);
            },
          ),
          PopularDealsCard(
            size: size,
            image: "assets/images/FarmerBuyer.png",
            deal: "25",
            onPressed: () {},
          ),
          PopularDealsCard(
            size: size,
            image: "assets/images/FarmerBuyer.png",
            deal: "25",
            onPressed: () {},
          ),
          PopularDealsCard(
            size: size,
            image: "assets/images/FarmerBuyer.png",
            deal: "25",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
