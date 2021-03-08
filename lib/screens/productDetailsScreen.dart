import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../widgets/productImageAndIcons.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = "/productDetailsScreen";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          ProductImageAndIcons(size: size),
        ],
      ),
    );
  }
}
