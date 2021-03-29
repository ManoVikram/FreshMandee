import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../GlobalConfig.dart';
import '../widgets/productImageAndIcons.dart';
import '../widgets/titleAndPrice.dart';
import '../widgets/buyAndDescriptionButtons.dart';

import '../models/bloc/productDetailsBloc/productDetails_bloc.dart';
import '../models/bloc/addToCartBloc/addToCart_bloc.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = "/productDetailsScreen";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextEditingController _quantityController = TextEditingController();

    final addToCartBloc = BlocProvider.of<AddToCartBloc>(context);

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, productDetailsState) {
            return productDetailsState?.productData == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      ProductImageAndIcons(
                        size: size,
                        image: productDetailsState?.productData?.image,
                      ),
                      TitleAndPrice(
                        title: productDetailsState?.productData?.name,
                        country: "India",
                        price: productDetailsState?.productData?.price * 1.0,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      BuyAndDescriptionButtons(
                        size: size,
                        buyNowOnPressed: () async {
                          // TODO: ERROR in this part
                          int quantity;

                          await showDialog(
                            context: context,
                            builder: (contxt) => SimpleDialog(
                              title: Text(
                                "Quantity",
                                style: TextStyle(
                                  fontFamily: GoogleFonts.exo2().fontFamily,
                                  fontSize: 18.0,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              backgroundColor: Colors.teal[50],
                              contentPadding: EdgeInsets.all(10.0),
                              children: [
                                TextField(
                                  controller: _quantityController,
                                  keyboardType: TextInputType.number,
                                ),
                                Center(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "Confirm",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.oxygen().fontFamily,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );

                          addToCartBloc.add(
                            AddToCart(
                              firebaseUID:
                                  FirebaseAuth.instance.currentUser.uid,
                              productID:
                                  productDetailsState?.productData?.productID,
                              quantity: int.parse(_quantityController.text),
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text("Item successfully added to the cart."),
                              backgroundColor: Colors.greenAccent[400],
                            ),
                          );
                        },
                        descriptionOnPressed: () {},
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
