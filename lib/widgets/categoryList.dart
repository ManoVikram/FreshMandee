import 'package:flutter/material.dart';

import './categoryCard.dart';

class CategoryList extends StatelessWidget {
  final Size size;

  const CategoryList({
    Key key,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // TODO: Fetch the category name and image from API
          CategoryCard(
            category: "Fruits",
            image: Image.asset("assets/images/Fruit.png"),
            onPressed: () {},
          ),
          CategoryCard(
            category: "Vegetables",
            image: Image.asset("assets/images/Vegetables.png"),
            onPressed: () {},
          ),
          CategoryCard(
            category: "Fruits",
            image: Image.asset("assets/images/Fruit.png"),
            onPressed: () {},
          ),
          CategoryCard(
            category: "Vegetables",
            image: Image.asset("assets/images/Vegetables.png"),
            onPressed: () {},
          ),
        ],
      ),
    ); */
    return Container(
      height: size.height * 0.25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        // TODO: Fetch the category name and image from API
        itemBuilder: (contxt, index) => CategoryCard(
          category: "Fruits",
          image: Image.asset("assets/images/Fruit.png"),
          onPressed: () {},
        ),
        itemCount: 5,
      ),
    );
  }
}
