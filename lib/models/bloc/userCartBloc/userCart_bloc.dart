import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../../GlobalConfig.dart';

part 'userCart_event.dart';
part 'userCart_state.dart';

class UserCartBloc extends Bloc<UserCartEvent, UserCartState> {
  UserCartBloc() : super(UserCartInitial());

  @override
  Stream<UserCartState> mapEventToState(UserCartEvent event) async* {
    if (event is AddToCart) {
      // const String url = "http://$API_HOST/api/user/cart/add";
      const String url = "https://kisanmandee.herokuapp.com/api/user/cart/add";

      final response = await http.post(
        url,
        body: {
          "firebaseUID": event.firebaseUID,
          "productID": event.productID,
          "quantity": event.quantity,
        },
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      yield AddToCartState(
        firebaseUID: extractedData["firebaseUID"],
        cartItems: extractedData["cart"]["productsList"],
      );
    } else if (event is RemoveFromCart) {
      const String url = "http://$API_HOST/api/user/cart/removeProduct";

      final response = await http.post(
        url,
        body: {
          "firebaseUID": event.firebaseUID,
          "productID": event.productID,
        },
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      yield RemoveFromCartState();
    } else if (event is ViewCart) {
      const String url = "http://$API_HOST/api/user/cart/allProducts";

      final response = await http.post(
        url,
        body: {
          "firebaseUID": event.firebaseUID,
        },
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      yield ViewCartState(
        cartItems: extractedData["cartItems"],
      );
    }
  }
}
