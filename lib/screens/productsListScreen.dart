import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/previousPageButtonIcon.dart';
import '../widgets/customUnderlinedText.dart';

class ProductsListScreen extends StatelessWidget {
  static const String routeName = "/productsListScreen";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final categoryName = ModalRoute.of(context).settings.arguments;

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PreviousPageIconButton(
                color: Colors.green,
              ),
              SizedBox(
                height: 8.0,
              ),
              CustomUnderlinedText(
                // TODO: Replace it with the name of the category
                text: categoryName,
                fontSize: 24.0,
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  maxCrossAxisExtent: size.width / 2.0,
                ),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (contxt, index) => Card(
                  margin: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 7.0,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(6.0),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.blueGrey[50],
                        ),
                        child: Image.asset(
                          // Replace it with the image of that product
                          "assets/images/Vegetables.png",
                          fit: BoxFit.contain,
                          height: 150,
                          width: 150,
                        ),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        // TODO: Replace it with the title of the product
                        "ProductTitle",
                        style: TextStyle(
                          fontFamily: GoogleFonts.oxygen().fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        // TODO: Replace it with the price of that product
                        "₹ Price",
                        style: TextStyle(
                          fontFamily: GoogleFonts.oxygen().fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                itemCount: 5,
              ),
              /* ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (contxt, index) => Card(
                  margin: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 7.0,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/Vegetables.png",
                      ),
                    ],
                  ),
                ),
                itemCount: 2,
              ), */
            ],
          ),
        ),
      ),
    );
  }
}
