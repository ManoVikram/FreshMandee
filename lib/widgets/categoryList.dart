import 'package:flutter/material.dart';

import './categoryCard.dart';

import '../screens/productsListScreen.dart';

class CategoryList extends StatelessWidget {
  final Size size;

  const CategoryList({
    Key key,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        // TODO: Fetch the category name and image from API
        itemBuilder: (contxt, index) => CategoryCard(
          category: "Fruits",
          // image: Image.asset("assets/images/Fruit.png"),
          image: Image.network(
            "https://1.bp.blogspot.com/--XgP_lQbubQ/YFnim5In16I/AAAAAAAAGXo/gWYBOyC_3EkH6V6IScAG2M2ve5Z7_p1rwCLcBGAsYHQ/s0/Fruit.png",
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(
              ProductsListScreen.routeName,
              arguments: "CategoryName",
            );
          },
        ),
        itemCount: 5,
      ),
    );
  }
}
