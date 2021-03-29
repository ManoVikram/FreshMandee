import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../../GlobalConfig.dart';

part 'viewCart_event.dart';
part 'viewCart_state.dart';

class ViewCartBloc extends Bloc<ViewCartEvent, ViewCartState> {
  ViewCartBloc() : super(ViewCartState());

  @override
  Stream<ViewCartState> mapEventToState(ViewCartEvent event) async* {
    if (event is ViewCart) {
      // const String url = "http://$API_HOST/api/user/cart/allProducts";
      const String url =
          "https://kisanmandee.herokuapp.com/api/user/cart/allProducts";

      final response = await http.post(
        url,
        body: {
          "firebaseUID": event.firebaseUID,
        },
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      print(extractedData);

      if (extractedData["error"] != null) {
        yield ViewCartState(
          comment: "Your cart is empty. Add new products.",
        );
      }

      List<ProductData> loadedData = [];
      for (var i = 0; i < extractedData["cartItems"]?.length; i++) {
        ProductData productData = ProductData(
          productID: extractedData["cartItems"][i]["productID"],
          quantity: extractedData["cartItems"][i]["quantity"],
        );

        loadedData.add(productData);
      }

      yield ViewCartState(
        cartProducts: loadedData,
      );
    }
  }
}
