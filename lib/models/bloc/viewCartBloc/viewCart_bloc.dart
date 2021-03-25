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
      const String url = "http://$API_HOST/api/user/cart/allProducts";

      final response = await http.post(
        url,
        body: {
          "firebaseUID": event.firebaseUID,
        },
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      List<ProductData> loadedData = [];
      for (var i = 0; i < extractedData["cartItems"]; i++) {
        ProductData productData = ProductData(
          productID: extractedData["cartItems"]["productID"],
          quantity: extractedData["cartItems"]["quantity"],
        );

        loadedData.add(productData);
      }

      yield ViewCartState(
        cartProducts: loadedData,
      );
    }
  }
}
