import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_farm_market/models/bloc/completeUserDataBloc/completeUserData_bloc.dart';

import '../colorPalette.dart';

import '../widgets/homeHeader.dart';
import '../widgets/customUnderlinedText.dart';
import '../widgets/categoryList.dart';
import '../widgets/discountList.dart';
import '../widgets/popularDeals.dart';
import '../widgets/customBottomNavigationBar.dart';
import '../widgets/customDrawer.dart';

import '../models/bloc/updateUserDataBloc/updateUserData_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/homeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    Widget customAppBar() {
      return AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0.0,
        leading: Builder(
          builder: (contxt) => IconButton(
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 3,
                  width: 18,
                  color: white,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  height: 3,
                  width: 12,
                  color: white,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  height: 3,
                  width: 20,
                  color: white,
                ),
              ],
            ),
            onPressed: () {
              // Scaffold.of(context).openDrawer();
              return _scaffoldKey.currentState.openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: customAppBar(),
      drawer: BlocBuilder<CompleteUserDataBloc, CompleteUserDataState>(
        builder: (context, userDataState) {
          return CustomDrawer(
            /* name: "User Name",
            email: "test@test.com", */
            name: userDataState.userData?.name ?? "HUMAN",
            email: userDataState.userData?.email ?? "",
          );
        },
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            HomeHeader(
              size: size,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomUnderlinedText(
                    text: "Categories",
                  ),
                  InkWell(
                    onTap: () {},
                    child: Chip(
                      backgroundColor: primaryGreen,
                      label: Text(
                        "See all",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CategoryList(
              size: size,
            ),
            DiscountList(size: size),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomUnderlinedText(
                  text: "Popular deals",
                ),
              ),
            ),
            PopularDeals(size: size),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
