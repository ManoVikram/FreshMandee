import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/cartTitle.dart';
import '../widgets/previousPageButtonIcon.dart';
import '../widgets/userAvatar.dart';
import '../widgets/neumorphicRectangularTileButton.dart';

class UserAccountScreen extends StatelessWidget {
  static const String routeName = "/userAccountScreen";

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
                color: Colors.amber,
              ),
              SizedBox(
                height: 16.0,
              ),
              CartTitle(
                text1: "My",
                text2: "Profile",
                text3: "😃",
              ),
              SizedBox(
                height: 24.0,
              ),
              UserAvatar(
                imageLocation: "assets/images/Boy.png",
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                // TODO: Replace it with the name of the user and give them an option to edit their name
                "NAME",
                style: TextStyle(
                  fontFamily: GoogleFonts.oxygen().fontFamily,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                // TODO: Replace it with the email of the user
                "test@test.com",
                style: TextStyle(
                  fontFamily: GoogleFonts.oxygen().fontFamily,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              NeumorphicRectangularTileButton(
                size: size,
                leadingIcon: Icons.quick_contacts_dialer_outlined,
                title: "Contact Us",
                onPressed: () {},
              ),
              NeumorphicRectangularTileButton(
                size: size,
                leadingIcon: Icons.quick_contacts_dialer_outlined,
                title: "Notifications",
                onPressed: () {},
              ),
              NeumorphicRectangularTileButton(
                size: size,
                leadingIcon: Icons.quick_contacts_dialer_outlined,
                title: "Sign Out",
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
