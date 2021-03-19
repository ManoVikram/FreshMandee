import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../widgets/userCartList.dart';
import '../widgets/cartTitle.dart';
import '../widgets/previousPageButtonIcon.dart';
import '../widgets/totalCostBox.dart';
import '../widgets/neumorphicRoundedButton.dart';

class UserCartScreen extends StatelessWidget {
  static const String routeName = "/userCartScreen";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(
            left: 18.0,
            right: 18.0,
            top: 42.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PreviousPageIconButton(
                color: Colors.pinkAccent,
              ),
              SizedBox(
                height: 16.0,
              ),
              CartTitle(),
              SizedBox(
                height: 18.0,
              ),
              UserCartList(),
              TotalCostBox(size: size),
              NeumorphicRoundedButton(
                size: size,
                text: "Checkout",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
