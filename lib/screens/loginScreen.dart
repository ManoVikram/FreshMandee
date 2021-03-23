import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../colorPalette.dart';

import './signupScreen.dart';
import './otpScreen.dart';
import '../models/provider/phoneNumber.dart';
import '../models/bloc/completeUserDataBloc/completeUserData_bloc.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/loginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool _isLoading = false;
  UserCredential _userCredential;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /* Future<void> _phoneAuthentication() async {
    await auth.verifyPhoneNumber(
      phoneNumber: "+91${_phoneNumberController.text}",
      timeout: Duration(
        seconds: 30,
      ),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int resendToken) async {
        /* // Update the UI - wait for the user to enter the SMS code
        String smsCode = "";

        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);

        // Sign the user in (or link) with the credential
        await auth.signInWithCredential(phoneAuthCredential); */
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        print(verificationID);
      },
    );
  } */

  Future<void> _signInUser() async {
    setState(() {
      _isLoading = true;
    });

    try {
      _userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      print(_userCredential);
    } on FirebaseAuthException catch (e) {
      String errorMessage = "ERROR: Enter a correct Email and Password.";

      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      }

      if (errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("ERROR: " + errorMessage),
            backgroundColor: Theme.of(context).errorColor,
          ),
        );
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  Widget _textField([bool isPassword = false]) {
    return TextField(
      controller: isPassword ? _passwordController : _emailController,
      /* inputFormatters: [
        LengthLimitingTextInputFormatter(10),
      ],
      maxLength: 10, */
      onChanged: (value) {
        // phoneNumber.setPhoneNumber = value;
      },
      keyboardType: isPassword
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      autocorrect: false,
      enableSuggestions: false,
      cursorColor: Colors.deepOrangeAccent,
      showCursor: true,
      obscureText: isPassword ? true : false,
      style: TextStyle(
        fontFamily: GoogleFonts.oxygen().fontFamily,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        fillColor: Colors.white,
        /* prefix: Container(
          padding: EdgeInsets.only(right: 8.0),
          child: Text("+91"),
        ), */
        contentPadding: EdgeInsets.all(16.0),
        labelText: isPassword ? "Password" : "Email",
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PhoneNumber phoneNumber = context.watch<PhoneNumber>();

    final completeUserDataBloc = BlocProvider.of<CompleteUserDataBloc>(context);

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
                  height: size.height * 0.07,
                ),
                _textField(),
                _textField(true),
                SizedBox(
                  height: size.height * 0.08,
                ),
                Center(
                  child: Container(
                    width: size.width * 0.8,
                    child: ElevatedButton(
                      onPressed: () async {
                        await _signInUser();
                        await completeUserDataBloc.add(
                          GetCompleteUserData(
                            firebaseUID: _userCredential.user.uid,
                          ),
                        );
                      },
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
                          vertical: 14.0,
                          horizontal: 40.0,
                        ),
                      ),
                      child: _isLoading
                          ? Theme(
                              data: Theme.of(context).copyWith(
                                accentColor: Colors.white,
                              ),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : Text(
                              "LOG IN",
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
