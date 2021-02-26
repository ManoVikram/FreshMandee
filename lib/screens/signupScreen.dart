import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_launcher/url_launcher.dart';

import '../colorPalette.dart';

import './loginScreen.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = "/signupScreen";

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  Future<void> _makeCall() async {
    const url = "tel:9876543210";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Couldn't launch $url";
    }
  }

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
                  "Try",
                  style: TextStyle(
                    fontFamily: GoogleFonts.exo().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 64,
                    // color: green,
                  ),
                ),
                Text(
                  "It",
                  style: TextStyle(
                    fontFamily: GoogleFonts.exo().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 64,
                    // color: green,
                  ),
                ),
                Text(
                  "Out🌱",
                  style: TextStyle(
                    fontFamily: GoogleFonts.exo().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 64,
                    color: Colors.amber,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
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
                  height: size.height * 0.03,
                ),
                Center(
                  child: Container(
                    width: size.width * 0.8,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 7.0,
                        primary: Colors.deepOrange,
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
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
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
                          "Already a member? ",
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
                                .pushReplacementNamed(LoginScreen.routeName);
                          },
                          child: Text(
                            "Get In",
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
                Divider(
                  thickness: 1.0,
                  height: 28.0,
                  color: Colors.lime,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "WANNA SELL WITH US?",
                          style: TextStyle(
                            fontFamily: GoogleFonts.exo2().fontFamily,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ).shimmer(),
                        NeumorphicButton(
                          onPressed: _makeCall,
                          minDistance: -50,
                          margin: EdgeInsets.all(16.0),
                          style: NeumorphicStyle(
                            shadowLightColorEmboss: Colors.white,
                            shadowDarkColor: Colors.blueGrey[100],
                            // color: Colors.grey[100],
                            color: Colors.amberAccent,
                            depth: 20,
                            // shape: NeumorphicShape.concave,
                          ),
                          child: Container(
                            height: size.height * 0.07,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.phone_android,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  "+91-9876543210",
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.oxygen().fontFamily,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    // fontStyle: FontStyle.italic,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/* extension GlitchExtension on Text {
  _Glitch get glitchText => _Glitch(child: this);
}

class _Glitch extends StatefulWidget {
  const _Glitch({Key key, this.child}) : super(key: key);

  final Text child;

  @override
  _GlitchState createState() => _GlitchState();
}

class _GlitchState extends State<_Glitch> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _glitchAnimation;
  bool _stoped = false;

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    _glitchAnimation = Tween(begin: 1.0, end: 3.0).animate(CurvedAnimation(
        curve: Curves.bounceInOut,
        reverseCurve: Curves.slowMiddle,
        parent: _animationController));

    _animationController.addStatusListener((AnimationStatus _status) {
      if (_status == AnimationStatus.completed && _stoped == false) {
        _animationController.reverse();
      } else if (_status == AnimationStatus.dismissed && _stoped == false) {
        _animationController.forward();
      }
    });
    _animationController.forward();
  }

  void _glitch() {
    _stoped = !_stoped;
    _stoped
        ? _animationController.reset()
        : _animationController.forward(from: 0.7);
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: _glitch,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) => Align(
            alignment: Alignment(
                _glitchAnimation.value / 250, _glitchAnimation.value / 200),
            child: Stack(
              children: [
                Positioned(
                    top: _glitchAnimation.value,
                    right: _glitchAnimation.value * 1.5,
                    child: _GlitchText(
                        text: widget,
                        color: const Color(0xFF00BCD4).withOpacity(0.85))),
                Positioned(
                    bottom: _glitchAnimation.value,
                    left: _glitchAnimation.value * 1.5,
                    child: _GlitchText(
                        text: widget,
                        color: const Color(0xFFe91e63).withOpacity(0.85))),
                Positioned(
                  bottom: _glitchAnimation.value,
                  left: _glitchAnimation.value,
                  child: BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaX: _glitchAnimation.value,
                          sigmaY: _glitchAnimation.value),
                      child: _GlitchText(
                          text: widget,
                          color: const Color(0xFFffffff).withOpacity(0.1))),
                ),
                Opacity(
                    opacity:
                        1.7 - (0.7 + (_glitchAnimation.value) * 0.1).toDouble(),
                    child: _GlitchText(
                        text: widget, color: const Color(0xFFdedede))),
              ],
            ),
          ),
        ),
      );
}

class _GlitchText extends StatelessWidget {
  const _GlitchText({Key key, @required this.text, this.color})
      : super(key: key);

  final Color color;
  final _Glitch text;

  @override
  Widget build(BuildContext context) => DefaultTextStyle(
      child: text.child,
      style: Theme.of(context)
          .textTheme
          .headline1
          .copyWith(color: color, height: 0.8));
} */
