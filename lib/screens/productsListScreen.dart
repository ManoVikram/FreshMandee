import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './productDetailsScreen.dart';
import '../widgets/previousPageButtonIcon.dart';
import '../widgets/customUnderlinedText.dart';
import '../widgets/productCard.dart';

import '../models/bloc/productsUnderCategoryBloc/productsUnderCategory_bloc.dart';
import '../models/bloc/productDetailsBloc/productDetails_bloc.dart';

class ProductsListScreen extends StatelessWidget {
  static const String routeName = "/productsListScreen";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final productDetailsBloc = BlocProvider.of<ProductDetailsBloc>(context);

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
              BlocBuilder<ProductsUnderCategoryBloc,
                  ProductsUnderCategoryState>(
                builder: (context, productsUnderCategoryState) {
                  return productsUnderCategoryState?.products == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            maxCrossAxisExtent: size.width / 2.0,
                          ),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (contxt, index) => ProductCard(
                            // imageURL: "assets/images/Vegetables.png",
                            imageURL: productsUnderCategoryState
                                ?.products[index]?.image,
                            productTitle: productsUnderCategoryState
                                ?.products[index]?.name,
                            productCost: productsUnderCategoryState
                                ?.products[index]?.price,
                            onPressed: () {
                              productDetailsBloc.add(
                                FetchProductDetails(
                                  firebaseUID:
                                      FirebaseAuth.instance.currentUser.uid,
                                  categoryID: productsUnderCategoryState
                                      ?.products[index]?.categoryID,
                                  productID: productsUnderCategoryState
                                      ?.products[index]?.productID,
                                ),
                              );

                              Navigator.of(context)
                                  .pushNamed(ProductDetailsScreen.routeName);
                            },
                          ),
                          itemCount:
                              productsUnderCategoryState?.products?.length,
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
