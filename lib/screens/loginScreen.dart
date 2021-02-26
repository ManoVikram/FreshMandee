import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colorPalette.dart';

import './signupScreen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/loginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 32.0,
              bottom: 16.0,
              left: 16.0,
              right: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hey,",
                  style: TextStyle(
                    fontFamily: GoogleFonts.exo().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 64,
                    // color: Colors.white,
                  ),
                ),
                Text(
                  "Human👋",
                  style: TextStyle(
                    fontFamily: GoogleFonts.exo().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 72,
                    color: green,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                TextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                  maxLength: 10,
                  // textAlign: TextAlign.center,
                  keyboardType: TextInputType.phone,
                  cursorColor: Colors.deepOrangeAccent,
                  showCursor: true,
                  style: TextStyle(
                    fontFamily: GoogleFonts.oxygen().fontFamily,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    prefix: Container(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Text("+91"),
                    ),
                    contentPadding: EdgeInsets.all(16.0),
                    labelText: "Phone Number",
                    labelStyle: TextStyle(
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    focusColor: Colors.greenAccent[700],
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.greenAccent[700],
                        width: 3.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),
                Center(
                  child: Container(
                    width: size.width * 0.8,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 7.0,
                        primary: lightGreen,
                        onPrimary: Colors.black,
                        shadowColor: Colors.lightGreenAccent[100],
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 40.0),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "New to KisanMandee? ",
                          style: TextStyle(
                            fontFamily: GoogleFonts.oxygen().fontFamily,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed(SignupScreen.routeName);
                          },
                          child: Text(
                            "Join Us",
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontFamily: GoogleFonts.exo2().fontFamily,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
