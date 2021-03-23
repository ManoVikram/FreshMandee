import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../colorPalette.dart';

class HomeHeader extends StatelessWidget {
  final Size size;
  final String userName;

  HomeHeader({
    this.size,
    this.userName,
  });

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(bottom: 20.0 * 2.5),
      height: size.height * 0.25,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.25 - 27,
            padding: EdgeInsets.only(
              left: 28.0,
              right: 28.0,
              bottom: 36.0,
            ),
            decoration: BoxDecoration(
              color: primaryGreen,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36.0),
                bottomRight: Radius.circular(36.0),
              ),
            ),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi👋",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.white,
                            // fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      // TODO: Replace with user name.
                      userName,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                Spacer(),
                CircleAvatar(
                  radius: 36.0,
                  backgroundColor: Colors.tealAccent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(36.0),
                    // TODO: Replace with user image
                    child: Image.asset("assets/images/Boy.png"),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              height: 54,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50.0,
                    color: primaryGreen.withOpacity(0.22),
                  ),
                ],
              ),
              child: TextField(
                onChanged: (value) {},
                cursorColor: Colors.cyanAccent,
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: primaryGreen.withOpacity(0.5),
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  suffixIcon: Icon(
                    FontAwesomeIcons.search,
                    color: Colors.greenAccent.withOpacity(0.7),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
