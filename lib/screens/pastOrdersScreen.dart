import 'package:flutter/material.dart';

import '../widgets/previousPageButtonIcon.dart';
import '../widgets/cartTitle.dart';
import '../widgets/pastOrdersList.dart';

class PastOrdersScreen extends StatefulWidget {
  static const String routeName = "/pastOrdersScreen";

  @override
  _PastOrdersScreenState createState() => _PastOrdersScreenState();
}

class _PastOrdersScreenState extends State<PastOrdersScreen> {
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
                color: Colors.purpleAccent,
              ),
              SizedBox(
                height: 16.0,
              ),
              CartTitle(
                text1: "Past",
                text2: "Orders",
                text3: "📦",
              ),
              SizedBox(
                height: 18.0,
              ),
              PastOrdersList(),
            ],
          ),
        ),
      ),
    );
  }
}
