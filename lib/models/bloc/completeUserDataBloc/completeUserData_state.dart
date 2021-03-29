part of 'completeUserData_bloc.dart';

class BoughtProductData {
  final String productID;
  final int quantity;

  BoughtProductData({
    this.productID,
    this.quantity,
  });
}

class UserData {
  final String firebaseUID;
  final String name;
  final String email;
  final String phoneNumber;
  final String location;
  final bool isFarmer;
  final List<BoughtProductData> productsBought;

  UserData({
    this.firebaseUID,
    this.name,
    this.email,
    this.phoneNumber,
    this.location,
    this.isFarmer,
    this.productsBought,
  });
}

class CompleteUserDataState extends Equatable {
  final UserData userData;

  CompleteUserDataState({
    this.userData,
  });

  @override
  List<Object> get props => [userData];
}
