import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './listTileDivider.dart';
import '../screens/userAccountScreen.dart';
import '../screens/pastOrdersScreen.dart';
import '../screens/contactUsScreen.dart';

class CustomDrawer extends StatelessWidget {
  final String name;
  final String email;

  const CustomDrawer({
    Key key,
    this.name,
    this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(name),
            accountEmail: Text(email),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.indigoAccent,
              foregroundImage: AssetImage("assets/images/Boy.png"),
            ),
            currentAccountPictureSize: Size.square(72.0),
            onDetailsPressed: () {
              Navigator.of(context).pushNamed(UserAccountScreen.routeName);
            },
          ),
          ListTileDivider(
            text: "Orders",
            icon: Icons.bubble_chart,
            onPressed: () {
              Navigator.of(context).pushNamed(PastOrdersScreen.routeName);
            },
          ),
          ListTileDivider(
            text: "Get In Touch",
            icon: Icons.contact_phone_outlined,
            onPressed: () {
              Navigator.of(context).pushNamed(ContactUsScreen.routeName);
            },
          ),
          ListTileDivider(
            text: "About Us",
            icon: Icons.group,
            onPressed: () {},
          ),
          Spacer(),
          ListTileDivider(
            text: "Sign Out",
            icon: Icons.logout,
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
