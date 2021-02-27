import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import './loginScreen.dart';

class OTPScreen extends StatefulWidget {
  static const String routeName = "/otpScreen";

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController _otpController = TextEditingController();

  StreamController<ErrorAnimationType> _errorController =
      StreamController<ErrorAnimationType>();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: size.height,
            width: double.infinity,
            margin: EdgeInsets.only(
              left: 32.0,
              right: 32.0,
              bottom: 8.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: "ENTER ",
                    style: TextStyle(
                      fontFamily: GoogleFonts.exo().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 42.0,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: "OTP🤖",
                        style: TextStyle(
                          fontFamily: GoogleFonts.exo().fontFamily,
                          fontWeight: FontWeight.w900,
                          fontSize: 54.0,
                          color: Colors.lightGreenAccent,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info,
                      size: 18.0,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Enter the code sent to ",
                        style: TextStyle(
                          fontFamily: GoogleFonts.oxygen().fontFamily,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: "+91-xxxxxxxxxx",
                            style: TextStyle(
                              fontFamily: GoogleFonts.exo2().fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 36.0,
                ),
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  onChanged: (value) {},
                  showCursor: true,
                  cursorColor: Colors.white,
                  enableActiveFill: true,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.circle,
                    activeFillColor: Colors.lightGreenAccent,
                    inactiveFillColor: Colors.yellow,
                    selectedFillColor: Colors.lightGreenAccent,
                    activeColor: Colors.lightGreenAccent,
                    inactiveColor: Colors.yellow,
                    selectedColor: Colors.lightGreenAccent,
                    fieldHeight: size.width / 8,
                    fieldWidth: size.width / 8,
                  ),
                  controller: _otpController,
                  errorAnimationController: _errorController,
                ),
                SizedBox(
                  height: 36.0,
                ),
                NeumorphicButton(
                  onPressed: () {},
                  style: NeumorphicStyle(
                    depth: 20.0,
                    color: Colors.tealAccent,
                    shadowLightColorEmboss: Colors.white,
                    shadowDarkColor: Colors.blueGrey[100],
                    shape: NeumorphicShape.convex,
                    border: NeumorphicBorder(
                      isEnabled: true,
                      color: Colors.teal,
                      width: 2.0,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 14.0,
                    horizontal: 36.0,
                  ),
                  minDistance: -50,
                  child: Text(
                    "GO",
                    style: TextStyle(
                      fontFamily: GoogleFonts.exo2().fontFamily,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive the code? ",
                      style: TextStyle(
                        fontFamily: GoogleFonts.exo2().fontFamily,
                        fontSize: 16.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Resend",
                        style: TextStyle(
                          color: Colors.indigo,
                          fontFamily: GoogleFonts.exo().fontFamily,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Enter a new phone number? ",
                      style: TextStyle(
                        fontFamily: GoogleFonts.exo2().fontFamily,
                        fontSize: 16.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginScreen.routeName);
                      },
                      child: Text(
                        "Phone",
                        style: TextStyle(
                          color: Colors.indigo,
                          fontFamily: GoogleFonts.exo().fontFamily,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
