part of 'placeOrder_bloc.dart';

class UserData {
  final String firebaseUID;
  final String name;
  final String email;
  final String phoneNumber;
  final List<Map<String, dynamic>> productsBought;

  UserData({
    this.firebaseUID,
    this.name,
    this.email,
    this.phoneNumber,
    this.productsBought,
  });
}

/* class PlaceOrderState extends Equatable {
  final UserData userData;

  PlaceOrderState({
    this.userData,
  });

  @override
  List<Object> get props => [userData];
} */

abstract class PlaceOrderState extends Equatable {
  const PlaceOrderState();

  @override
  List<Object> get props => [];
}

class PlaceOrderInitial extends PlaceOrderState {
  const PlaceOrderInitial();
}

class PlaceUserOrderState extends PlaceOrderState {
  final UserData userData;

  PlaceUserOrderState({
    this.userData,
  });
}

class ViewAllOrdersState extends PlaceOrderState {
  final Map<String, dynamic> allOrders;

  ViewAllOrdersState({
    this.allOrders,
  });
}
