import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/bloc/placeOrderBloc/placeOrder_bloc.dart';
import '../models/bloc/viewCartBloc/viewCart_bloc.dart';

class NeumorphicRoundedButton extends StatelessWidget {
  final String text;

  const NeumorphicRoundedButton({
    Key key,
    @required this.size,
    @required this.text,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final placeOrderBloc = BlocProvider.of<PlaceOrderBloc>(context);
    final viewCartBloc = BlocProvider.of<ViewCartBloc>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 16.0,
      ),
      child: NeumorphicButton(
        onPressed: () {
          placeOrderBloc.add(
            PlaceOrder(
              firebaseUID: FirebaseAuth.instance.currentUser.uid,
            ),
          );

          viewCartBloc.add(
            ViewCart(firebaseUID: FirebaseAuth.instance.currentUser.uid),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.greenAccent[400],
              content: Text("Order Placed Successfully."),
            ),
          );
        },
        pressed: true,
        minDistance: -15,
        padding: EdgeInsets.all(0.0),
        style: NeumorphicStyle(
          shadowLightColorEmboss: Colors.white,
          shadowDarkColorEmboss: Colors.blueGrey[100],
          color: Colors.transparent,
          depth: 20,
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(30.0),
          ),
          shape: NeumorphicShape.convex,
        ),
        child: Container(
          height: size.height * 0.09,
          width: double.infinity,
          margin: EdgeInsets.all(0.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.deepPurple,
                Colors.deepPurple[200],
              ],
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: GoogleFonts.oxygen().fontFamily,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
