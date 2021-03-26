import 'package:flutter/material.dart';

import './pastOrderTile.dart';

class PastOrdersList extends StatelessWidget {
  const PastOrdersList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.all(6.0),
        itemBuilder: (contxt, index) => PastOrderListTile(
          image:
              "https://i.pinimg.com/originals/cb/33/49/cb3349b86ca661ca61ae9a36d88d70d4.png",
          title: "Pikachu",
          quantity: 5,
          price: 100,
        ),
        itemCount: 5,
      ),
    );
  }
}
