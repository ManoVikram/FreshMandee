import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/bloc/viewCartBloc/viewCart_bloc.dart';
import '../models/bloc/productDetailsBloc/productDetails_bloc.dart';

class UserCartList extends StatelessWidget {
  const UserCartList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productDetailsBloc = BlocProvider.of<ProductDetailsBloc>(context);

    return BlocBuilder<ViewCartBloc, ViewCartState>(
      builder: (context, viewCartState) {
        return (viewCartState?.cartProducts == null &&
                viewCartState?.comment == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ((viewCartState?.comment == null &&
                    viewCartState?.cartProducts?.length != 0)
                ? ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (contxt, index) {
                      productDetailsBloc.add(
                        FetchProductDetails(
                          firebaseUID: FirebaseAuth.instance.currentUser.uid,
                          productID:
                              viewCartState?.cartProducts[index]?.productID,
                        ),
                      );

                      return BlocBuilder<ProductDetailsBloc,
                          ProductDetailsState>(
                        builder: (context, productDetailsState) {
                          return productDetailsState?.productData == null
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: ListTile(
                                      tileColor:
                                          Colors.blueGrey[50].withOpacity(0.8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      leading: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.network(
                                          // "https://i.pinimg.com/originals/cb/33/49/cb3349b86ca661ca61ae9a36d88d70d4.png",
                                          productDetailsState
                                              ?.productData?.image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      title: Text(
                                        productDetailsState?.productData?.name,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.exo2().fontFamily,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Text(
                                        "Quantity: ${viewCartState?.cartProducts[index]?.quantity}",
                                        style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.exo().fontFamily,
                                        ),
                                      ),
                                      trailing: Text(
                                        "₹ ${productDetailsState?.productData?.price}",
                                        style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.exo2().fontFamily,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                        },
                      );
                    },
                    itemCount: viewCartState?.cartProducts?.length,
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        viewCartState?.cartProducts?.length != 0
                            ? viewCartState?.comment
                            : "Your cart is empty. Add new products.",
                        style: TextStyle(
                          fontFamily: GoogleFonts.oxygen().fontFamily,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ));
      },
    );
  }
}
