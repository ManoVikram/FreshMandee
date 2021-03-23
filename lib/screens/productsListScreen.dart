import 'package:flutter/material.dart';

import './productDetailsScreen.dart';
import '../widgets/previousPageButtonIcon.dart';
import '../widgets/customUnderlinedText.dart';
import '../widgets/productCard.dart';

class ProductsListScreen extends StatelessWidget {
  static const String routeName = "/productsListScreen";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final categoryName = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.green[50],
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
                itemBuilder: (contxt, index) => ProductCard(
                  // TODO: Replace these with the data from the API.
                  imageURL: "assets/images/Vegetables.png",
                  productTitle: "ProductTitle",
                  productCost: 100,
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(ProductDetailsScreen.routeName);
                  },
                ),
                itemCount: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
