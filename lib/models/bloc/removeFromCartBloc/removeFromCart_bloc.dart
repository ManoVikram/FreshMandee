import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../../GlobalConfig.dart';

part 'removeFromCart_event.dart';
part 'removeFromCart_state.dart';

class RemoveFromCartBloc
    extends Bloc<RemoveFromCartEvent, RemoveFromCartState> {
  RemoveFromCartBloc() : super(RemoveFromCartState());

  @override
  Stream<RemoveFromCartState> mapEventToState(
      RemoveFromCartEvent event) async* {
    if (event is RemoveProduct) {
      // const String url = "http://$API_HOST/api/user/cart/removeProduct";
      const String url =
          "https://pacific-shore-21505.herokuapp.com/api/user/cart/removeProduct";

      final response = await http.post(
        url,
        body: {
          "firebaseUID": event.firebaseUID,
          "productID": event.productID,
        },
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      yield RemoveFromCartState();
    }
  }
}
