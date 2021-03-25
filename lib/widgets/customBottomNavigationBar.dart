import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/homeScreen.dart';
import '../screens/userCartScreen.dart';
import '../screens/userAccountScreen.dart';

import '../models/bloc/viewCartBloc/viewCart_bloc.dart';

import '../colorPalette.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewCartBloc = BlocProvider.of<ViewCartBloc>(context);

    return Container(
      padding: EdgeInsets.only(
        left: 40.0,
        right: 40.0,
      ),
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35.0,
            color: Colors.tealAccent.withOpacity(0.2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.home,
              color: Colors.deepOrangeAccent[100],
            ),
            /* icon: Icon(
              Icons.home_outlined,
            ), */
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                HomeScreen.routeName,
                (route) => false,
              );
            },
          ),
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.shoppingCart,
              color: Colors.deepOrangeAccent[100],
            ),
            onPressed: () {
              viewCartBloc.add(
                ViewCart(firebaseUID: FirebaseAuth.instance.currentUser.uid),
              );

              Navigator.of(context).pushNamed(UserCartScreen.routeName);
            },
          ),
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.userAlt,
              color: Colors.deepOrangeAccent[100],
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(UserAccountScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
