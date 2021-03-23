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
          // image: Image.asset("assets/images/Fruit.png"),
          image: Image.network(
            "https://lh3.googleusercontent.com/BUeOl5m2mlDPDlnnbyEAqrEVKhTi9G-gEqx-f7woRMG6ksjtyJv1wX4O2C9VeTwf2vXArdCH87NVCpFadDCLMpFmBjKtzACAdWotFQY1Tqw_5GmUjgALSAG7TyWMSXOaIbLFNQFdvQGhd3zMRB1IBu3TMrwtnyy_-UW-WKV02--FeH0WiG5DmvnkoC0jtKoG5V3F_oPS_i5PJvA7bh9nnAJYySpqTpLbthAcIiw8Hm51i2MoPeTqkA9vrrEyPKhsSvRa5POuVK-ItF4Rs1xzq_JMsnqAXULlcGvZoXcOV_aYd43UYv4FYuJlzn_g9zXGVCZulhJ6r__tr-NVaEq8pxJKJhYGuKD6kFpZNHfKYBRqh2ib864-HgvJKj01pHkMNomibCZ11gpiWN6kDP4JL0adO_d1-e7SfzKAOodgpDP8TWZQn2DQgxM_ZweDOh-ru01o0kVk0JZIQoVsO888e3sbCMWoIdqihnFet3HJCoYE2yDCV0sEXLHv9vPftYa2RWPUTTZF-joToIvifMhFDnaiUP_F6gf2hxKAokI8tInyRwCP7yTW7C1BsKN1Xi3Q8IFQw00Y9u0Axi5gc4GyNI3LJLDb_8VFBm7TjJA3llHoOAQA_7W4pk8izSeKkySv_Jqc8EsniBOUc5MZ7ukhoP6g6FthkWauB_Z1nSL9tgFx206h_KvgWA5ySg_0x1MVBiAn7QECimuM0VAoVNeHNQ=w198-h182-no?authuser=1",
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
