import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/previousPageButtonIcon.dart';
import '../widgets/cartTitle.dart';
import '../widgets/contactUsButton.dart';

class ContactUsScreen extends StatelessWidget {
  static const routeName = "/contactUsScreen";

  @override
  Widget build(BuildContext context) {
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
            children: [
              PreviousPageIconButton(
                color: Colors.blueAccent,
              ),
              SizedBox(
                height: 16.0,
              ),
              CartTitle(
                text1: "Contact",
                text2: "Us",
                text3: "📝",
              ),
              SizedBox(
                height: 18.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "REACH OUT TO US",
                    style: TextStyle(
                      fontFamily: GoogleFonts.exo2().fontFamily,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 14.0,
                  ),
                  ContactUsButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
