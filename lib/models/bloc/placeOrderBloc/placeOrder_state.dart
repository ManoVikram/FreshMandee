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

class PlaceOrderState extends Equatable {
  final UserData userData;

  PlaceOrderState({
    this.userData,
  });

  @override
  List<Object> get props => [userData];
}
