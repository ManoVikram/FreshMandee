import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import './pastOrderTile.dart';

import '../models/bloc/productDetailsBloc/productDetails_bloc.dart';
import '../models/bloc/completeUserDataBloc/completeUserData_bloc.dart';

class PastOrdersList extends StatelessWidget {
  const PastOrdersList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productDetailsBloc = BlocProvider.of<ProductDetailsBloc>(context);
    final completeUserDataBloc = BlocProvider.of<CompleteUserDataBloc>(context);

    Future<void> fetchProductDetails(dynamic product) async {
      await productDetailsBloc.add(
        FetchProductDetails(
          firebaseUID: FirebaseAuth.instance.currentUser.uid,
          productID: product.productID,
        ),
      );

      await Future.delayed(
        Duration(seconds: 3),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      /* child: BlocBuilder<CompleteUserDataBloc, CompleteUserDataState>(
        builder: (context, completeUserDataState) {
          return completeUserDataState?.userData == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : (completeUserDataState?.userData?.productsBought?.length == 0
                  ? Center(
                      child: Text(
                        "No orders yet. Place some new orders.",
                        style: TextStyle(
                          fontFamily: GoogleFonts.oxygenMono().fontFamily,
                          fontSize: 18.0,
                        ),
                      ),
                    )
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.all(6.0),
                      itemBuilder: (contxt, index) {
                        productDetailsBloc.add(
                          FetchProductDetails(
                            firebaseUID: FirebaseAuth.instance.currentUser.uid,
                            productID: completeUserDataState
                                ?.userData?.productsBought[index]?.productID,
                          ),
                        );

                        return BlocBuilder<ProductDetailsBloc,
                            ProductDetailsState>(
                          builder: (contxt, productDetailsState) {
                            // Causing weird output
                            // BlocBuilder rebuilds the whole widget tree
                            // TODO: Resolve this bug
                            return productDetailsState?.productData == null
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : PastOrderListTile(
                                    image:
                                        // "https://i.pinimg.com/originals/cb/33/49/cb3349b86ca661ca61ae9a36d88d70d4.png",
                                        productDetailsState?.productData?.image,
                                    title:
                                        productDetailsState?.productData?.name,
                                    quantity: completeUserDataState?.userData
                                        ?.productsBought[index]?.quantity,
                                    price:
                                        productDetailsState?.productData?.price,
                                  );
                          },
                        );
                      },
                      itemCount: completeUserDataState
                          ?.userData?.productsBought?.length,
                    ));
        },
      ), */
      /* child: completeUserDataBloc?.state == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : (completeUserDataBloc?.state?.userData?.productsBought?.length == 0
              ? Center(
                  child: Text(
                    "No orders yet. Place some new orders.",
                    style: TextStyle(
                      fontFamily: GoogleFonts.oxygenMono().fontFamily,
                      fontSize: 18.0,
                    ),
                  ),
                )
              : ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (contxt, index) {
                    productDetailsBloc.add(
                      FetchProductDetails(
                        firebaseUID: FirebaseAuth.instance.currentUser.uid,
                        productID: completeUserDataBloc
                            ?.state?.userData?.productsBought[index]?.productID,
                      ),
                    );

                    print("Hello $index");

                    print(completeUserDataBloc
                        ?.state?.userData?.productsBought[index]?.productID);
                    print(productDetailsBloc?.state?.productData?.productID);

                    return productDetailsBloc?.state == null
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : (productDetailsBloc?.state?.productData == null
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : PastOrderListTile(
                                image:
                                    // "https://i.pinimg.com/originals/cb/33/49/cb3349b86ca661ca61ae9a36d88d70d4.png",
                                    productDetailsBloc
                                        ?.state?.productData?.image,
                                title: productDetailsBloc
                                    ?.state?.productData?.name,
                                quantity: completeUserDataBloc?.state?.userData
                                    ?.productsBought[index]?.quantity,
                                price: productDetailsBloc
                                    ?.state?.productData?.price,
                              ));
                  },
                  itemCount: completeUserDataBloc
                      ?.state?.userData?.productsBought?.length,
                )), */
      child: completeUserDataBloc?.state?.userData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Builder(
              builder: (contxt) {
                List<PastOrderListTile> productsList = [];

                for (var product
                    in completeUserDataBloc?.state?.userData?.productsBought) {
                  fetchProductDetails(product);

                  productsList.add(
                    PastOrderListTile(
                      image:
                          // "https://i.pinimg.com/originals/cb/33/49/cb3349b86ca661ca61ae9a36d88d70d4.png",
                          productDetailsBloc?.state?.productData?.image,
                      title: productDetailsBloc?.state?.productData?.name,
                      quantity: product?.quantity,
                      price: productDetailsBloc?.state?.productData?.price,
                    ),
                  );
                }

                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => productsList[index],
                  itemCount: productsList.length,
                );
              },
            ),
    );
  }
}
