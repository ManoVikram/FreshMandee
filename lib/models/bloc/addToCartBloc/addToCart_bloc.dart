import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../../GlobalConfig.dart';

part 'addToCart_event.dart';
part 'addToCart_state.dart';

class AddToCartBloc extends Bloc<AddToCartEvent, AddToCartState> {
  AddToCartBloc() : super(AddToCartState());

  @override
  Stream<AddToCartState> mapEventToState(AddToCartEvent event) async* {
    if (event is AddToCart) {
      // const String url = "http://$API_HOST/api/user/cart/add";
      const String url = "https://kisanmandee.herokuapp.com/api/user/cart/add";

      print(url);

      final response = await http.post(
        url,
        body: {
          "firebaseUID": event.firebaseUID,
          "productID": event.productID,
          "quantity": event.quantity,
        },
      );

      print("A");
      print(response.body);
      print("B");

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      print("C");
      print(extractedData);
      print("D");

      List<CartProductData> cartProducts = [];
      for (var i = 0; i < extractedData["cart"]["productsList"]?.length; i++) {
        CartProductData cartProductData = CartProductData(
          productID: extractedData["cart"]["productsList"][i]["productID"],
          quantity: extractedData["cart"]["productsList"][i]["quantity"],
        );

        cartProducts.add(cartProductData);
      }

      CartData loadedData = CartData(
        cartID: extractedData["cart"]["_id"],
        userID: extractedData["cart"]["userID"],
        productsInCart: cartProducts,
      );

      yield AddToCartState(
        cartData: loadedData,
      );
    }
  }
}
