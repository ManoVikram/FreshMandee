import 'package:flutter/material.dart';

import './discountCard.dart';

class DiscountList extends StatelessWidget {
  const DiscountList({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        // TODO: Change the image, discount value and description
        children: [
          DiscountCard(
            onPressed: () {},
            size: size,
            textColor: Colors.red,
            image: Image.asset(
              "assets/images/VegetableDiscount.png",
              fit: BoxFit.cover,
            ),
            discount: 30,
            description: "Order any vegetable\nand avail the discount.",
            color: Colors.deepOrange[200].withOpacity(0.8),
          ),
          DiscountCard(
            onPressed: () {},
            size: size,
            textColor: Colors.teal,
            image: Image.asset(
              "assets/images/VegetableDiscount.png",
              fit: BoxFit.cover,
            ),
            discount: 30,
            description: "Order any vegetable\nand avail the discount.",
            color: Colors.tealAccent[100].withOpacity(0.8),
          ),
          DiscountCard(
            onPressed: () {},
            size: size,
            textColor: Colors.indigo,
            image: Image.asset(
              "assets/images/VegetableDiscount.png",
              fit: BoxFit.cover,
            ),
            discount: 30,
            description: "Order any vegetable\nand avail the discount.",
            color: Colors.amberAccent[100].withOpacity(0.8),
          ),
        ],
      ),
    );
  }
}
