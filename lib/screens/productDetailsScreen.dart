import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../widgets/productImageAndIcons.dart';
import '../widgets/titleAndPrice.dart';
import '../widgets/buyAndDescriptionButtons.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = "/productDetailsScreen";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ProductImageAndIcons(size: size),
            TitleAndPrice(
              title: "Orange",
              country: "India",
              price: 50,
            ),
            SizedBox(
              height: 20.0,
            ),
            BuyAndDescriptionButtons(size: size),
          ],
        ),
      ),
    );
  }
}
