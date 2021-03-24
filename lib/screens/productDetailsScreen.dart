import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/productImageAndIcons.dart';
import '../widgets/titleAndPrice.dart';
import '../widgets/buyAndDescriptionButtons.dart';

import '../models/bloc/productDetailsBloc/productDetails_bloc.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = "/productDetailsScreen";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, productDetailsState) {
            return productDetailsState?.productData == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      ProductImageAndIcons(
                        size: size,
                        image: productDetailsState?.productData?.image,
                      ),
                      TitleAndPrice(
                        title: productDetailsState?.productData?.name,
                        country: "India",
                        price: productDetailsState?.productData?.price,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      BuyAndDescriptionButtons(size: size),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
