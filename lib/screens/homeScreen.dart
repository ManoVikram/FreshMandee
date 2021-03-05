import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../colorPalette.dart';

import '../widgets/homeHeader.dart';
import '../widgets/customUnderlinedText.dart';
import '../widgets/categoryList.dart';
import '../widgets/discountList.dart';
import '../widgets/popularDeals.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/homeScreen";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    Widget customAppBar() {
      return AppBar(
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 3,
                width: 18,
                color: white,
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                height: 3,
                width: 12,
                color: white,
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                height: 3,
                width: 20,
                color: white,
              ),
            ],
          ),
          onPressed: () {},
        ),
      );
    }

    return Scaffold(
      appBar: customAppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            HomeHeader(
              size: size,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomUnderlinedText(
                    text: "Categories",
                  ),
                  InkWell(
                    onTap: () {},
                    child: Chip(
                      backgroundColor: primaryGreen,
                      label: Text(
                        "See all",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CategoryList(
              size: size,
            ),
            DiscountList(size: size),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomUnderlinedText(
                  text: "Popular deals",
                ),
              ),
            ),
            PopularDeals(size: size),
          ],
        ),
      ),
    );
  }
}
