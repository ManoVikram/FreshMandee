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
      const String url = "http://$API_HOST/api/user/cart/add";

      final response = await http.post(
        url,
        body: {
          "firebaseUID": event.firebaseUID,
          "productID": event.productID,
          "quantity": event.quantity,
        },
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      CartData loadedData = CartData(
        cartID: extractedData["cart"]["_id"],
        userID: extractedData["cart"]["userID"],
        productsInCart: CartProductData(
          quantity: extractedData["cart"]["productsList"]["quantity"],
          productID: extractedData["cart"]["productsList"]["productID"],
        ),
      );

      yield AddToCartState(
        cartData: loadedData,
      );
    }
  }
}
