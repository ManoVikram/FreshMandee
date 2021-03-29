import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../../GlobalConfig.dart';

part 'placeOrder_event.dart';
part 'placeOrder_state.dart';

class PlaceOrderBloc extends Bloc<PlaceOrderEvent, PlaceOrderState> {
  PlaceOrderBloc() : super(PlaceOrderInitial());

  @override
  Stream<PlaceOrderState> mapEventToState(PlaceOrderEvent event) async* {
    if (event is PlaceOrder) {
      // const String url = "http://$API_HOST/api/user/placeOrder";
      const String url =
          "https://kisanmandee.herokuapp.com/api/user/placeOrder";

      final response = await http.post(
        url,
        body: {
          "firebaseUID": event.firebaseUID,
        },
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      UserData loadedData = UserData(
        firebaseUID: extractedData["firebaseUID"] ?? null,
        name: extractedData["name"] ?? null,
        email: extractedData["email"] ?? null,
        phoneNumber: extractedData["phoneNumber"] ?? null,
        productsBought: extractedData["productsBuy"] ?? null,
      );

      yield PlaceUserOrderState(
        userData: loadedData,
      );
    } else if (event is ViewOrders) {
      const String url = "http://$API_HOST/api/user/pastOrders";

      final response = await http.post(
        url,
        body: {
          "firebaseUID": event.firebaseUID,
        },
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      yield ViewAllOrdersState(
        allOrders: extractedData,
      );
    }
  }
}
