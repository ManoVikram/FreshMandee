import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './categoryCard.dart';
import '../screens/productsListScreen.dart';

import '../models/bloc/allCategoriesBloc/allCategories_bloc.dart';
import '../models/bloc/productsUnderCategoryBloc/productsUnderCategory_bloc.dart';

class CategoryList extends StatelessWidget {
  final Size size;

  const CategoryList({
    Key key,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsUnderCategoryBloc =
        BlocProvider.of<ProductsUnderCategoryBloc>(context);

    return BlocBuilder<AllCategoriesBloc, AllCategoriesState>(
      builder: (context, allCategoriesState) {
        return allCategoriesState?.categoryData == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                height: size.height * 0.25,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (contxt, index) => CategoryCard(
                    category: allCategoriesState?.categoryData[index].name,
                    // image: Image.asset("assets/images/Fruit.png"),
                    image: Image.network(
                      // "https://1.bp.blogspot.com/--XgP_lQbubQ/YFnim5In16I/AAAAAAAAGXo/gWYBOyC_3EkH6V6IScAG2M2ve5Z7_p1rwCLcBGAsYHQ/s0/Fruit.png",
                      allCategoriesState?.categoryData[index].image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    onPressed: () {
                      productsUnderCategoryBloc.add(
                        FetchProducts(
                          firebaseUID: FirebaseAuth.instance.currentUser.uid,
                          categoryID: allCategoriesState
                              ?.categoryData[index]?.categoryID,
                        ),
                      );

                      Navigator.of(context).pushNamed(
                        ProductsListScreen.routeName,
                        arguments: "CategoryName",
                      );
                    },
                  ),
                  itemCount: allCategoriesState?.categoryData?.length,
                ),
              );
      },
    );
  }
}
